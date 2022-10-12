//
//  MainView.swift
//  AppNasa
//
//  Created by Paco Guerra on 12/10/22.
//

import SwiftUI

struct MainView: View {
    
    // Variable for binding
    @State var nombre : String = ""
    
    var body: some View {
        
        // Tab View on Bottom
        TabView {
            
            // View for Images
            ImagenesApiView(nombre: $nombre)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // View for Perfil
            PerfilView(nombre: $nombre)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
