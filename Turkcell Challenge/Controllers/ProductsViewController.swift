//
//  ProductsViewController.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit
import FTIndicator

class ProductsViewController: BaseViewController {
    
    static private let reuseIdentifier = "ProductCell"

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var searchBar = UISearchBar()
    
    var products = [Product]() {
        didSet {
            filteredProducts = products
        }
    }
    
    var filteredProducts = [Product]() {
        didSet {
            collectionView.reloadData()
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            
            let searchController = UISearchController(searchResultsController: nil)
            searchController.delegate = self
            searchController.dimsBackgroundDuringPresentation = false
            searchController.hidesNavigationBarDuringPresentation = false
            
            self.searchBar = searchController.searchBar
            self.searchBar.delegate = self
            
            navigationItem.searchController = searchController
        }

        activityIndicator.startAnimating()

        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: ProductsViewController.reuseIdentifier)
        
        fetchCachedProducts()
        
        fetchProducts()
    }

    func fetchProducts() {
        NetworkManager.request(forEndpoint: .products) { (isSuccess, json) in
            guard isSuccess, let json = json else {
                FTIndicator.showError(withMessage: "Error recieving products!")
                
                return
            }
            
            self.products = Product.initArray(jsonArray: json["products"].array)
        }
    }
    
    func cacheProducts() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: self.products)
        
        UserDefaults.standard.set(encodedData, forKey: "Products")
    }
    
    func fetchCachedProducts() {
        if let data = UserDefaults.standard.data(forKey: "Products"),
            let products = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Product] {
            
            self.products = products
        }
    }
}

extension ProductsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsViewController.reuseIdentifier,
                                                         for: indexPath) as? ProductCollectionViewCell {
            
            cell.product = filteredProducts[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ProductsViewController: UICollectionViewDelegate {

}

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((view.frame.width / 2.0) - 16.0),
                      height: 248)
    }
}

extension ProductsViewController: UISearchControllerDelegate {
    func didDismissSearchController(_ searchController: UISearchController) {
        if let text = searchBar.text, text.isEmpty { self.filteredProducts = products }
    }
}

extension ProductsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            self.filteredProducts = products
            
            return
        }
        
        self.filteredProducts = products.filter{
            return $0.name?.contains(searchText) ?? false
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filteredProducts = products
    }
}
