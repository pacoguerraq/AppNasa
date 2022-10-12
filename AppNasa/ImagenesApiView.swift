//
//  ContentView.swift
//  AppNasa
//
//  Created by Paco Guerra on 04/10/22.
//

import SwiftUI

struct ImagenesApiView: View {
    
    @StateObject var PhotoVM = PhotoViewModel()
    
    @Binding var nombre : String
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Text("Hola \(nombre)")
                    .foregroundColor(Color(red: 39/255, green: 174/255, blue: 96/255))
                
                List(PhotoVM.arrPhotos) { item in
                    VStack {
                        
                        Text(item.title)
                        AsyncImage(url: URL(string: item.url))
                            .scaledToFit()
                            .frame(height: 150)
                            .clipped()
                    }
                }
                
                .task {
                    do {
                        try await PhotoVM.getPhotosData()
                    } catch {
                        print("error1")
                    }
                }
                
            }.navigationTitle("Imagenes NASA Api")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagenesApiView(nombre: .constant("Paco"))
    }
}
