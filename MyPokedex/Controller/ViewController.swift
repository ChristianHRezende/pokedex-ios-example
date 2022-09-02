//
//  ViewController.swift
//  MyPokedex
//
//  Created by Christian Rezende on 29/08/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private var pokemons:[Pokemon] = []
    private var names:[String] = ["A","B","C","A","B","C","A","B","C","A","B","C"]
    
    private var pokemonsTableView :UITableView!
    

    private lazy var mainStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
        //        stackView.alignment = .center
        //        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var headerStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var pokemonsUICollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3) - 4)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        let pokemonsUICollectionView:UICollectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        
        return pokemonsUICollectionView
    }()
    
    private lazy var logoImageView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pokeball_black_white")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var button:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Acessar", for: .normal)
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var button2:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Acessar", for: .normal)
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var textLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0.25)
        view.textColor = .red
        view.text = "TESTETSETES"
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        
        headerStackView.addArrangedSubview(logoImageView)
        headerStackView.addArrangedSubview(button2)

        
        pokemonsUICollectionView.register(PokemonCollectionViewCell.self,forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        pokemonsUICollectionView.dataSource = self
        pokemonsUICollectionView.delegate = self
        
        mainStackView.addArrangedSubview(headerStackView)
        mainStackView.addArrangedSubview(pokemonsUICollectionView)
        
        view.addSubview(mainStackView)
        
        pokemonsUICollectionView.frame = view.bounds
        
        
        //        UI TABLE VIEW
        //        pokemonsTableView = UITableView(frame: CGRect(x:0,y: barHeight,width: displayWidth, height: displayHeight - barHeight))
        //        pokemonsTableView.register(UITableViewCell.self,forCellReuseIdentifier:"cellPokemon")
        //        pokemonsTableView.dataSource = self
        //        pokemonsTableView.delegate = self
        //
        //        self.view.addSubview(pokemonsTableView)
        
        //        self.view.addSubview(stackView)
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        logoImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        headerStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: barHeight).isActive = true

        headerStackView.frame = CGRect(x:-5,y: barHeight + 100,width: displayWidth,height: 16)
        


       
        
        mainStackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
        //
        //
        //        textLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        textLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //
        //        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //        textLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 50).isActive = true
        //        textLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        //        textLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
        //        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        //        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        //        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        
        let pokemonService = PokemonService()
        pokemonService.fetchPokemons { pokemon in
            self.pokemons.append(pokemon)
            DispatchQueue.main.async {
                self.pokemonsUICollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as! PokemonCollectionViewCell
        if let name = pokemons[indexPath.row].name {
            if let pokemonNumber = pokemons[indexPath.row].order {
                if let image = pokemons[indexPath.row].image{
                    cell.configure(pokemonName: name, pokemonNumber: pokemonNumber,image:image)
                }
            }
        }
        return cell
    }
}

