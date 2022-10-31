//
//  FavouriteTableViewCell.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 26/10/2022.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    static let identifier = "FavouriteTableViewCell"
    
    
    
    private let FavouriteUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private let FavouriteLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(FavouriteUIImageView)
        contentView.addSubview(FavouriteLabel)
         applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
          let FavouriteUIImageViewConstraints = [
             FavouriteUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: +15),
              FavouriteUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
              FavouriteUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
              FavouriteUIImageView.widthAnchor.constraint(equalToConstant: 100)
          ]
          let FavouriteLabelConstraints = [
            FavouriteLabel.leadingAnchor.constraint(equalTo: FavouriteUIImageView.trailingAnchor, constant: 25),
            FavouriteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
       
          ]
        NSLayoutConstraint.activate(FavouriteUIImageViewConstraints)
        NSLayoutConstraint.activate(FavouriteLabelConstraints)
    
  
}
    
    func configure(with model: TrendingModel) {
        FavouriteLabel.text = model.strMeal
        FavouriteUIImageView.sd_setImage(with: model.strMealThumb.asUrl)
    }
    
    
    
}
