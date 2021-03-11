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
    
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
        // Do any additional setup after loading the view.
    }
    
    var loginUser = ""
    var userPassword = ["user1":"12345"]
    
    @IBAction func newUserPressed(_ sender: Any) {
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
    }
    
    @IBAction func exisUserPressed(_ sender: Any) {
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
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        if userName.text != ""{
            if password.text != ""{
                userPassword[userName.text!] = password.text!
                userName.text = ""
                password.text = ""
                message.text = "Registration Succesful Please Login"
                message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                register.isHidden = true
                login.isHidden = false
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
                for user in userPassword.keys{
                    if user == userName.text {
                        if userPassword[user] == password.text{
                            loginUser = userName.text!
                            message.text = "Login Succesfull"
                            message.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                            userNameLabel.isHidden = true
                            passwordLabel.isHidden = true
                            userName.isHidden = true
                            password.isHidden = true
                            register.isHidden = true
                            login.isHidden = true
                            
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
    
    
    @IBAction func clearPressed(_ sender: Any) {
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
