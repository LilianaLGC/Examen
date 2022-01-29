//
//  Network.swift
//  Examen
//
//  Created by lili on 27/01/22.
//

import Foundation

class NetworkManager {
    func dowloadJSON(completed: @escaping() -> ()) {
        let  url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.dato = try JSONDecoder().decode([Post].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("JSON ERROR")
                }
            }
            
        }.resume()
    }
}






























