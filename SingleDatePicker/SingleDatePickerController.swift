//
//  SingleDatePickerController.swift
//  SingleDatePicker
//
//  Created by apple on 10/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

protocol UISingleDatePickerDataDelegate {
    
    func getSingleDatePickerData (selectedItem : String?)
}

class SingleDatePickerController: UIViewController {
    
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet weak var toolBarView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectedIndex: Int = 0
    var selectedDate:String?
    
    var currentViewController : String =  String()
    var delegate:UISingleDatePickerDataDelegate!
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUISetup()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
        
    }
    
    func initialUISetup()
    {
        self.automaticallyAdjustsScrollViewInsets =  false
        self.navigationController?.navigationBar.isHidden =  true
        
    }
    
    //Single Date Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBAction func singleDatePickerValueChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        selectedDate = dateFormatter.string(from: sender.date)
        
    }
    @IBAction func cancelPicker(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func donePicker(_ sender: Any) {
        
        if (selectedDate == nil)
        {
            getDefaultDateIfTimepickerValueNotChanged()
            self.delegate.getSingleDatePickerData(selectedItem: selectedDate)
        }
        else {
            
            self.delegate.getSingleDatePickerData(selectedItem: selectedDate)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func todayButtonClicked(_ sender: Any) {
        getTodaysDate()
        self.delegate.getSingleDatePickerData(selectedItem: selectedDate)
        self.dismiss(animated: true, completion: nil)
        
    }
    func getDefaultDateIfTimepickerValueNotChanged()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = DateFormatter.Style.none
        selectedDate = formatter.string(from: datePicker.date)
        
    }
    func getTodaysDate()
    {
        let date:Date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.medium
        dateformatter.timeStyle = DateFormatter.Style.none
        
        selectedDate = dateformatter.string(from: date)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
