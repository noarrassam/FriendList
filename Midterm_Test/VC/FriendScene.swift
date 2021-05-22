//
//  FriendScene.swift
//  Midterm_Test
//
//  Created by Noar Rassam on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendScene: UIViewController {

    @IBOutlet var frndImage: UIImageView!
    @IBOutlet var familyNameLbl: UILabel!
    @IBOutlet var givenNameLbl: UILabel!
    @IBOutlet var genderLbl: UILabel!
    @IBOutlet var cityNameLbl: UILabel!
    var frndDataIndex: Int = 0

    var myModelM : DataModelManager?
    var myModelC = [DataModelClasses]()
    
    
    var familyname: String = ""
    var givenname: String  = ""
    var gender: String = ""
    var city: String  = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarBtnItem = UIBarButtonItem()
            backBarBtnItem.title = "My Friends List"
            navigationItem.backBarButtonItem = backBarBtnItem
       
        frndImage.image = APPDELEGATE?.localImagesArr[frndDataIndex]
        familyNameLbl.text = myModelC[frndDataIndex].name
        givenNameLbl.text =  myModelC[frndDataIndex].fName
        genderLbl.text =  myModelC[frndDataIndex].gend
        cityNameLbl.text =  myModelC[frndDataIndex].cty
        
    }
}
