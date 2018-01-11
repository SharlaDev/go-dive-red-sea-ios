//
//  ProgramsViewController.swift
//  Go Dive Red Sea
//
//  Created by Osama Hosokawa on 2017/11/26.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit

class ProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    let programsDic = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Programs", ofType: "plist")!)
    var dictWithProgramms = [String:AnyObject]()
    var sendArray = [Array<String>]()

    //MARK: VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let dictProgram = programsDic
        dictWithProgramms = dictProgram as! [String : AnyObject]
        
    }


    //MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(programsDic?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        var dictProg = dictWithProgramms["prog"+String(indexPath.row + 1)] as! [String:AnyObject]
       
        let programName = dictProg["ProgramName"] as! String
        dictProg.removeValue(forKey: "ProgramName")
        
        cell.subArrays = createArrayWithSubPrograms(dict: dictProg as! [String : Array<String>])// see mark: Methods
        cell.labelProgramm.text = programName
        
        return(cell)
    }

    
    //MARK: UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segaSubData") {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            guard case let cell as CustomCell = tableView.cellForRow(at: indexPath!) else {
                return
            }
            
            let SubProgramsViewController = (segue.destination as! SubProgramsViewController)
            SubProgramsViewController.arrayWithSubProgramms = cell.subArrays
        }
    }

    
    //MARK: Methods
    func createArrayWithSubPrograms (dict:[String:Array<String>]) -> Array<Array<String>>{
        var arrayForSendcTwo = [String]() //
        for keys in dict.keys {           // Create array with keys
            arrayForSendcTwo.append(keys) //
        }
        let sortedKeys = arrayForSendcTwo.sorted() // Sorted array with keys
        
        var arrayWithSubPrograms = [Array<String>]()// Create Array with SubPrograms
        for i in 0..<sortedKeys.count {             //
            let array = dict[sortedKeys[i]]         // Create SubPrograms Array
            arrayWithSubPrograms.append(array!)     // Append to Array with SubPrograms
        }
        return arrayWithSubPrograms
    }
    
    
    
}
