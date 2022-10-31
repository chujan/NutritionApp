//
//  PreviewViewController.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 26/10/2022.
//

import UIKit
import WebKit

class PreviewViewController: UIViewController {
    var trending = Categories()
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
        
    }()
    
    private let heroImageView: UIImageView = {
               let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
          
               imageView.clipsToBounds = true
            
            
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
        view.addSubview(heroImageView)
        view.addSubview(InstructionLabel)
        InstructionLabel.text = "Description"

       
    }
    
    init(trending: Categories) {
        self.trending = trending
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        heroImageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        InstructionLabel.frame = CGRect(x: 10, y: heroImageView.bottom, width: view.width-5, height: 20)
               overviewLabel.frame = CGRect(x: 5, y: InstructionLabel.bottom, width: view.width-5, height: 200)
    
    }
    
    
    func  configure(with model: CategoryDetailModel) {
        overviewLabel.text = model.strCategoryDescription
        heroImageView.sd_setImage(with: model.strCategoryThumb.asUrl)
        
        }
      
        
    }
    
    
  
   


