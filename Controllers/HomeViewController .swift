//
//  HomeViewController.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit
import SafariServices
enum BrowseSectionType {
    case Trending(viewModel: [TrendingModel])
    case Categories(viewModel: [CategoryModel])
    case Recommended(viewModel: [RecommendedModel])
    
    var title: String {
        switch self {
        case .Trending:
            return "Trending"
        case .Categories:
            return "Categories"
        case .Recommended:
            return "Recommended"
        }
    }
}

class HomeViewController: UIViewController {
    var trending : [Trending] = []
    var category: [Categories] = []
    var recommended: [Recommended] = []
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
           return HomeViewController.createSectionLayout(section: sectionIndex)
           
       })
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        fetchData()
        
       
    
    }
     var sections = [BrowseSectionType]()
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
       
    }
     func fetchData() {
        let group = DispatchGroup()
        group .enter()
        group.enter()
        group.enter()
        var Trending: MealResponse?
        var Categories: CategoryResponse?
        var Recommend: RecommendedResponse?
        
        
        APICaller.shared.getTrending { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                Trending = model
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        APICaller.shared.getCategory { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                Categories = model
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        APICaller.shared.getRecommended { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                Recommend = model
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        group.notify(queue: .main) {
            guard let Trending = Trending?.meals,
            let Categories = Categories?.categories,
            let Recommend = Recommend?.meals else {
                return
            }
            self.configureModels(trending: Trending, category: Categories, recommended: Recommend)
            

        }
        
    }
     func configureModels(trending: [Trending], category: [Categories], recommended: [Recommended]) {
        self.trending = trending
        self.category = category
        self.recommended = recommended
        sections.append(.Trending(viewModel: trending.compactMap({ return TrendingModel(strMeal: $0.strMeal, strMealThumb: $0.strMealThumb)
            
        })))
        
        sections.append(.Categories(viewModel: category.compactMap({ return
            CategoryModel(strCategoryThumb: $0.strCategoryThumb, strCategory: $0.strCategory)
        })))
        
        sections.append(.Recommended(viewModel: recommended.compactMap({ return
            RecommendedModel(strMeal: $0.strMeal, strMealThumb: $0.strMealThumb)
        })))
        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(TrendlingCollectionViewCell.self, forCellWithReuseIdentifier: TrendlingCollectionViewCell.identifier)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedCollectionViewCell.identifier)
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
            let supplementaryViews = [ NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
            switch section {
            case 0:
                       
                       let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension:.absolute(200))
                       )
                       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 2)
                       
                       let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(260)), subitem: item, count: 1)
                       
                       let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(260)), subitem: verticalgroup, count: 1
                               )
                       
                       
                       
                       let section = NSCollectionLayoutSection(group: horizontalgroup)
                       section.orthogonalScrollingBehavior = .continuous
                       section.boundarySupplementaryItems = supplementaryViews
                       return section
                
            case 1:
                       
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalHeight(1.0))
                           )
                           item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 2, bottom: 2, trailing: 8)
                           
                           let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200)), subitem: item, count: 2)
                           let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(200)), subitem: verticalgroup, count: 1)
                           
                       
                       
                       let section = NSCollectionLayoutSection(group: horizontalgroup)
                       section.orthogonalScrollingBehavior = .continuous
                       section.boundarySupplementaryItems = supplementaryViews
                       return section
                
            case 2:
                       
                       let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension:.absolute(140))
                       )
                       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 2)
                       
                       let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: item, count: 1)
                       
                       
                       
                       
                       
                       let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: verticalgroup, count: 1
                               )
                       
                       
                       
                       let section = NSCollectionLayoutSection(group: horizontalgroup)
                       section.orthogonalScrollingBehavior = .continuous
                       section.boundarySupplementaryItems = supplementaryViews
                       return section
                
            default:
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalHeight(1.0))
                           )
                           item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                           
                           let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(390)), subitem: item, count: 1)
                         
                           
                           
                           let section = NSCollectionLayoutSection(group: group)
                           section.boundarySupplementaryItems = supplementaryViews
                           return section
                           
                       
                       
                       
            }
        }
        
       
   
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case.Trending(let viewModel):
            return viewModel.count
        case .Categories(let viewModel):
            return viewModel.count
        case .Recommended(let viewModel):
            return viewModel.count
         
        }
       
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type {
        case.Trending(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendlingCollectionViewCell.identifier, for: indexPath) as? TrendlingCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModel[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case .Categories(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
                
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case .Recommended(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCollectionViewCell.identifier, for: indexPath) as?
                    RecommendedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModel[indexPath.row]
            cell.configure(with: viewModel)
            return cell
            
            
        }
      
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier, for: indexPath) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
                   return UICollectionReusableView()
                   
               }
               let section = indexPath.section
               let title = sections[section].title
               header.configure(with: title)
               return header
              
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let section = sections[indexPath.section]
        switch section {
            
        case .Trending:
            let trending = trending[indexPath.row]
            guard let url = URL(string: trending.strYoutube) else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            //let vc = PreviewViewController(trending: trending)
//            vc.title = trending.strMeal
//            vc.configure(with: PreviewModel(strYoutube: trending.strYoutube, strInstructions: trending.strInstructions))
//            vc.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(vc, animated: true)
        case .Categories:
            let trending = category[indexPath.row]
            let vc = PreviewViewController(trending: trending)
            vc.title = trending.strCategory
            vc.configure(with: CategoryDetailModel(strCategoryThumb: trending.strCategoryThumb, strCategoryDescription: trending.strCategoryDescription))
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
            
        case .Recommended:
            let trending = recommended[indexPath.row]
            guard let url = URL(string: trending.strYoutube) else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
           
        }
    }
    
    
}

