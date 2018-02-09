//
//  SecondViewController.swift
//  tabbedapp
//
//  Created by usuario on 5/2/18.
//  Copyright © 2018 izedra. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    
    //Variables
    @IBOutlet weak var tabla: UITableView!
    var feedItems: NSArray = NSArray()
    var selectedLoc: LocationModel = LocationModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabla.delegate = self
        self.tabla.dataSource = self
        
        let homemodel = HomeModel()
        homemodel.delegate = self
        homemodel.downloadItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.tabla.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Devuelve la cantidad de filas/celdas
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Crea las celdas
        let cellIdentifier: String = "celdaBase"
        let myCell: UITableViewCell = tabla.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: LocationModel = feedItems[indexPath.row] as! LocationModel
        // Introduce las referencias en las celdas
        myCell.textLabel!.text = item.description
        return myCell
    }
}

