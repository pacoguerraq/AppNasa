//
//  PhotoViewModel.swift
//  AppNasa
//
//  Created by Paco Guerra on 04/10/22.
//

import Foundation
import SwiftUI

class PhotoViewModel : ObservableObject {
    @Published var arrPhotos = [PhotoModel]()
    
    func getPhotosData() async throws {
        
        // 1. obtener el objeto url
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10")
            else {
                print("invalid url")
                return
            }
        
        // 2. preparar el request a la pagina http con la URL
        let urlRequest = URLRequest(url: url)
        
        // 3. realizar la llamada con URLSession
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error2")
            return
        }
        
        // 4. decodificar la informacion de formato JSON
        let results = try JSONDecoder().decode([PhotoModel].self, from: data)
        
        // print(results)
        
        // utilizamos el thread principal para actualizar la variables de Photos
        DispatchQueue.main.async{
            self.arrPhotos = results
        }
        
    }
}
