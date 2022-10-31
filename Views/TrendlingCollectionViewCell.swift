//
//  TrendlingCollectionViewCell.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit
import SDWebImage

class TrendlingCollectionViewCell: UICollectionViewCell {
    static let identifier = "TrendlingCollectionViewCell"
    
    private let trendingImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           return imageView
           
       }()
       
       private let trendingLabel: UILabel = {
              let label = UILabel()
              label.numberOfLines = 0
        
              label.font = .systemFont(ofSize: 15, weight: .thin)
              return label
          }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.layer.cornerRadius = 8
           contentView.layer.masksToBounds = true
           backgroundColor = .secondarySystemBackground
           contentView.addSubview(trendingImageView)
           contentView.addSubview(trendingLabel)
       }
       required init?(coder: NSCoder) {
           fatalError()
       }
       override func layoutSubviews() {
           super.layoutSubviews()
           trendingImageView.frame = contentView.bounds
           trendingLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
       }
       
    func configure(with model: TrendingModel) {
        trendingImageView.sd_setImage(with: model.strMealThumb.asUrl)
        trendingLabel.text = model.strMeal
        
    }
}
