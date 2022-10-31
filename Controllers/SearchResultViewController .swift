//
//  SearchResultViewController.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 27/10/2022.
//

import UIKit
import SafariServices

protocol SearchResultsViewControllerDelegate: AnyObject {
    
}
class SearchResultViewController: UIViewController {
    
    var search = [Favourite]()
    
   public weak var delegate: SearchResultsViewControllerDelegate?
    
    public var searchtableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        
        
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        //tableView.isHidden = true
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchtableView)
         searchtableView.separatorStyle = .none
       
        searchtableView.delegate = self
        searchtableView.dataSource = self
        //searchtableView.isHidden = search.isEmpty

        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        searchtableView.frame = view.bounds
        
    }
    

    
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        search.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as? FavouriteTableViewCell else {
            return UITableViewCell()
        }
        let title = search[indexPath.row]
        cell.configure(with: TrendingModel(strMeal: title.strMeal, strMealThumb: title.strMealThumb))
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = search[indexPath.row]
        guard let url = URL(string: model.strYoutube) else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }


}
