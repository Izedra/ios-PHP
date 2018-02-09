//
//  FirstViewController.swift
//  tabbedapp
//
//  Created by usuario on 5/2/18.
//  Copyright © 2018 izedra. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // Variables
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfAsig: UITextField!
    @IBOutlet weak var tfNota: UITextField!
    @IBOutlet weak var tfTrim: UITextField!
    
    var url:String = ""
    var message:String = ""
    
    //Boton delete
    @IBAction func bDel(_ sender: Any) {
        // Obtencion de la direccion del servidor y ruta donde se encuentra el archivo php a ejecutar
        let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.1.184/www/iosdelete.php")! as URL)
        
        //Metodo por el cual se enviará la información al servidor
        request.httpMethod = "POST"
        
        let postStr = "nomalu=\(tfNombre.text!)&asig=\(tfAsig.text!)&trim=\(tfTrim.text!)"
        
        request.httpBody = postStr.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                self.message = "Error: \(String(describing: error))"
                print(self.message)
                return
            }
            
            //Recogemos y mostramos el resultado
            let responseStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if ((responseStr?.isEqual(to: "Nota registrada correctamente")))! {
                self.message = responseStr! as String
            } else {
                self.message = "Error al añadir"
            }
            
            print(self.message)
        }
        
        task.resume()
    }
    
    //Boton update
    @IBAction func bUpd(_ sender: Any) {
        // Obtencion de la direccion del servidor y ruta donde se encuentra el archivo php a ejecutar
        let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.1.184/www/iosupdate.php")! as URL)
        
        //Metodo por el cual se enviará la información al servidor
        request.httpMethod = "POST"
        
        let postStr = "nomalu=\(tfNombre.text!)&asig=\(tfAsig.text!)&nota=\(tfNota.text!)&trim=\(tfTrim.text!)"
        
        request.httpBody = postStr.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                self.message = "Error: \(String(describing: error))"
                print(self.message)
                return
            }
            
            //Recogemos y mostramos el resultado
            let responseStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if ((responseStr?.isEqual(to: "Nota registrada correctamente")))! {
                self.message = responseStr! as String
            } else {
                self.message = "Error al añadir"
            }
            
            print(self.message)
        }
        
        task.resume()
    }
    
    //Boton insert
    @IBAction func bAdd(_ sender: Any) {
        
        // Obtencion de la direccion del servidor y ruta donde se encuentra el archivo php a ejecutar
        let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.1.184/www/iosinsert.php")! as URL)
        
        //Metodo por el cual se enviará la información al servidor
        request.httpMethod = "POST"
        
        let postStr = "nomalu=\(tfNombre.text!)&asig=\(tfAsig.text!)&nota=\(tfNota.text!)&trim=\(tfTrim.text!)"
        
        request.httpBody = postStr.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                self.message = "Error: \(String(describing: error))"
                print(self.message)
                return
            }
            
            //Recogemos y mostramos el resultado
            let responseStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            if ((responseStr?.isEqual(to: "Nota registrada correctamente")))! {
                self.message = responseStr! as String
            } else {
                self.message = "Error al añadir"
            }
            
            print(self.message)
        }
        
        task.resume()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

