//
//  ViewController.swift
//  SingleDatePicker
//
//  Created by apple on 10/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UISingleDatePickerDataDelegate {
    
    @IBOutlet weak var singleDatePickerTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //textfield Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.resignFirstResponder()
        
        self.showEZSingleDatePickerView(currentViewControllerIdentifier : "viewController")
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        return true
    }
    
    
    //Custom Picker
    func showEZSingleDatePickerView(currentViewControllerIdentifier : String?)
    {
        
        let  customDatePicker:SingleDatePickerController = self.storyboard?.instantiateViewController(withIdentifier: "singleDatePickerController") as! SingleDatePickerController
        
        customDatePicker.currentViewController = currentViewControllerIdentifier!
        customDatePicker.delegate =  self
        customDatePicker.modalPresentationStyle = .overCurrentContext
        self.present(customDatePicker, animated: true, completion: nil)
    }
    
    
    //UISingleDatePickerDataDelegate
    func getSingleDatePickerData(selectedItem: String?) {
        self.view.endEditing(true)
        self.singleDatePickerTextfield.text =  selectedItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

