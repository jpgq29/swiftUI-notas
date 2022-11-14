//
//  ViewModel.swift
//  Notas
//
//  Created by Appa on 7/11/22.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject{
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateItem: Notas!
    
    //Core data
    func saveData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        do {
            try context.save()
            print("Guardó")
            show.toggle()
        } catch let error as NSError {
            print("No guardó...", error.localizedDescription)
        }
    }
    
    func deleteData(item:Notas, context: NSManagedObjectContext){
        context.delete(item)
        do {
            try context.save()
            print("Eliminó")
        } catch let error as NSError {
            print("No se pudo borrar", error.localizedDescription)
        }
    }
    
    func sendData(item:Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.fecha = fecha
        updateItem.nota = nota
        do {
            try context.save()
            print("Editó")
            show.toggle()
        } catch let error as NSError {
            print("No se pudo editar", error.localizedDescription)
        }
    }
    
}
