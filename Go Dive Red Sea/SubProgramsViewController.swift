//
//  SubProgramsViewController.swift
//  Go Dive Red Sea
//
//  Created by user on 09.12.17.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit

class SubProgramsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var arrayWithSubProgramms = [Array<String>]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithSubProgramms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        let subArray = arrayWithSubProgramms[indexPath.row]
        let str = subArray[0]
        cell.arrayWithDescriptionAndPhoto = subArray
        cell.labelProgramm.text =  str
        return(cell)
    }
    
    
    //MARK: UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segaSub") {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            guard case let cell as CustomCell = tableView.cellForRow(at: indexPath!) else {
                return
            }
            
            let SubProgramViewController = (segue.destination as! SubProgramViewController)
            SubProgramViewController.subArray = cell.arrayWithDescriptionAndPhoto
        }
    }

}
