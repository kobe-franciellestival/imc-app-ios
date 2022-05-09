//
//  ViewController.swift
//  imc-app-ios
//
//  Created by Francielle Stival on 29/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var peso: Double = 50.0
    var altura: Double = 1.50
    var resultado: Double = 0.0
    
    @IBOutlet weak var heightLalb: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightLalb.text = "150.0"
        weightLbl.text = "50.0"
    }
    
    @IBAction func addHeight(_ sender: UIButton){
        altura = StrToDouble(str: heightLalb.text!)
        altura += 1
        heightLalb.text = DoubleToStr(num: altura)
        altura = StrToDouble(str: heightLalb.text!) / 100
    }
    
    @IBAction func dimHeight(_ sender: UIButton) {
        altura = StrToDouble(str: heightLalb.text!)
        altura -= 1
        heightLalb.text = DoubleToStr(num: altura)
        altura = StrToDouble(str: heightLalb.text!) / 100
    }
    
    @IBAction func addWeight(_ sender: UIButton) {
        peso = StrToDouble(str: weightLbl.text!)
        peso += 1
        weightLbl.text = DoubleToStr(num: peso)
        peso = StrToDouble(str: weightLbl.text!)
    }
    
    @IBAction func dimWeight(_ sender: UIButton) {
        peso = StrToDouble(str: weightLbl.text!)
        peso -= 1
        weightLbl.text = DoubleToStr(num: peso)
        peso = StrToDouble(str: weightLbl.text!)
    }
    
    func DoubleToStr (num: Double) -> String {
        let res = String(num)
        return res
    }
        
    func StrToDouble (str: String) -> Double {
        var res = Double(str) ?? 0.0
        if res <= 0 {
            res = 0
        }
        return res
    }
    
    func calculaIMC(p: Double, a: Double) -> Double {
        let res = p / (a * a)
        return res
    }
    
    func infoIMC(resultado: Double) -> String {
        var info = " "
        if resultado < 18.5 {
            info = "MAGREZA"
        } else if resultado >= 18.5 && resultado <= 24.9 {
            info = "NORMAL"
        } else if resultado >= 24.9 && resultado <= 29.9 {
            info = "SOBREPESO"
        } else if resultado >= 30.0 && resultado <= 39.9 {
            info = "OBESIDADE"
        } else {
            info = "OBESIDADE GRAVE"
        }
        return info
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultadoView{
            let vc = segue.destination as? ResultadoView
            resultado = calculaIMC(p: peso, a: altura)
            vc?.resVar = String(format: "%.2f", resultado)
            vc?.resInfo = infoIMC(resultado: resultado)
        }
    }
    
}

