//
//  DetailPokemonViewController.swift
//  MyPokedex
//
//  Created by Christian Rezende on 30/09/22.
//

import UIKit
import SDWebImage
class DetailPokemonViewController: UIViewController {
    
    public var pokemon:Pokemon? = nil
    
    private let primaryColor = ThemeVariables.getNextColor()
    
    private lazy var pokeballOpaqueImageView: UIImageView = {
        let view  = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pokeball_black_white.svg")
        view.contentMode = .scaleToFill
        view.layer.opacity = 0.1
        return view
    }()
    
    private lazy var pokemonDetailImageView: UIImageView = {
        let view  = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "charmander.png")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    private lazy var pokemonElementsStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        
        return view
    }()
    
    private lazy var aboutLabelUILabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "About"
        view.textColor = primaryColor
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    
    private lazy var descriptionLabelUILabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum commodo finibus nisl."
        view.textColor = .black
        view.font = .systemFont(ofSize: 16)
        view.numberOfLines = 0
        return view
    }()
    
    
    private lazy var baseStatsLabelUILabel: UILabel = {
        var view = UILabel(frame: .zero)
        view.text = "Base Stats"
        view.textColor = primaryColor
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    
    private lazy var pokemonInfoContentStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 20
        
        return view
    }()
    
    private lazy var pokemonDetailContentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addSubview(pokemonDetailImageView)
        view.addSubview(pokemonInfoContentStackView)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayHeight: CGFloat = self.view.frame.height
        let displayWidth: CGFloat = self.view.frame.width
        
        if let pokemon = pokemon {
            self.pokemonDetailImageView.sd_setImage(with: pokemon.image)
            pokemon.types.forEach({ type in
                self.pokemonElementsStackView.addArrangedSubview(PokemonElementDetailLabelUIView(frame: .zero,color: ThemeVariables.getNextColor(),title: type.uppercased()))
            })
            let pokemonAboutStackView = PokemonAboutStackView(frame: .zero,weight: pokemon.weight,height:pokemon.height,moves: pokemon.moves)
            
            view.backgroundColor = primaryColor
            
            
            pokemonInfoContentStackView.addArrangedSubview(pokemonElementsStackView)
            pokemonInfoContentStackView.addArrangedSubview(aboutLabelUILabel)
            pokemonInfoContentStackView.addArrangedSubview(pokemonAboutStackView)
            pokemonInfoContentStackView.addArrangedSubview(descriptionLabelUILabel)
            pokemonInfoContentStackView.addArrangedSubview(baseStatsLabelUILabel)
            
            view.addSubview(pokeballOpaqueImageView)
            view.addSubview(pokemonDetailContentView)
            
            var key = "HP"
            if let hp = pokemon.stats[key] {
                let pokemonStatsUIStackViewHP: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewHP)
                
                key = "ATK"
                if let hp = pokemon.stats[key] {
                    let pokemonStatsUIStackViewATK: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                    pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewATK)
                    
                    
                    key = "DEF"
                    if let hp = pokemon.stats[key] {
                        let pokemonStatsUIStackViewDEF: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                        pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewDEF)
                        
                        
                        
                        key = "SATK"
                        if let hp = pokemon.stats[key] {
                            let pokemonStatsUIStackViewSATK: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                            pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewSATK)
                            
                            
                            
                            key = "SDEF"
                            if let hp = pokemon.stats[key] {
                                let pokemonStatsUIStackViewSDEF: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                                pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewSDEF)
                                
                                
                                
                                key = "SPD"
                                if let hp = pokemon.stats[key] {
                                    let pokemonStatsUIStackViewSPD: PokemonStatsUIStackView = PokemonStatsUIStackView(frame: .zero, color: primaryColor,key: key,value:hp)
                                    pokemonInfoContentStackView.addArrangedSubview(pokemonStatsUIStackViewSPD)
                                    
                                    pokemonStatsUIStackViewHP.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewHP.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    pokemonStatsUIStackViewATK.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewATK.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    pokemonStatsUIStackViewDEF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewDEF.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    pokemonStatsUIStackViewSATK.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewSATK.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    pokemonStatsUIStackViewSDEF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewSDEF.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    pokemonStatsUIStackViewSPD.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                                    pokemonStatsUIStackViewSPD.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            pokemonAboutStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
            pokemonAboutStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
            
        }
        
        
        
        
        
        
        // imageView back
        pokeballOpaqueImageView.heightAnchor.constraint(equalToConstant: 208 ).isActive = true
        pokeballOpaqueImageView.widthAnchor.constraint(equalToConstant: 208 ).isActive = true
        pokeballOpaqueImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        pokeballOpaqueImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
        
        // stackview
        pokemonDetailImageView.heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        pokemonDetailImageView.widthAnchor.constraint(equalToConstant: 200 ).isActive = true
        pokemonDetailImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        pokemonDetailImageView.topAnchor.constraint(equalTo: self.pokemonDetailContentView.topAnchor, constant: -150).isActive = true
        
        pokemonDetailContentView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        pokemonDetailContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        pokemonDetailContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        pokemonDetailContentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        
        pokemonInfoContentStackView.topAnchor.constraint(equalTo: self.pokemonDetailImageView.bottomAnchor, constant: 0).isActive = true
        pokemonInfoContentStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        descriptionLabelUILabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        descriptionLabelUILabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
