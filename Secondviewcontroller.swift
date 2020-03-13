//
//  SecondViewController.swift
//  ProductiveMuch
//
//  Created by Aarya Gupta on 2/22/20.
//  Copyright © 2020 Aarya Gupta. All rights reserved.
//

import UIKit

var activities = ["running", "walking", "yoga"]
var duration = ["0","1","2","3", "4", "5","6","7","8","9","10","11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
var minutes = ["0", "1","2","3", "4", "5","6","7","8","9","10","11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23","24", "25","26", "27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]
var finhours : String = "0"
var finminutes : String = "0"
var finactivities: String = activities[0]
var finproductivity: String = "Productive"

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var addAct: UIPickerView!
    
    @IBOutlet weak var durationPickerView: UIPickerView!
    
    @IBOutlet weak var productiveSwitch: UISegmentedControl!
    
    @IBAction func submitButton(_ sender: UIButton) {
        print("activity is " + finactivities + " and time is " + finhours + " hours and " + finminutes + " minutes and you were " + finproductivity)
    }
    
    @IBAction func indexChanged(_ sender: Any) {
        switch productiveSwitch.selectedSegmentIndex
        {
        case 0:
           finproductivity = "UnProductive"
        case 1:
            finproductivity = "Productive"
        default:
            break
        }
    }
    func reloadAllComponents(){
        self.addAct.reloadAllComponents()
        print("entered")
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == addAct){
            return activities.count
        }
        else if (pickerView == durationPickerView){
            if(component == 0){
                return duration.count
            }
            else{
                return minutes.count
            }
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
            if(component == 0){
                return (duration[row])
            }
            else{
                return (minutes[row])
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //below prints what the user has selected
        self.addAct.reloadAllComponents()
        if(pickerView == addAct){
            print (activities[row])
            finactivities = activities[row]
        }
        else if (pickerView == durationPickerView){
            if(component == 0){
                print (duration[row])
                finhours = duration[row]
            }
            else{
                print (minutes[row])
                finminutes = minutes[row]
            }
           // finhours = duration[row]
           // finminutes = minutes[row]
        }
        //add after submit to save everything
        printDuration()
    }
    
    func printDuration(){
        print(finhours + "," + finminutes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAct.delegate = self
        addAct.dataSource = self
        durationPickerView.delegate = self
        durationPickerView.dataSource = self
    }
//
   /* var finhours : String = "0"
    var finminutes : String = "0"
    var finactivities: String = activities[0]
    var finproductivity: String = "Productive"
*/

}

