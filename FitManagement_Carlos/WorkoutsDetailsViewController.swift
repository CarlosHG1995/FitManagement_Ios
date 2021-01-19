//
//  WorkoutsDetailsViewController.swift
//  FitManagement_Carlos
//
//  Created by Carlos on 24/12/20.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit

class WorkoutsDetailsViewController: UIViewController {
    
    var workouts_detalles: Workout! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("vista detalles workout \(workouts_detalles!)")
        cargarDetalles()
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var informacion_workout: UILabel!
    func cargarDetalles(){
        let formato_fecha = DateFormatter()
        formato_fecha.dateFormat = "dd/MMM/yyyy HH:MM"
        let fecha_workout = formato_fecha.string(from: workouts_detalles.fecha)
        if workouts_detalles != nil {
            informacion_workout.text = "Detalles workout\nDuración: \(workouts_detalles.duracion) minutos\nTipo de entrenamiento: \(workouts_detalles.tipo.rawValue)\nFecha: \(fecha_workout) "
        }
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
