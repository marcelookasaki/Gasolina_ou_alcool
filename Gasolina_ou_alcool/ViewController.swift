//
//  ViewController.swift
//  Gasolina_ou_alcool
//
//  Created by Marcelo on 17/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PrecoGasolinaCampo: UITextField!
    
    @IBOutlet weak var PrecoAlcoolCampo: UITextField!
    
    @IBOutlet weak var ResultadoLegenda: UILabel!
    
    @IBAction func CalcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = PrecoAlcoolCampo.text {
            if let precoGasolina = PrecoGasolinaCampo.text {
                
                // Validar campos
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                // Calcular o melhor combustivel
                if validaCampos {
                    calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                    
                }else {
                    ResultadoLegenda.text = "Digite os preços para calcular!"
                }
                
            }
        }
        
        
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        }else if precoGasolina.isEmpty {
            camposValidados = false
        }
        return camposValidados
    }
    
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
             
                let resultadoPreco = valorAlcool/valorGasolina
                if resultadoPreco >= 0.7 {
                    self.ResultadoLegenda.text = "Melhor utilizar gasolina!"
                } else {
                    self.ResultadoLegenda.text = "Melhor utilizar alcool!"
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

