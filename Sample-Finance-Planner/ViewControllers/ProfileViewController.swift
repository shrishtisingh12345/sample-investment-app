//
//  ProfileViewController.swift
//  Sample-Finance-Planner
//
//  Created by Apple on 4/27/22.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var numberOfUnit: UILabel!
    @IBOutlet weak var investment: UILabel!
    @IBOutlet weak var purchacePrice: UILabel!
    @IBOutlet weak var dateOfPurchace: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //data is getting saved in default
        investment.text = "Who is this investment for :- \(String(describing: UserDefaults.standard.value(forKey:"invest") as? String))"
        
        purchacePrice.text = "Date Of Purchace:- \(String(describing: UserDefaults.standard.value(forKey:"purchacePrice") as? String))"
        
        dateOfPurchace.text = "Date Of Purchace:-  \(String(describing: UserDefaults.standard.value(forKey:"dobPurchace") as? String))"
        
        numberOfUnit.text = "Number Of Unit:-\(String(describing: UserDefaults.standard.value(forKey:"numOfUnit") as? String))"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        investment.text = "Who is this investment for :- \(String(describing: UserDefaults.standard.value(forKey:"invest") as? String))"
        
        purchacePrice.text = "Date Of Purchace:- \(String(describing: UserDefaults.standard.value(forKey:"purchacePrice") as? String))"
        
        dateOfPurchace.text = "Date Of Purchace:-  \(String(describing: UserDefaults.standard.value(forKey:"dobPurchace") as? String))"
        
        numberOfUnit.text = "Number Of Unit:-\(String(describing: UserDefaults.standard.value(forKey:"numOfUnit") as? String))"
    }
    


}
