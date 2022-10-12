//
//  PerfilView.swift
//  AppNasa
//
//  Created by Paco Guerra on 12/10/22.
//

import SwiftUI

struct PerfilView: View {
    
    @Binding var nombre : String
    
    var body: some View {
        
        VStack{
            Text("Mi Perfil")
            Form {
                // Text("Hola \(nombre)!")
                TextField("Nombre", text: $nombre)
            }
        }

    }
}

struct PerfilView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilView(nombre: .constant("Paco"))
    }
}
