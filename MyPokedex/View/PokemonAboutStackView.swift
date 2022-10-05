//
//  PokemonAboutStackView.swift
//  MyPokedex
//
//  Created by Christian Rezende on 03/10/22.
//

import UIKit

class PokemonAboutStackView: UIStackView {
    
    // Weight
    
    private lazy var weightIcon: UIImageView = {
        let view  = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "mail")
        view.tintColor = .black
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var weightDetailLabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "6,9kg"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var weightRowStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 8
        view.addArrangedSubview(weightIcon)
        view.addArrangedSubview(weightDetailLabel)
        return view
    }()
    
    private lazy var weightLabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Weight"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var weightColumnwStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 12
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.addArrangedSubview(weightRowStackView)
        view.addArrangedSubview(weightLabel)
        return view
    }()
    
    // Height
    
    private lazy var heightIcon: UIImageView = {
        let view  = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "mail")
        view.tintColor = .black
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var heightDetailLabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "0,7m"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var heightRowStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 8
        view.addArrangedSubview(heightIcon)
        view.addArrangedSubview(heightDetailLabel)
        return view
    }()
    
    private lazy var heightLabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Height"
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var heightColumnwStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 12
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.addArrangedSubview(heightRowStackView)
        view.addArrangedSubview(heightLabel)
        return view
    }()
    
    // Moves
    
    private lazy var movesLabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Chlorophyll \nOvergrow"
        view.numberOfLines = 0
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var movesLabelTitle: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Moves"
        view.numberOfLines = 0
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 14)
        return view
    }()
    
    private lazy var movesColumnwStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 12
        view.alignment = .center
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.addArrangedSubview(movesLabel)
        view.addArrangedSubview(movesLabelTitle)
        return view
    }()
    
    init(frame: CGRect,weight:Double,height:Double, moves:[String]) {
        super.init(frame: frame)
        
        self.weightDetailLabel.text = "\(weight)  kg"
        self.heightDetailLabel.text = "\(height) m"
        self.movesLabel.text = moves.reduce("", { partialResult, move in
            "\(move)\n\(partialResult!)"
        })
        self.addArrangedSubview(weightColumnwStackView)
        self.addArrangedSubview(heightColumnwStackView)
        self.addArrangedSubview(movesColumnwStackView)

        self.distribution = .fillEqually
        
        self.weightIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        self.weightIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        self.heightIcon.widthAnchor.constraint(equalToConstant: 8).isActive = true
        self.heightIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        self.movesColumnwStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        self.weightColumnwStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        self.heightColumnwStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
