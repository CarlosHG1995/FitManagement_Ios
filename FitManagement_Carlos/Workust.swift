//
//  Workust.swift
//  FitManagement_Carlos
//
//  Created by cmu on 28/06/2020.
//  Copyright © 2020 UPV. All rights reserved.
//

import Foundation

struct Workout: CustomStringConvertible {
    var duracion : Int
    var fecha : Date
    var tipo : WorkoutType
 
    var description: String{ 
        print("description \(duracion) \(fecha) \(tipo)")
        return "\(duracion) \(fecha) \(tipo)"
    }

   // let workout_ = Workout(duracion: 0, fecha: Date, tipo: <#T##WorkoutType#>) String(Int(sender.value))
    //let formato_fecha = DateFormatter()
    //formato_fecha.dateFormat = "dd MMM yyyy"
    //let fecha_workout = formato_fecha.string(from: fecha.date)

}
enum  WorkoutType : String{
    case EMOM, Tabata, AMRAP, ForTime
}
