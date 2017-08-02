//
//  HomePageViewController.swift
//  IOSShuttle
//
//  Created by MTMAC23 on 8/1/17.
//  Copyright © 2017 MTMAC23. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomePageViewController: UIViewController {
    
    @IBOutlet var logoutButtonView:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(sender: AnyObject) {
        // Logout using Firebase API
//        if FIRAuth.auth()?.currentUser != nil {
//            do {
//                try FIRAuth.auth()?.signOut()
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
//                present(vc, animated: true, completion: nil)
//            } catch let error as NSError {
//                print(error.localizedDescription)
//            }
//        }
        
        // Static logout for temporary
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
        present(vc, animated: true, completion: nil)
        
        // TODO replace with logout process using LoopBack API
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
