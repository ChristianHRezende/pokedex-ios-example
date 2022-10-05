//
//  PokemonElementDetailLabelUIView.swift
//  MyPokedex
//
//  Created by Christian Rezende on 03/10/22.
//

import UIKit

class PokemonElementDetailLabelUIView: UILabel {
    
    init(frame: CGRect,color: UIColor,title:String) {
        super.init(frame: frame)
        
        self.text = title
        self.textColor = .white
        self.font = UIFont.boldSystemFont(ofSize: 14)
        self.backgroundColor = color
        self.textAlignment = .center
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
                
        self.widthAnchor.constraint(equalToConstant: 55).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
