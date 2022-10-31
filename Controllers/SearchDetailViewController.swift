//
//  SearchDetailViewController.swift
//  NutritionApp
//
//  Created by Jennifer Chukwuemeka on 29/10/2022.
//

import UIKit

class SearchDetailViewController: UIViewController {
    var model = Search()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
        
    }()
    
    private let heroImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
               
    }()
    private let InstructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 15, weight:.bold)
        label.numberOfLines = 0
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(overviewLabel)
        view.addSubview(InstructionLabel)
        view.addSubview(heroImageView)
        InstructionLabel.text = "Instructions"

       
    }
    
    init(model: Search) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        heroImageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
               InstructionLabel.frame = CGRect(x: 10, y: heroImageView.bottom, width: view.width-5, height: 20)
        overviewLabel.frame = CGRect(x: 10, y: InstructionLabel.bottom, width: view.width-20, height: 200)
    
    }
    
    
    func  configure(with model: SearchDetailModel) {
        overviewLabel.text = model.strInstructions
        heroImageView.sd_setImage(with: model.strMealThumb.asUrl)
        
        }
      
    

    

}
