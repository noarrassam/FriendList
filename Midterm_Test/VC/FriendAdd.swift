//
//  FriendAdd.swift
//  Midterm_Test
//
//  Created by Noar Rassam on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

let APPDELEGATE = UIApplication.shared.delegate as? AppDelegate


protocol addFriendsDelegate {
    func addFriends(user: DataModelClasses)
}

protocol SendImage {
    func addFriends(image: UIImage)
}

class FriendAdd: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var familyName: UITextField!
    
    @IBOutlet weak var gName: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
//    var localImagesArr = UIImage()
    var localImagesArr = [UIImage]()

        
    var modelR:DataModelManager?
    
    var modelC = [DataModelClasses]()
    
    var delegate : addFriendsDelegate?
    
    var i:Int = 0
    
    let imagePicker = UIImagePickerController()

    var myModelC = [DataModelClasses]()

//    let appDelegate = UIApplication.sharedApplication.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    //MARK: Pick image from Camera & Gallary
    @IBAction func PickerImage(_ sender: Any) {

        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default)
             {
                UIAlertAction in
                self.openCamera()
             }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default)
             {
                UIAlertAction in
                self.openGallary()
             }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
             {
                UIAlertAction in
             }

            // Add the actions
            imagePicker.delegate = self
             alert.addAction(cameraAction)
             alert.addAction(gallaryAction)
             alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self .present(imagePicker, animated: true, completion: nil)
        }
        else
        {
                // don't have camera
        }
    }
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                imagePicker.delegate = self;
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
               }
    }

    //MARK: ImagePicker Controller Delegate methods
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           self.dismiss(animated: true, completion: nil)
       }

       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           imageView.image = chosenImage
           dismiss(animated:true, completion: nil)
       }
   
    //MARK: Save Data

    @IBAction func Save(_ sender: Any) {
        
        if familyName.text!.isEmpty || gName.text!.isEmpty || gender.text!.isEmpty || city.text!.isEmpty || imageView.image == nil{
            let alert = UIAlertController(title: "Alert", message: "Please Enter Data In All Fields", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                        print("Data Missing!")
                    }))
                    self.present(alert, animated: true, completion: nil)
        } else {
//            let generateImageNameStr = String(myModelC.count)
            let newUser = DataModelClasses(familyName: familyName.text!, name: gName.text!, gender: gender.text!, city: city.text!)
                if let myDelegate = delegate{
                    myDelegate.addFriends(user: newUser)
                    APPDELEGATE?.localImagesArr.append(imageView.image!)
                    
                    let alert = UIAlertController(title: "Success!", message: "Data Added Successfully", preferredStyle: .alert)

                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                                self.navigationController?.popViewController(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
            }
        }
        
       /* if let famName = familyName.text {
            if let gName = gName.text {
                if let gender = gender.text {
                    if let city = city.text {
                        let newUser = DataModelClasses(familyName: famName, name: gName, gender: gender, city: city)
                            if let myDelegate = delegate{
                                myDelegate.addFriends(user: newUser)
                                navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
        }*/
    }
    
    @IBAction func Cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
