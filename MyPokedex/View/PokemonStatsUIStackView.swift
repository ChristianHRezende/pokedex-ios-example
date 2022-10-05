//
//  PokemonStatsUIStackView.swift
//  MyPokedex
//
//  Created by Christian Rezende on 03/10/22.
//

import UIKit

class PokemonStatsUIStackView: UIStackView {

    private lazy var keyUILabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.font = .boldSystemFont(ofSize: 14)
        view.textAlignment = .right
        return view
    }()
    
    private lazy var valueUILabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    private lazy var progress: UIProgressView = {
        var view = UIProgressView(progressViewStyle: .bar)
        return view
    }()
    
    
    init(frame: CGRect, color:UIColor,key:String,value:Int) {
        super.init(frame: frame)
        keyUILabel.textColor = color
        keyUILabel.text = key
        valueUILabel.text = String(value)
        
        // progress
        let progressPercent = value > 0 ? Float(value)/100 : 0
        progress.setProgress(progressPercent, animated: true)
        progress.trackTintColor = .lightGray
        progress.tintColor = color
        
        self.distribution = .equalSpacing
        self.addArrangedSubview(keyUILabel)
        self.addArrangedSubview(valueUILabel)
        self.addArrangedSubview(progress)
        
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 4).isActive = true
        progress.widthAnchor.constraint(equalToConstant: 248).isActive = true
        keyUILabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
