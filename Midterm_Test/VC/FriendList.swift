//
//  FriendListTableViewController.swift
//  Midterm_Test
//  Created by Noar Rassam on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendList: UITableViewController, addFriendsDelegate {
    
    var rowSelected : Int?
    
    var myModelM : DataModelManager?
    var myModelC = [DataModelClasses]()
        
    var imageArr = [UIImage]()

    var localIndex:IndexPath!
    
    func addFriends(user: DataModelClasses) {
        myModelC.append(user)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addNewFriend") {
            let svc = segue.destination as! FriendAdd
            //svc.images = imageArr[rowSelected!]
            svc.delegate = self
            //self.present(svc, animated: true)
        } else if (segue.identifier == "friendScene") {
            let svc = segue.destination as! FriendScene
//            svc.delegate = self
            svc.myModelM = myModelM
            svc.myModelC = myModelC
            svc.frndDataIndex = localIndex.row
//            svc.txtFormFVCRE = name
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myModelC.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableViewCell
        cell.userImage.image = APPDELEGATE!.localImagesArr[indexPath.row]
        cell.users.text = myModelC[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        rowSelected = indexPath.row
        if myModelC.count>0
        {
            localIndex = indexPath

            performSegue(withIdentifier: "friendScene", sender: self)
        }
    }
}
