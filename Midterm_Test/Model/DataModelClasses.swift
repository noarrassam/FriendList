//
//  DataModelClasses.swift
//  Midterm_Test
//
//  Created by Noar Rassam on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import Foundation

class DataModelClasses {
    
    var name:String
    var fName:String
    var gend:String
    var cty:String
    //var images:UIImage
    
    init() {
        self.name = ""
        self.fName = ""
        self.gend = ""
        self.cty = ""
        //self.images = ""
    }
    
    init(familyName:String, name:String, gender:String, city:String) {
        
        self.fName = familyName
        self.name = name
        self.gend = gender
        self.cty = city
        //self.images = images
    }
}
