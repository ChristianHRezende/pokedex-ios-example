//
//  ViewController.swift
//  MyPokedex
//
//  Created by Christian Rezende on 29/08/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private var pokemons:[Pokemon] = []
    private var pokemonsTableView :UITableView!
    
    private var page:Int = 0
    

    private lazy var mainStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .equalSpacing
        //        stackView.alignment = .center
        //        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var logoImageView:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pokeball_black_white")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var titleHeader:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.textColor = .black
        view.text = "Pokédex"
        view.textAlignment = .left
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var headerStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(titleHeader)
        return stackView
    }()
    
    private lazy var pokemonsUICollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3) - 4)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        let pokemonsUICollectionView:UICollectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        pokemonsUICollectionView.register(PokemonCollectionViewCell.self,forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)

        return pokemonsUICollectionView
    }()

    
    private lazy var pokemonsActivityIndicator:UIActivityIndicatorView = {
        var spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var nextButton:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "fowardArrow.svg"), for: .normal)
        view.addTarget(self, action: #selector(self.nextButtonClickHandle), for: .touchUpInside)
        return view
    }()
    
    @objc func nextButtonClickHandle(){
        print("cLk")
        getPokemons(self.page)
        self.page+=1
    }
    
    private lazy var backPageButton:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "backArrow.svg"), for: .normal)
        view.addTarget(self, action: #selector(self.backPageButtonClickHandle), for: .touchUpInside)
        return view
    }()
    
    @objc func backPageButtonClickHandle(){
        self.page-=1
        getPokemons(self.page)
    }
    
    private lazy var button2:UIButton = {
        let view  =  UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Acessar", for: .normal)
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var paginationStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(backPageButton)
        stackView.addArrangedSubview(nextButton)
        return stackView
    }()
    
 
    fileprivate func getPokemons(_ page:Int? = nil) {

        if(self.pokemons.count > 0){
            self.pokemons.removeAll()
            self.pokemonsUICollectionView.reloadData()
            
        }

        pokemonsActivityIndicator.startAnimating()

        let pokemonService = PokemonService()
        pokemonService.fetchPokemons(page) { pokemon in
            self.pokemons.append(pokemon)
            DispatchQueue.main.async {
                self.pokemonsUICollectionView.reloadData()
                self.pokemonsActivityIndicator.stopAnimating()
                
                if(self.page == 0){
                    self.backPageButton.isEnabled = false
                }else {
                    self.backPageButton.isEnabled = true
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        
        pokemonsUICollectionView.dataSource = self
        pokemonsUICollectionView.delegate = self
        
        mainStackView.addArrangedSubview(headerStackView)
        mainStackView.addArrangedSubview(pokemonsUICollectionView)
        mainStackView.addArrangedSubview(paginationStackView)

        
        view.addSubview(mainStackView)
        view.addSubview(pokemonsActivityIndicator)
        
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
        
        
        // HEADER
        logoImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        
        headerStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: barHeight).isActive = true

        headerStackView.frame = CGRect(x:-5,y: barHeight + 100,width: displayWidth,height: 16)
        

        titleHeader.leftAnchor.constraint(equalTo: self.logoImageView.rightAnchor,constant: 16).isActive = true

       
        // BODY
        pokemonsActivityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pokemonsActivityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        mainStackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive = true
        
        pokemonsUICollectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        backPageButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        backPageButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        backPageButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        paginationStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        paginationStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        paginationStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true

        paginationStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        getPokemons()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = pokemons[indexPath.row]
        if(pokemon.id != nil){
            let nextViewController = DetailPokemonViewController()
            nextViewController.pokemon = pokemon
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
}

