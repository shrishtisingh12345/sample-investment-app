//
//  ViewController.swift
//  Sample-Finance-Planner
//
//  Created by Apple on 4/26/22.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var wifeBtn: UIButton!
    @IBOutlet weak var familyBtn: UIButton!
    @IBOutlet weak var selfBtn: UIButton!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var dateOfPurchaceTextbox: UITextField!
    @IBOutlet weak var purchacePriceTextBox: UITextField!
    @IBOutlet weak var variableLbl: UILabel!
    @IBOutlet weak var toggleBtn: UISwitch!
    @IBOutlet weak var investmentTextbox: UITextField!
    @IBOutlet weak var fixedLbl: UILabel!
    @IBOutlet weak var numberOfUnitTextbox: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dropDownView.isHidden = true
        investmentTextbox.delegate = self
        dateOfPurchaceTextbox.delegate = self
      
        
    }
    
    @IBAction func yourInfo(_ sender: Any) {
        showAlert(message: "Know About Your Info")
    }

    @IBAction func knowYouBetter(_ sender: Any) {
        showAlert(message: "Know Yourself Better")
    }
    
    
    @IBAction func knowYourRisk(_ sender: Any) {
        showAlert(message: "You can know that risk you are about to take")
    }
    
    
    @IBAction func yourFamily(_ sender: Any) {
        showAlert(message: "You can also have the desp about your family")
    }
    
    
    @IBAction func goalsBackBtnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DashbordViewController") as! DashbordViewController
        present(vc, animated: true)
    }
    
    
    @IBAction func addMoreBtn(_ sender: Any) {
        
        if investmentTextbox.text == ""
        {
          showAlert(message: "InvestmentField cannot be empty")
        }
        else {
        UserDefaults.standard.set(investmentTextbox.text, forKey: "invest")
        UserDefaults.standard.synchronize()
        investmentTextbox.text = ""
        
        UserDefaults.standard.set(dateOfPurchaceTextbox.text, forKey: "dobPurchace")
        UserDefaults.standard.synchronize()
        dateOfPurchaceTextbox.text = ""
        
        UserDefaults.standard.set(numberOfUnitTextbox.text, forKey: "numOfUnit")
        UserDefaults.standard.synchronize()
        numberOfUnitTextbox.text = ""
        
        UserDefaults.standard.set(purchacePriceTextBox.text, forKey: "purchacePrice")
        UserDefaults.standard.synchronize()
        purchacePriceTextBox.text = ""
            showAlert(message: "Data is saved in your Profile tab")
           }
    }
    
    
    //IBAction For Chat view you can send meesage to user
    
    @IBAction func chatBot(_ sender: Any) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        navigationController?.title = "Messages"
  navigationController?.pushViewController(vc, animated: true)
       vc.modalPresentationStyle = .overFullScreen
       
        
    }
    
    //Dropdown function on click of tab
    @IBAction func selfBtnClick(_ sender: Any) {
        investmentTextbox.text = "Self"
        dropDownView.isHidden = true
    }
    
    
    @IBAction func familyBtnClick(_ sender: Any) {
        investmentTextbox.text = "Family"
        dropDownView.isHidden = true
    }
    
    @IBAction func wifeBtnClick(_ sender: Any) {
        investmentTextbox.text = "Wife"
        dropDownView.isHidden = true
    }
    
    //UItextfield funtinality
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == investmentTextbox {
            dropDownView.isHidden = false
        }
       
        if textField == dateOfPurchaceTextbox {
            createDatePicker()
           }
       
    }
    
    
    
    func textFieldDidEndEditing(_ textField:UITextField){
        if textField == investmentTextbox {
            dropDownView.isHidden = true
        }
     
        if textField == dateOfPurchaceTextbox {
//            donedatePicker()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            dateOfPurchaceTextbox.text = formatter.string(from: datePicker.date)
            
            
        }
    }
    
    //date pickker
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donedatePicker))
        
        toolbar.setItems([donebtn], animated: true)
        
        dateOfPurchaceTextbox.inputAccessoryView = toolbar
        
        dateOfPurchaceTextbox.inputView = datePicker
        
        //dateOfPurchaceTextbox.datePickerMode = .date
    }
    @objc func donedatePicker() {
        let dateformator = DateFormatter()
        
        dateformator.dateStyle = .medium
        dateformator.timeStyle = .none
        dateOfPurchaceTextbox.text = dateformator.string(from: datePicker.date)
        self.view.endEditing(true)
    }

        func cancelDatePicker(){
         //cancel button dismiss datepicker dialog
          self.view.endEditing(true)
        }
     
    //common function for showing Alert
    
    func showAlert(message:String)
    {
        let alert =  UIAlertController.init(title: "Sample Finance Planner", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "okay", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
        
    }
    @IBAction func leftArrow(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
    
    @IBAction func rightArrow(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
}
    

