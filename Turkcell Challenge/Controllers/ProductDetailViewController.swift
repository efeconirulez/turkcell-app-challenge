//
//  ProductDetailViewController.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit
import FTIndicator
import NVActivityIndicatorView

class ProductDetailViewController: BaseViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceTagLabel: UILabel!
    @IBOutlet weak var descriptionActivityIndicator: NVActivityIndicatorView!
    
    
    var productDetail: ProductDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        descriptionActivityIndicator.startAnimating()
        
        fetchProductDetail()
    }
    
    func setViews() {
        productNameLabel.text = productDetail.name ?? ""
        productPriceTagLabel.text = "$ \(productDetail.price ?? 0)"
        productDescriptionLabel.text = productDetail.desc ?? ""
        productImageView.kf.indicatorType = .activity
        
        if let imageURL = productDetail.image {
            let url = URL(string: imageURL)
            
            productImageView.kf.setImage(with: url)
        }
    }
    
    func fetchProductDetail() {
        guard let id = productDetail.id else {
            FTIndicator.showError(withMessage: "Invalid product!")
            
            dismiss(animated: true, completion: nil)
            
            return
        }
        
        NetworkManager.request(forEndpoint: .productDetail(id: id)) { (isSuccess, json) in
            guard isSuccess, let json = json else {
                FTIndicator.showError(withMessage: "Error recieving product detail!")
                
                return
            }
            
            self.productDetail = ProductDetail(json: json)
            self.descriptionActivityIndicator.stopAnimating()
            
            self.setViews()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTriggerBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
