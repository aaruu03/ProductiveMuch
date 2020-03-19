//
//  TableViewController.swift
//  ProductiveMuch
//
//  Created by Aarya Gupta on 3/3/20.
//  Copyright © 2020 Aarya Gupta. All rights reserved.
//

import UIKit
import Firebase

var counter = 0
class TableViewController: UIViewController {

    
    @IBAction func getCount(_ sender: UIButton) {
        print(counter)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        print(findate + " " + finhours + " " + finminutes + " " + finactivities + " " + finproductivity)
        
        let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let sortedStudents = students.sorted()
        print(sortedStudents)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
