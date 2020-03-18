//
//  FirstViewController.swift
//  ProductiveMuch
//
//  Created by Aarya Gupta on 2/22/20.
//  Copyright © 2020 Aarya Gupta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,  UITextFieldDelegate{

    @IBOutlet weak var editAct: UITextField!
    

    var savedText: String!
    var pickerView = UIPickerView()
    
   //add userinput to pickerview
   func textFieldShouldReturn(_ editAct: UITextField) -> Bool {
        savedText = editAct.text
        print (savedText)
        
        for activity in activities {
            //ensures no duplicate activities are added
            if(savedText.isEqual(activity)){
                print("already entered")
                editAct.resignFirstResponder()
                return false
            }
            
        }
        activities.append(savedText)
        editAct.resignFirstResponder()
        return false
    }
    
    @IBAction func addActButton(_ sender: Any) {
        showAlertWithTextField()
    }
    func activitySubmittedAlert(){
        let alert = UIAlertController(title: "Response recorded", message: " Your activity has been added", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTextField() {
        let alertController = UIAlertController(title: "Add new activity", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                // operations
                print("Text==>" + text)
                for activity in activities{
                    if(text.caseInsensitiveCompare(activity) == .orderedSame){
                        print("already entered")
                        self.alreadyEnteredAlert()
                        return
                    }
                    for char in text{
                        if(!char.isLetter){
                            print("oop")
                            self.invalidInputAlert()
                            return
                        }
                    }
                }
                activities.append(text)
                sortedActivities = activities.sorted()
                self.activitySubmittedAlert()
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Activity"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func alreadyEnteredAlert(){
        let alert = UIAlertController(title: "Activity already entered", message: "This activity already exists in the selector", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func invalidInputAlert(){
        let alert = UIAlertController(title: "Invalid Input", message: "Please only enter lowercase or capital letters", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func activityDeletedAlert(){
        let alert = UIAlertController(title: "Activity Deleted", message: "The activity has been removed from the list!", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func activityNotFoundAlert(){
        let alert = UIAlertController(title: "Activity not found", message: "We were unable to find the activity", preferredStyle: UIAlertController.Style.alert)
        let tryAction = UIAlertAction(title: "Try Again", style: .default){ (_) in
            self.showAlertWithDTextfield()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addAction(cancelAction)
        alert.addAction(tryAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func DeleteActButton(_ sender: UIButton) {
        showAlertWithDTextfield()
    }
    
    func showAlertWithDTextfield(){
       let alertController = UIAlertController(title: "Delete activity", message: nil, preferredStyle: .alert)
              let confirmAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
                  if let txtField = alertController.textFields?.first, let text = txtField.text {
                      // operations
                      print("Text==>" + text)
                      for activity in activities{
                          if(text.caseInsensitiveCompare(activity) == .orderedSame){
                              print("found it!")
                            //delete function
                            activities.removeAll { $0 == text }
                            sortedActivities = activities.sorted()
                            print(activities)
                            print("removed")
                           
                            //alert thats it been deleted
                            self.activityDeletedAlert()
                              return
                          }
                          
                      }
                    //not found please try again alert
                    self.activityNotFoundAlert()
                  }
              }
              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
              alertController.addTextField { (textField) in
                  textField.placeholder = "Activity"
              }
              alertController.addAction(confirmAction)
              alertController.addAction(cancelAction)
              self.present(alertController, animated: true, completion: nil)
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("activities")
       //showAlertWithTextField()
        editAct.delegate = self
    }
   /* override func viewDidAppear(_ animated: Bool) {
        //showAlertWithTextField()
    }*/
}

