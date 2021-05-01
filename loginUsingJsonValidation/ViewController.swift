//
//  ViewController.swift
//  loginUsingJsonValidation
//
//  Created by macbook on 01/05/2021.
//

import UIKit

struct jsonstruct:Codable {
    let name:String
    let password:String
}
class ViewController: UIViewController {

    
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var arrdata = [jsonstruct]()
    var recievedArr = [jsonstruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }

    @IBAction func LoginBtn(_ sender: UIButton) {
        let user = userNameTF.text
        let pwd = passwordTF.text
        let url = URL(string: "https://run.mocky.io/v3/56f6e931-7989-48a7-bacd-b793a7311023")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error == nil {
                    self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                    for mainarr in self.arrdata{
                  //   print(mainarr.name,":",mainarr.password,":")
                   
                        if ((mainarr.name.contains(user!)) && (mainarr.password.contains(pwd!))) {
                            let saveName = mainarr.name
                            let savePwd = mainarr.password
                      print("name = \(saveName)\n password = \(savePwd)")
//                            self.performSegue(withIdentifier: "push", sender: nil)
                            DispatchQueue.main.async {
                                let vd = self.storyboard?.instantiateViewController(withIdentifier: "push") as? nextViewController
                                self.navigationController?.pushViewController(vd!, animated: true)
                            }
                         
                    }
            
                   
                }
                }
            
            }catch{
                print("Error in get json data")
            }
            
        }.resume()

        
        
    }
    
}

