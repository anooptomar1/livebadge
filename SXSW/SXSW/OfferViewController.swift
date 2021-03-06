//
//  OfferViewController.swift
//  
//
//  Created by Steven Schmatz on 3/13/18.
//

import UIKit

enum Rarity {
    case Common
    case Rare
    case Legendary
}

class OfferViewController: UIViewController {
    
    var rarity: Rarity!
    var offer: String!
    
    init(rarity: Rarity, offer: String) {
        self.rarity = rarity
        self.offer = offer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }

    private lazy var backButton: UIButton = {
        let button = UIButton()
        
        let imageView = UIImageView(image: UIImage(named: "back-button"))
        button.addSubview(imageView)
        imageView.size(toWidth: 15)
        imageView.size(toHeight: 23)
        imageView.pinToLeftEdgeOfSuperview()
        imageView.pinToTopEdgeOfSuperview(withOffset: 10)
        
        button.setTitle("    Back", for: .normal)
        button.titleLabel?.font = UIFont(name: "Apercu-Bold", size: 26)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        self.view.addSubview(button)
        return button
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sxsw-logo-black"))
        self.view.addSubview(imageView)
        return imageView
    }()
    
    private lazy var titleView: UILabel = {
        let label = UILabel()
        
        label.text = self.offer
        label.textColor = UIColor.white
        label.font = UIFont(name: "Apercu-Medium", size: 32)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        self.view.addSubview(label)
        return label
    }()
    
    private lazy var qrCodeView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "qr"))
        self.view.addSubview(imageView)
        return imageView
    }()
    
    private lazy var itemTypeLabel: UILabel = {
        let label = UILabel()
        
        if self.rarity == .Common {
            label.text = "Common item"
        } else if self.rarity == .Rare {
            label.text = "Rare item"
        } else {
            label.text = "Legendary item"
        }
        
        label.textColor = UIColor.white
        label.font = UIFont(name: "Apercu-Bold", size: 22)
        
        self.view.addSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.rarity == .Common {
            self.view.backgroundColor = Colors.Blue
        } else if self.rarity == .Rare {
            self.view.backgroundColor = Colors.Orange
        } else {
            self.view.backgroundColor = Colors.Pink
        }
        
        backButton.pinToTopEdgeOfSuperview(withOffset: 80)
        backButton.pinToLeftEdgeOfSuperview(withOffset: 40)
        
        logoImageView.positionBelow(backButton, withOffset: 40)
        logoImageView.pinToSideEdgesOfSuperview(withOffset: 40)
        
        titleView.positionBelow(logoImageView, withOffset: 30)
        titleView.pinToSideEdgesOfSuperview(withOffset: 40)
        
        itemTypeLabel.pinToBottomEdgeOfSuperview(withOffset: 120)
        itemTypeLabel.centerHorizontallyInSuperview()
        
        qrCodeView.size(toWidthAndHeight: 200)
        qrCodeView.positionAbove(itemTypeLabel, withOffset: 20)
        qrCodeView.centerHorizontallyInSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
