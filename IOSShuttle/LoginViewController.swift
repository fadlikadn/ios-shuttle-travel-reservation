//
//  LoginViewController.swift
//  IOSShuttle
//
//  Created by MTMAC23 on 8/1/17.
//  Copyright © 2017 MTMAC23. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import LoopBack
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextView: UITextField!
    @IBOutlet var passwordTextView: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        if self.emailTextView.text == "" || self.passwordTextView.text == "" {
            // Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.signIn(withEmail: self.emailTextView.text!, password: self.passwordTextView.text!) { (user, error) in
                if error == nil {
                    // Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    // Go to the HomePageViewController if the login is successful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    // Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
        }
    }
    
    @IBAction func loginLoopbackAction(_ sender: AnyObject) {
        if self.emailTextView.text == "" || self.passwordTextView.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        } else {
//            BackendUtilities.sharedInstance.clientRepo.login(withEmail: emailTextView.text, password: passwordTextView.text, success: { (client) -> Void in
//                NSLog("Sucessfully logged in.")
//                
//                // Display login confirmation
//                let alertController = UIAlertController(title: "Login", message: "Successfully logged in", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//            }, failure: { (error) -> Void in
//                NSLog("Error logging in.")
//                
//                // Display error alert
//                let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//            })
            
//            BackendUtilities.sharedInstance.clientRepo.userByLogin(withEmail: emailTextView.text, password: passwordTextView.text, success: { (client) -> Void in
//                NSLog("Sucessfully logged in.")
//                
//                // Display login confirmation
//                let alertController = UIAlertController(title: "Login", message: "Successfully logged in", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//            }, failure: { (error) -> Void in
//                NSLog("Error logging in.")
//                
//                // Display error alert
//                let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//            })
            
            // Login using Alamofire
            let parameters: Parameters = [
//                "username": "admin",
//                "password": "password"
                "username": emailTextView.text ?? "",
                "password": passwordTextView.text ?? ""
            ]
            
            Alamofire.request("http://localhost:3000/api/users/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate()
                .responseJSON(){ response in
                
                    NSLog("Result: \(response.result.value)")
                switch response.result {
                case .success:
                    NSLog("Sucessfully logged in.")
                    print("You have successfully logged in")
                    
                    // Display login confirmation
                    // let alertController = UIAlertController(title: "Login", message: "Successfully logged in", preferredStyle: UIAlertControllerStyle.alert)
                    // alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    // sself.present(alertController, animated: true, completion: nil)
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                case .failure(let error):
                    print(error)
                    NSLog("Error logging in.")
                    
                    // Display error alert
                    let alertController = UIAlertController(title: "Login", message: "Login failed", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
        }

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
