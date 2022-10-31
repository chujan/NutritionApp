//
//  CategoryCollectionViewCell.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private let categoryImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           return imageView
           
       }()
       
       private let categoryLabel: UILabel = {
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
           contentView.addSubview(categoryImageView)
           contentView.addSubview(categoryLabel)
       }
       required init?(coder: NSCoder) {
           fatalError()
       }
       override func layoutSubviews() {
           super.layoutSubviews()
           categoryImageView.frame = contentView.bounds
           categoryLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
       }
       
    func configure(with model:CategoryModel) {
        categoryLabel.text = model.strCategory
        categoryImageView.sd_setImage(with: model.strCategoryThumb.asUrl)
       
        
    }
    
}
