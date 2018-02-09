//
//  HomeModel.swift
//  tabbedapp
//
//  Created by usuario on 8/2/18.
//  Copyright © 2018 izedra. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //Propiedades
    
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    let urlPath = "http://192.168.1.184/www/iosselect.php"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Fallo al descargar los datos")
            } else {
                print("Datos descargados")
                self.parseJSON(data!)
            }
        }
        
        task.resume()
    }
    
    /////////////////////
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        print(jsonResult.count)
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let nomalu = jsonElement["Alumno"] as? String,
                let asig = jsonElement["Asignatura"] as? String,
                let nota = jsonElement["Nota"] as? String,
                let trim = jsonElement["Trimestre"] as? String
            {
                
                location.nomalu = nomalu
                location.asig = asig
                location.nota = nota
                location.trim = trim
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
}
