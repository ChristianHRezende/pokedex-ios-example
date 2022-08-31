//
//  ViewController.swift
//  MyPokedex
//
//  Created by Christian Rezende on 29/08/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var pokemons:[Pokemon] = []
    private var names:[String] = ["A","B","C"]
    
    private var pokemonsTableView :UITableView!
    
    
    private lazy var button:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        
        textLabel.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 0.25)
        textLabel.textColor = .red
        textLabel.text = "TESTETSETES"
        textLabel.textAlignment = .center
        textLabel.layer.cornerRadius = 10
        
        
        button.setTitle("Acessar", for: .normal)
        button.backgroundColor = .red
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
//        stackView.alignment = .center
//        stackView.distribution = .fillEqually


        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(button)
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        pokemonsTableView = UITableView(frame: CGRect(x:0,y: barHeight,width: displayWidth, height: displayHeight - barHeight))
        pokemonsTableView.register(UITableViewCell.self,forCellReuseIdentifier:"cellPokemon")
        pokemonsTableView.dataSource = self
        pokemonsTableView.delegate = self
        
        self.view.addSubview(pokemonsTableView)
   
//        self.view.addSubview(stackView)
        
        
//        stackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 0).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
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
            print(self.pokemons[self.pokemons.count - 1 ].name)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPokemon", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = names[indexPath.row]
        cell.contentConfiguration = contentConfiguration
        return cell
    }

}

