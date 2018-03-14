//
//  OfferViewController.swift
//  
//
//  Created by Steven Schmatz on 3/13/18.
//

import UIKit

class OfferViewController: UIViewController {

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        self.view.addSubview(button)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = Colors.Blue
        backButton.pinToTopEdgeOfSuperview(withOffset: 50)
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
