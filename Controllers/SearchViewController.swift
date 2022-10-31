//
//  SearchViewController.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
//    var isSearchBarEmpty: Bool {
//      return searhController.searchBar.text?.isEmpty ?? true
//    }

    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier:SearchCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    let searhController: UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultViewController())
        vc.searchBar.placeholder = "Search For Current Food Recipes"
       // vc.searchBar.searchBarStyle = .minimal
        
        
        return vc
        
    }()
    
   
    var search = [Search]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searhController.searchResultsUpdater = self
       searhController.searchBar.delegate = self
        
        navigationItem.searchController = searhController
        
        view.addSubview(collectionView)
       collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        
        fetchData()
       
    }
    
    
    func fetchData() {
        APICaller.shared.getSearch { [weak self] result  in
            switch result {
            case.success(let model):
                DispatchQueue.main.async {
                    self?.search = model
                    print(model)
                    self?.collectionView.reloadData()
            
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
      
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    

   
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return search.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        let categories =  search[indexPath.row]
        cell.configure(with: TrendingModel(strMeal: categories.strMeal, strMealThumb: categories.strMealThumb))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = search[indexPath.row]
        let vc = SearchDetailViewController(model: model)
        vc.title = model.strMeal
        vc.configure(with: SearchDetailModel(strInstructions: model.strInstructions, strMealThumb: model.strMealThumb))
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
//    switch type {
//    case.Trending(let viewModel):
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendlingCollectionViewCell.identifier, for: indexPath) as? TrendlingCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        let viewModel = viewModel[indexPath.row]
//        cell.configure(with: viewModel)
//        return cell
//
}
extension SearchViewController: SearchResultsViewControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar   
        guard let resultsController = searhController.searchResultsController as? SearchResultViewController,
              let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        resultsController.delegate = self
        APICaller.shared.getSearch(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let search):
                    resultsController.search = search
                    resultsController.searchtableView.reloadData()
                   
                    

                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}
