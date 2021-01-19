//
//  ViewController.swift
//  FitManagement_Carlos
//
//  Created by cmu on 28/06/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTxtField.becomeFirstResponder() //el puntero lo ponga ahí sin necesidad de que el usuario lo haga
    }


    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    var nombreUsuario: String = ""
    var contrasenaUsuario: String = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func paso_A_otra_vista() {
        self.nombreUsuario = usernameTxtField.text!
        self.contrasenaUsuario = passwordTxtField.text!
        print("nombre es", nombreUsuario, "password", contrasenaUsuario)
        performSegue(withIdentifier: "loginToWorkouts", sender: self)
    }
    
    @IBAction func Login(_ sender: UIButton) {
        if(usernameTxtField.text == "" || passwordTxtField.text == ""){
            alerta(titulo: "Datos Inválidos", mensaje: "Por favor rellena los campos de usuario y contraseña")
        } else {
            paso_A_otra_vista()
        }
    }
     
   /**/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = segue.destination as? WorkoutsViewController
        data?.nombreUser = self.nombreUsuario
    }
    func alerta(titulo: String, mensaje:String){
        let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { (action) in
            print("campos vacios")
            self.dismiss(animated: true, completion: nil)
            }))
            self.present(alertController, animated: true, completion: nil)
    }
}

