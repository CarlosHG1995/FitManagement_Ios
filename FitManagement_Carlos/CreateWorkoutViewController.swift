//
//  CreateWorkoutViewController.swift
//  FitManagement_Carlos
//
//  Created by cmu on 28/06/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    let pickerArray = [WorkoutType.EMOM.rawValue,
                       WorkoutType.Tabata.rawValue,
                       WorkoutType.AMRAP.rawValue,
                       WorkoutType.ForTime.rawValue]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        entrenamiento.text = pickerArray[row]
        print("entrena \(entrenamiento.text!)")
    }
     
    var workoutCreatedHandler: ((Workout) ->Void)?
    var createVC: CreateWorkoutViewController!
    
    @IBOutlet weak var entrenamiento: UILabel!
    func crearEntrenamiento() {
        var entrena = entrenamiento.text ?? ""
        if entrena == "" {
            return entrena = "EMOM"
        }
        let tipo_workout = entrena
        
        let formato_fecha = DateFormatter()
        formato_fecha.dateFormat = "dd MMM yyyy"
        let fecha_workout = formato_fecha.string(from: fecha.date)
        let duracion_entrenamiento = Int(duracion.value) //\(fecha.date) fecha completa
        print ("entrenamiento creado: \n \(duracion_entrenamiento) \(tipo_workout) \(fecha_workout)")
        let workout1 = Workout(duracion: Int(duracion_entrenamiento) , fecha: fecha.date, tipo: WorkoutType(rawValue: tipo_workout)!)
        print("workout \(workout1)")
        workoutCreatedHandler?(workout1)
        empty()
    }
    
    @IBAction func createWorkout(_ sender: UIBarButtonItem) {
        crearEntrenamiento()
        navigationController?.popViewController(animated: true)
    }
     
  
    
    func empty() {
        label_duracion.text = ""
        duracion.value = 0.0
        picker_workout = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         picker_workout.delegate = self
         picker_workout.dataSource = self
    }
    
    var entrena = ""// tipo entrenamiento
    var valor = "" //obtener valor del slider
    @IBAction func slider_time(_ sender: UISlider) {
        valor = String(Int(sender.value))
        label_duracion.text = String(format: "\(valor) minutos")
    }
    
    @IBOutlet weak var label_duracion: UILabel!
    
    @IBOutlet weak var duracion: UISlider!
    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var picker_workout: UIPickerView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
