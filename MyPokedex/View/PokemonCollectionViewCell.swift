//
//  PokemonCollectionViewCell.swift
//  MyPokedex
//
//  Created by Christian Rezende on 31/08/22.
//

import UIKit
import SwiftUI
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomPokemonCollectionCell"
    
    private let pokemonNumber:UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName:"house")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true

        return  imageView
    }()

    
    private let pokemonName:UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10

        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let colorContent = ThemeVariables.getNextColor()
        pokemonNumber.textColor = colorContent
        pokemonName.backgroundColor = colorContent

        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = colorContent.cgColor
        contentView.contentMode = .center

        contentView.addSubview(pokemonNumber)
        contentView.addSubview(imageView)
        contentView.addSubview(pokemonName)
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = CGRect(x: 8, y: 0, width: 104, height: 115)

        pokemonNumber.frame = CGRect(x:-5,y: 3,width: 104,height: 16)
        pokemonName.frame = CGRect(x: 0, y: 90 , width: 104,  height: 24)
        imageView.frame = CGRect(x: 0, y:  19, width: 104,height: 72)
    }
    
    public func configure(pokemonName:String,pokemonNumber:Int,image:URL?){
        self.pokemonName.text = pokemonName
        self.pokemonNumber.text = "#"+String(pokemonNumber)
        if (image != nil) {
            self.imageView.sd_setImage(with: image)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.pokemonName.text = nil
        self.pokemonNumber.text = nil
    }
  
}
