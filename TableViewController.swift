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

class TableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectView: UICollectionView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var act : String = "uh"
    var hor : String = "oh"
    var min : String = "um"
    var pro : String = "er"
    var i = 1
  
    
    @IBAction func getCount(_ sender: UIButton) {
        print(counter)
        print(act)
        print(hor)
        print(min)
        print(pro)
    }
    
    @IBAction func getDatabaseData(_ sender: UIButton) {
        print("1")
        db.collection(findate).getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil{ print("2")
                for document in snapshot!.documents{
                    print("3")
                    counter = counter + 1
                    let documentData = document.data()
                    print (documentData)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as!  CollectionViewCell

        // Use the outlet in our custom class to get a reference to the UILabel in the cell
 

    db.collection(findate).whereField("ID", isEqualTo: k).getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil{ print("document 1")
                for document in snapshot!.documents{
                    print("document 1 entered")
                    counter = counter + 1
                    let documentData = document.data()
                    print (documentData)
                    self.act = document.get("Activity") as! String
                    print(self.act, "Yay")
                    self.hor = document.get("Hours") as! String
                    self.min = document.get("Minutes") as! String
                    self.pro  = document.get("Productivity") as! String
                }
            }
        }
 
                    

                        switch self.i{
                            
                            case 1:
                                print("hi 1")
                                for i in 1...2{
                                    print("i freaking entere")
                                    
                                    cell.myLabel.text = "damn"
                                }
                               // cell.myLabel.text = "damn"
                            case 2:
                                print("hi 2")
                            
                                cell.myLabel.text = hor
                            case 3:
                                print("hi 3")
                               query.whereField("Minutes", isEqualTo: true).getDocuments() { (querySnapshot, err) in
                                       if let err = err {
                                           print("Error getting documents: \(err)")
                                       } else {
                                           for document in querySnapshot!.documents {
                                               print("\(document.documentID) => \(document.data())")
                                           }
                                       }
                               }
                                cell.myLabel.text = min
                            case 4:
                                print("hi 4")
                                query.whereField("Productivity", isEqualTo: true).getDocuments() { (querySnapshot, err) in
                                        if let err = err {
                                            print("Error getting documents: \(err)")
                                        } else {
                                            for document in querySnapshot!.documents {
                                                print("\(document.documentID) => \(document.data())")
                                            }
                                        }
                                }
                                cell.myLabel.text = pro
                            default :
                                break
                            }
                        self.i+=1
 
                        if(self.i == 5){
                            self.i = 1
                            k+=1
                            query = dateRef.whereField("ID", isEqualTo: k)
                            if(k>counter/4){
                                self.i=5
                            }
                        }
                        
        return cell
    }
    
    
    
    func reloadData(){
        self.collectView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(findate + " " + finhours + " " + finminutes + " " + finactivities + " " + finproductivity)


    }
    
 
}
