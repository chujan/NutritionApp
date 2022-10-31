//
//  SearchCollectionViewCell.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView .layer.cornerRadius = 20
         imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
        
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
       contentView .layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
       label.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
       
       
    }
    
    func configure( with model: TrendingModel) {
        label.text = model.strMeal
        imageView.sd_setImage(with: model.strMealThumb.asUrl)
       // contentView.backgroundColor = colors.randomElement()
    }
    
}
