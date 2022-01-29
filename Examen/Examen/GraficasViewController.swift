//
//  GraficasViewController.swift
//  Examen
//
//  Created by IDS Comercial on 27/01/22.
//

import UIKit
import Charts
class GraficasViewController: UIViewController{
    
    
    @IBOutlet weak var charCircle: PieChartView!
    @IBOutlet weak var charCircle2: PieChartView!
    var dato  = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dowloadJSON {
            print("suceesfiul")
            self.generaGraficoDona ()
            self.generaGraficoDona2 ()
        }
    }
    func generaGraficoDona () {
        let dato1 = PieChartDataEntry(value: 1.0, data:Double(7))
        let dato2 = PieChartDataEntry(value: 2.0, data:Double(7))
        let dato3 = PieChartDataEntry(value: 3.0, data:Double(50))
            let dataSet = LineChartDataSet(entries: [dato1, dato2, dato3], label: "Leyenda Linea")
            let data = PieChartData(dataSets: [dataSet])
        charCircle.data = data
        charCircle.notifyDataSetChanged()
    }
    func generaGraficoDona2 () {
        let dato1 = PieChartDataEntry(value: 1.0, data:Double(7))
        let dato2 = PieChartDataEntry(value: 2.0, data:Double(7))
        let dato3 = PieChartDataEntry(value: 3.0, data:Double(50))
            let dataSet = LineChartDataSet(entries: [dato1, dato2, dato3], label: "Leyenda Linea")
            let data = PieChartData(dataSets: [dataSet])
        charCircle2.data = data
        charCircle2.notifyDataSetChanged()
    }
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



















