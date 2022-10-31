//
//  RecommendedCollectionViewCell.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit
import SDWebImage

class RecommendedCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendedCollectionViewCell"
    
    private let recommendedImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           return imageView
           
       }()
       
       private let recommendedLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 0
          // label.textColor = .systemBackground
              label.font = .systemFont(ofSize: 15, weight: .thin)
              return label
          }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.layer.cornerRadius = 8
           contentView.layer.masksToBounds = true
           backgroundColor = .secondarySystemBackground
           contentView.addSubview(recommendedImageView)
           contentView.addSubview(recommendedLabel)
       }
       required init?(coder: NSCoder) {
           fatalError()
       }
       override func layoutSubviews() {
           super.layoutSubviews()
           recommendedImageView.frame = contentView.bounds
           recommendedLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
       }
       
    func configure(with model:RecommendedModel) {
        recommendedLabel.text = model.strMeal
        recommendedImageView.sd_setImage(with: model.strMealThumb.asUrl)
       
        
    }
    
    
}
