//
//  SecondViewController.swift
//  ProductiveMuch
//
//  Created by Aarya Gupta on 2/22/20.
//  Copyright © 2020 Aarya Gupta. All rights reserved.
//

import UIKit

var activities = ["running", "walking", "yoga"]
var duration = [/*[*/"0","1","2","3", "4", "5","6","7","8","9","10","11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"/*], ["1","2","3", "4", "5","6","7","8","9","10","11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23","24", "25","26", "27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]*/]

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == addAct){
            return activities.count
        }
        else if (pickerView == durationPickerView){
            return duration.count
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if(pickerView == addAct){
            return 1
        }
        else if (pickerView == durationPickerView){
            return 2
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if(pickerView == addAct){
            return activities[row]
        }
        else{
            return (duration[row])
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //below prints what the user has selected
        if(pickerView == addAct){
            print (activities[row])
        }
        else if (pickerView == durationPickerView){
            print (duration[row]) //component
        }
    }
    
    //duration funcs
  /*
    func pickerViewd(_ durationPickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        return duration.count
    }
    
    func numberOfComponentsd(in durationPickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerViewd(_ durationPickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return duration[row]
    }
    
    func pickerViewd(_ durationPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(duration[row])
    } */
    @IBOutlet weak var addAct: UIPickerView!
    
    @IBOutlet weak var durationPickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAct.delegate = self
        addAct.dataSource = self
        durationPickerView.delegate = self
        durationPickerView.dataSource = self
    }
//

}

