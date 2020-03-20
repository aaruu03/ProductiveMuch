//
//  TableViewController.swift
//  ProductiveMuch
//
//  Created by Aarya Gupta on 3/3/20.
//  Copyright © 2020 Aarya Gupta. All rights reserved.
//
import UIKit
import Firebase

var counter = 12
var k = 1
let dateRef = db.collection(findate)
var query = dateRef.whereField("ID", isEqualTo: 1)
var activArr = [""]
var hoArr = [""]
var minuArr = [""]
var prodArr = [""]
class TableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectView: UICollectionView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var act : String = "uh"
    var hor : String = "oh"
    var min : String = "um"
    var pro : String = "er"
    var i = 1
    var y = 1
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (id*4)
    }
    

func getTheValue(){
            for m in 1...(id){
            db.collection(findate).whereField("ID", isEqualTo: k).getDocuments { (snapshot, error) in
                if error == nil && snapshot != nil{
                    print("IT DO THE WORK")
                    for document in snapshot!.documents{
                        print("IT DO THE WORK2")
                        // let documentData = document.data()
                        // print (documentData)
                        self.act = document.get("Activity") as! String
                        activArr.append(self.act)
                        
                        self.hor = document.get("Hours") as! String
                        hoArr.append(self.hor)
                        self.min = document.get("Minutes") as! String
                        minuArr.append(self.min)
                        self.pro  = document.get("Productivity") as! String
                        prodArr.append(self.pro)
                       
                        print("THE MIGHTY ARRAYS")
                        print(activArr,hoArr,minuArr,prodArr)
                    }
                }
            }
                k+=1
        }
      print("fired 0.1")
    }
    


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
        // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as!  CollectionViewCell
        cell.backgroundColor = UIColor.cyan
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
       
        let seconds = 2.00
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            
            switch self.i{
                
                case 1:
                    print("hi 1")
                
                // print(query.whereField("Activity", isEqualTo: true))
                //cell.myLabel.text = "1"
                    cell.myLabel.text = activArr[self.y]
                
                
                case 2:
                    print("hi 2")
                    cell.myLabel.text = hoArr[self.y]
                
                case 3:
                    print("hi 3")
                
                    cell.myLabel.text = minuArr[self.y]
                
                case 4:
                    print("hi 4")
                
                    cell.myLabel.text = prodArr[self.y]
               
                
                default :
                    break
            }
            self.i+=1
            print("iiiPOla ", (String)(self.y))
            
            if(self.i == 5){
                print("GOla ", (String)(self.y))
                self.i = 1
                self.y+=1
                print("UPDATES!!", (String)(self.y))
                if(self.y > id){
                    return
                }
                //self.getTheValue()
            }
        }
  
      return cell
        
    }
    

    func reloadData(){
        self.collectView.reloadData()
    }
    func printing(){
        print("IT WILL WORK BEFORE")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(findate + " " + finhours + " " + finminutes + " " + finactivities + " " + finproductivity)
        getTheValue()
        print("fired")
        
    }
    
    
}
