//
//  IngredientsViewController.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit
import SafariServices

class IngredientsViewController: UIViewController {
    
    private var model = [Favourite]()
    private let FavouriteTable: UITableView = {
        let table = UITableView()
        table.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        return table
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(FavouriteTable)
        FavouriteTable.delegate = self
        FavouriteTable.dataSource = self
        
        APICaller.shared.getFavourite { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let model):
                        self?.model = model
                        self?.FavouriteTable.reloadData()
                    self?.FavouriteTable.separatorStyle = .none
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }

        view.backgroundColor = .systemBackground
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
           FavouriteTable.frame = view.bounds
        }
    

   
}

extension IngredientsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as? FavouriteTableViewCell else  {
            return UITableViewCell()
        }
        let title = model[indexPath.row]
        cell.configure(with: TrendingModel(strMeal: title.strMeal, strMealThumb: title.strMealThumb))
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = model[indexPath.row]
        guard let url = URL(string: model.strYoutube) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    
}
//let trending = trending[indexPath.row]
//guard let url = URL(string: trending.strYoutube) else {
//    return
//}
//let vc = SFSafariViewController(url: url)
//present(vc, animated: true)
