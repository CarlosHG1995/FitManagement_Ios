//
//  WorkoutsViewController.swift
//  FitManagement_Carlos
//
//  Created by cmu on 28/06/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController {

    var nombreUser = ""
    override func viewDidLoad() {
        super.viewDidLoad()
         tabla.dataSource = self
         tabla.delegate = self
         tabla.estimatedSectionHeaderHeight = 110
        navigationItem.prompt = "Listado de entrenamientos \(nombreUser) 🏋🏻‍♀️⚾️⚽️!!"
        // Do any additional setup after loading the view.
        print("works VC nombre \(nombreUser) ")
        tabla.separatorStyle = .none
        tabla.showsVerticalScrollIndicator = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutsToCreate"{
            guard let createVC = segue.destination as? CreateWorkoutViewController
            else { return }
            createVC.workoutCreatedHandler = save_workout
            //navigationController?.popViewController(animated: true)
        }
        if segue.identifier == "workout_details" {
            if let workoutDetail = segue.destination as? WorkoutsDetailsViewController {
                if let workout = sender as? Workout {
                    workoutDetail.workouts_detalles = workout
                    print("detalle workout \(workout)")
                }
            }
        }
    }
    
    var workoutCreatedHandler: ((Workout) ->Void)?
    var createdVC: CreateWorkoutViewController!
    
    private var listado_entrenamientos: [Workout] = []{
        didSet{
            tabla.reloadData()
        }
    }
    
    func save_workout (entrenamiento: Workout){
        print("entrenamiento \(entrenamiento) \n \(listado_entrenamientos)")
        listado_entrenamientos.append(entrenamiento)
        tabla.reloadData()
    }
    
    @IBAction func salir(_ sender: UIBarButtonItem) {
        print("btn salir clic")
        dismiss(animated: true, completion: {})
    }
     
    
    @IBOutlet weak var tabla: UITableView! {
        didSet {
            tabla.dataSource = self
            tabla.delegate = self
            tabla.estimatedSectionHeaderHeight = 110
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
/**/
extension WorkoutsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listado_entrenamientos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)
            as? WorkoutCell
        { cell.setup(for: listado_entrenamientos[indexPath.row])
          cell.viewdatos.layer.cornerRadius = cell.viewdatos.frame.height / 3
          cell.fecha.layer.cornerRadius = cell.fecha.frame.height / 2
        return cell
        }
        else {
            let cell = UITableViewCell.init()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print(listado_entrenamientos.count)
              listado_entrenamientos.remove(at: indexPath.row)
                //tabla.deleteRows(at: [indexPath], with: .middle)
                tabla.endUpdates()
                tabla.reloadData()
            
        }
        else if editingStyle == .insert {
                    // Not used in our example, but if you were adding a new row, this is where you would do it.
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clic \(indexPath.row)")
        performSegue(withIdentifier: "workout_details", sender: listado_entrenamientos[indexPath.row])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 //ancho de la celda
    }
}
