//
//  WorkoutCell.swift
//  FitManagement_Carlos
//
//  Created by cmu on 28/06/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import UIKit

class WorkoutCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var viewdatos: UIView!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var duracion: UILabel!
    @IBOutlet weak var tipo_ejercicio: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup (for entrenamiento: Workout){
        let fecha_formateada = DateFormatter()
        fecha_formateada.dateFormat = "dd MM YYYY"
        let fecha_fixed = fecha_formateada.string(for: entrenamiento.fecha)
        fecha.text = "Fecha\n\(fecha_fixed!)"
        duracion.text = "\(String(Int (entrenamiento.duracion))) Minutos"
        tipo_ejercicio.text = "Tipo de entrenamiento \n\(entrenamiento.tipo.rawValue)"//tipo.rawValue"
        print("setup workout cell \(fecha.text!), \(duracion.text!), \(entrenamiento.description)")
    }
}
