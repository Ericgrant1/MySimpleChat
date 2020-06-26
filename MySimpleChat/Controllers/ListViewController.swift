//
//  ListViewController.swift
//  MySimpleChat
//
//  Created by Eric Grant on 24.06.2020.
//  Copyright © 2020 Eric Grant. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum Section: Int, CaseIterable {
    case waitingChats
    case activeChats
}

struct MyChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MyChat, rhs: MyChat) -> Bool {
        return lhs.id == rhs.id
    }
}

private var reuseIdentifierFirst = "ListCell1"
private var reuseIdentifierSecond = "ListCell2"

class ListViewController: UIViewController {
    
    // MARK: - Properties
    
    let activeChats = Bundle.main.decode([MyChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MyChat].self, from: "waitingChats.json")
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MyChat>?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        configureCollectionView()
        setupDataSource()
        reloadData()
    }
    
    // MARK: - Helpers
    
    private func setupSearchBar() {
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCellCompositionLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierFirst)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierSecond)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MyChat>()
        
        snapshot.appendSections([.waitingChats, .activeChats])
        
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
}

// MARK: - Data Source

extension ListViewController {
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MyChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let secttion = Section(rawValue: indexPath.section) else { fatalError("Unknown section kind")
            }
            
            switch secttion {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierFirst, for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierSecond, for: indexPath)
                cell.backgroundColor = .systemRed
                return cell
            }
        })
    }
}

// MARK: - Configure Layout

extension ListViewController {
    
    private func createCellCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            guard let secttion = Section(rawValue: sectionIndex) else { fatalError("Unknown section kind")
            }
            switch secttion {
            case .activeChats:
                return self.setupActiveChats()
            case .waitingChats:
                return self.setupWaitingChats()
            }
        }
        return layout
    }
    
    private func setupWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(90),
                                               heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16,
                                                             leading: 20,
                                                             bottom: 0,
                                                             trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func setupActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16,
                                                             leading: 20,
                                                             bottom: 0,
                                                             trailing: 20)
        return section
    }
}

// MARK: - UISearchBarDelegate

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - SwiftUI

struct ListViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: Context) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarController, context: Context) {
        }
    }
}
