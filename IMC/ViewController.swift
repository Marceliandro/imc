//
//  ViewController.swift
//  IMC
//
//  Created by Marceliandro Silva on 15/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var ivConteudo: UIView!
    
    var imc:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calcular(_ sender: Any) {
        if let peso = Double(tfPeso.text!.replacingOccurrences(of: ",", with: ".")), let altura = Double(tfAltura.text!.replacingOccurrences(of: ",", with: ".")){
         imc = peso / (altura * altura)
            showResultado()
        }
    }
    
    func showResultado(){
        var resultado: String = ""
        var uriImg:String = ""
        
        switch imc {
            case 0..<16:
                resultado = "Magreza"
                uriImg = "magreza"
            case 16..<18.5:
                resultado = "Abaixo do peso"
                uriImg = "abaixo"
            case 18.5..<25:
                resultado = "Peso ideal"
                uriImg = "ideal"
            case 25..<30:
                resultado = "Sobrepeso"
                uriImg = "sobre"
            default:
                resultado = "Obesidade"
                uriImg = "obesidade"
        }
        
        lbResultado.text = "\(Int(imc)) : \(resultado)"
        ivResultado.image = UIImage(named: uriImg)
        ivConteudo.isHidden = false
        view.endEditing(true)
    }
}

