//
//  FeedVC.swift
//  SocialAppIlkay
//
//  Created by TAE experts on 31/05/2017.
//  Copyright © 2017 IlkayHamit. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Add table methods
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostCell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ILKAY: ID REMOVED - \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "showSignIn", sender: nil)
    }

}
