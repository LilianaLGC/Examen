//
//  ViewController.swift
//  Examen
//
//  Created by Lili on 26/01/22.
//

import UIKit
import Foundation

class ViewController: UIViewController ,UITextFieldDelegate{
   
    

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var tableView1: UITableViewCell!
    //var model = PostListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxt.placeholder = "Ingresa tu nombre"
        nameTxt.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let caracterer = CharacterSet.letters
        let caracterSet = CharacterSet(charactersIn: string)
        return caracterer.isSuperset(of: caracterSet)
    }
    
    @IBAction func popUp(_ sender: Any) {
        let popUpVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idPopUpID") as! PopUpViewController
        self.addChild(popUpVc)
        popUpVc.view.frame = self.view.frame
        self.view.addSubview(popUpVc.view)
        popUpVc.didMove(toParent: self)
        
    }
    @IBAction func graficaBtn(_ sender: Any) {
        let vc = GraficasViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
//no logre mostrar los datos de url hacia la grafica












