//
//  ResultadoView.swift
//  imc-app-ios
//
//  Created by Francielle Stival on 09/05/22.
//

import UIKit

class ResultadoView: UIViewController {
    var resVar : String = " "
    var resInfo : String = " "
    
    @IBOutlet weak var InfoVarLbl: UILabel!
    @IBOutlet weak var resVarLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resVarLbl?.text = resVar
        InfoVarLbl?.text = resInfo
    }
    

}
