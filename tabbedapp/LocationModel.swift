//
//  LocationModel.swift
//  tabbedapp
//
//  Created by usuario on 8/2/18.
//  Copyright © 2018 izedra. All rights reserved.
//

import Foundation


class LocationModel: NSObject {
    
    //Propiedades
    
    var nomalu: String!
    var asig: String!
    var nota: String!
    var trim: String!
    
    
    //Constructor vacio
    
    override init(){}
    
    //Constructor con los parametros 'Alumno', 'Asignatura', 'Nota', y 'Trimestre'
    
    init(nomalu: String!, asig: String!, nota: String!, trim: String!) {
        self.nomalu = nomalu
        self.asig = asig
        self.nota = nota
        self.trim = trim
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Alumno: \(nomalu!), Asignatura: \(asig!), Nota: \(nota!), Trimestre: \(trim!)"
    }
    
    
}
