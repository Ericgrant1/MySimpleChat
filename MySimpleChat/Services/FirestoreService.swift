//
//  FirestoreService.swift
//  MySimpleChat
//
//  Created by Eric Grant on 13.07.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private var waitingChatsRef: CollectionReference {
        return db.collection(["users", currentUser.id, "waitingChats"].joined(separator: "/"))
    }
    
    var currentUser: ModelUser!
    
    func getUserData(user: User, completion: @escaping (Result<ModelUser, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let modelUser = ModelUser(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToModelUser))
                    return
                }
                self.currentUser = modelUser
                completion(.success(modelUser))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
    
    func saveProfile(id: String,
                     email: String,
                     username: String?,
                     avatarImage: UIImage?,
                     description: String?,
                     sex: String?,
                     completion: @escaping(Result<ModelUser, Error>) -> Void) {
        
        guard Validation.isFieled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notPopulated))
            return
        }
        
        guard avatarImage != #imageLiteral(resourceName: "avatar") else {
            completion(.failure(UserError.photoNotExist))
            return
        }
        
        var modelUser = ModelUser(username: username!,
                                  email: email,
                                  avatarImageString: "not exist",
                                  description: description!,
                                  sex: sex!,
                                  id: id)
        StorageService.shared.upload(image: avatarImage!) { (result) in
            switch result {
            case .success(let url):
                modelUser.avatarImageString = url.absoluteString
                self.usersRef.document(modelUser.id).setData(modelUser.representation) { (error) in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(modelUser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        } // StorageService
    } // saveProfile
    
    func createWaitingChat(message: String, receiver: ModelUser, completion: @escaping (Result<Void, Error>) -> Void) {
        let reference = db.collection(["users", receiver.id, "waitingChats"].joined(separator: "/"))
        let messageReference = reference.document(self.currentUser.id).collection("messages")
        
        let message = ModelMessage(user: currentUser, content: message)
        let chat = MyChat(friendUsername: currentUser.username,
                          friendImageStringURL: currentUser.avatarImageString,
                          lastMessageContent: message.content,
                          friendId: currentUser.id)
        
        reference.document(currentUser.id).setData(chat.representation) { (error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            messageReference.addDocument(data: message.representation) { (error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.success(Void()))
            }
        }
    }
    
    func deleteWaitingChat(chat: MyChat, completion: @escaping (Result<Void, Error>) -> Void) {
        waitingChatsRef.document(chat.friendId).delete { (error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(Void()))
            self.deleteMessages(chat: chat, completion: completion)
        }
    }
    
    func deleteMessages(chat: MyChat, completion: @escaping (Result<Void, Error>) -> Void) {
        let reference = waitingChatsRef.document(chat.friendId).collection("messages")
        
        getWaitingChatMessages(chat: chat) { (result) in
            switch result {
            case .success(let messages):
                for messages in messages {
                    guard let documentId = messages.id else { return }
                    let messageRef = reference.document(documentId)
                    messageRef.delete { (error) in
                        if let error = error {
                            completion(.failure(error))
                            return
                        }
                        completion(.success(Void()))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getWaitingChatMessages(chat: MyChat, completion: @escaping (Result<[ModelMessage], Error>) -> Void) {
        let reference = waitingChatsRef.document(chat.friendId).collection("messages")
        var messages = [ModelMessage]()
        reference.getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            for document in querySnapshot!.documents {
                guard let message = ModelMessage(document: document) else { return }
                messages.append(message)
            }
            completion(.success(messages))
        }
    }
}
