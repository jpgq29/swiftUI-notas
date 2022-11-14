//
//  AddView.swift
//  Notas
//
//  Created by Appa on 8/11/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    var body: some View {
        VStack{
            Text(model.updateItem != nil ? "Editar Nota" :"Agregar Nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                if model.updateItem != nil {
                    model.editData(context: context)
                }else{
                    model.saveData(context: context)
                }
            }){
                Label(
                    title: {Text(model.updateItem != nil ? "Editar" :"Guardar").foregroundColor(.white).bold()},
                    icon: {Image(systemName: "plus").foregroundColor(.white)})
            }.padding()
                .background(model.nota == "" ? Color.gray: Color.blue)
                .cornerRadius(8)
                .disabled(model.nota == "" ? true: false)
        }.padding()
    }
    
    init(model:ViewModel){
        self.model = model
        print("Abre Sheet")
    }
    
}
