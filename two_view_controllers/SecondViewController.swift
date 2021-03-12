//
//  SecondViewController.swift
//  two_view_controllers
//
//  Created by SOMA SEKHAR ANAPARTHI on 11/03/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var userSegment: UISegmentedControl!
    
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var login: UIButton!
    
    var loginUser = ""
    var userPassword = ["user" : "user"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userSegmentation(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0{
            sender.selectedSegmentTintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            userNameLabel.isHidden = false
            passwordLabel.isHidden = false
            userName.isHidden = false
            password.isHidden = false
            
            userName.text = ""
            password.text = ""
            
            register.isHidden = false
            login.isHidden = true
            //print("Login:\(login.isHidden)")
           // print("Regis:\(password.isHidden)")
            
            message.text = "Please create credentials to Register"
            message.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }else if sender.selectedSegmentIndex == 1{
            sender.selectedSegmentTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            userNameLabel.isHidden = false
            passwordLabel.isHidden = false
            userName.isHidden = false
            password.isHidden = false
            
            userName.text = ""
            password.text = ""
            
            register.isHidden = true
            login.isHidden = false
            //print("Login:\(login.isHidden ? "visible" : "not visible")")
            //print("Regis:\(password.isHidden ? "visible" : "not visible")")
            
            message.text = "Please give credentials to Login"
            message.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }else if sender.selectedSegmentIndex == 2{
            userName.text = ""
            password.text = ""
            userNameLabel.isHidden = true
            passwordLabel.isHidden = true
            userName.isHidden = true
            password.isHidden = true
            register.isHidden = true
            login.isHidden = true
            
            message.text = ""
        }
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        print("register User Pressed")
        if userName.text != ""{
            if password.text != ""
            {
                let gUser = userName.text!
                let gPassword = password.text!
                for user in userPassword.keys
                {
                    if user == gUser {
                        message.text = "User Name Already Exists Please Choose other"
                        message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                        break
                    }else{
                        userPassword[gUser] = gPassword
                        print(userPassword)
                        message.text = "Registration Succesful Please Login"
                        message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                    }
                }
            }else{
                message.text = "Please enter Password"
                message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }else{
            message.text = "Please enter User Name"
            message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        loginUser = ""
        if userName.text != ""{
            if password.text != ""{
                let gUser = userName.text!
                let gPassword = password.text!
                for user in userPassword.keys{
                    if user == gUser {
                        if userPassword[user] == gPassword{
                            loginUser = userName.text!
                            message.text = "Login Succesfull"
                            message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                            userSegment.isSelected = true
                            userName.text = ""
                            password.text = ""
                            break
                        }else{
                            message.text = "Wrong Password"
                            message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                        }
                    }else{
                        message.text = "User Doesn't Exists"
                        message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    }
                }
            }else{
                message.text = "Please enter Password"
                message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }else{
            message.text = "Please enter User Name"
            message.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if segue.identifier == "segue" {
            let destinationController = segue.destination as! ViewController
            destinationController.message = loginUser
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segue"{
            if loginUser.isEmpty{
               return false
            }
        }
        return true
    }
    
    
    
    
    

}
