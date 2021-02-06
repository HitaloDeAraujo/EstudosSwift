//
//  ViewController.swift
//  SpaceInvaders
//
//  Created by Hitalo on 03/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgNave: UIImageView!
    
    @IBOutlet weak var btnEsquerda: UIButton!
    @IBOutlet weak var btnDireita: UIButton!
    
    @IBOutlet weak var btnDisparo: UIButton!
    @IBOutlet weak var btnBala: UIButton!
    
    @IBOutlet weak var btnAlien0: UIButton!
    @IBOutlet weak var btnAlien1: UIButton!
    @IBOutlet weak var btnAlien2: UIButton!
    
    let incrementoMovimento:CGFloat = 20
    
    let minX:CGFloat = 0
    var maxX:CGFloat = 0
    
    var disparoEmAndamento = false
    
    var posInicialAlien0:CGRect!
    var posInicialAlien1:CGRect!
    var posInicialAlien2:CGRect!
    
    var posInicialNave:CGRect!
    
    var alienSaltoFrame = 5
    var auxAlienSaltoFrame = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnEsquerda.addTarget(self, action: #selector(didBtnDirecaoClick), for: .touchUpInside)
        btnDireita.addTarget(self, action: #selector(didBtnDirecaoClick), for: .touchUpInside)
        
        btnDisparo.addTarget(self, action: #selector(didBtnDispararClick), for: .touchUpInside)
        
        maxX = self.view.frame.size.width - imgNave.frame.width
        
        atualizarPosXBala()
        
        posInicialAlien0 = btnAlien0.frame
        posInicialAlien1 = btnAlien1.frame
        posInicialAlien2 = btnAlien2.frame
        
        posInicialNave = imgNave.frame
        
        Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }

    @objc func gameLoop() {
        
        if(disparoEmAndamento){
            let XPosition:CGFloat = btnBala.frame.origin.x
            let YPosition:CGFloat = btnBala.frame.origin.y - 10

            btnBala.frame =  CGRect(x: XPosition, y: YPosition, width: btnBala.frame.width, height: btnBala.frame.height)
            
            if YPosition < -90 {
                disparoEmAndamento = false
                atualizarPosXBala()
                habilitarDisparo()
            }
            
            verificarColizao(_bala: btnBala, _alien: btnAlien0)
            verificarColizao(_bala: btnBala, _alien: btnAlien1)
            verificarColizao(_bala: btnBala, _alien: btnAlien2)
        }
        
        
        if auxAlienSaltoFrame == alienSaltoFrame        {
            let alien0XPosition:CGFloat = posInicialAlien0.origin.x + (btnAlien0.frame.origin.x < posInicialAlien0.origin.x + 1 ? 5 : -5)
            let alien1XPosition:CGFloat = posInicialAlien1.origin.x + (btnAlien1.frame.origin.x < posInicialAlien1.origin.x ? 5 : -5)
            let alien2XPosition:CGFloat = posInicialAlien2.origin.x + (btnAlien2.frame.origin.x < posInicialAlien2.origin.x - 2 ? 5 : -5)
            
            let alien0YPosition:CGFloat = posInicialAlien0.origin.y + (btnAlien0.frame.origin.y < posInicialAlien0.origin.y + 1 ? 5 : -5)
            let alien1YPosition:CGFloat = posInicialAlien1.origin.y + (btnAlien1.frame.origin.y < posInicialAlien1.origin.y ? 5 : -5)
            let alien2YPosition:CGFloat = posInicialAlien2.origin.y + (btnAlien2.frame.origin.y < posInicialAlien2.origin.y - 2 ? 5 : -5)

            btnAlien0.frame =  CGRect(x: alien0XPosition, y: alien0YPosition, width: btnAlien0.frame.width, height: btnAlien0.frame.height)
            btnAlien1.frame =  CGRect(x: alien1XPosition, y: alien1YPosition, width: btnAlien1.frame.width, height: btnAlien1.frame.height)
            btnAlien2.frame =  CGRect(x: alien2XPosition, y: alien2YPosition, width: btnAlien2.frame.width, height: btnAlien2.frame.height)
            
            auxAlienSaltoFrame = 0
        }
        
        auxAlienSaltoFrame = auxAlienSaltoFrame + 1
        
        if verificarFimJogo() {
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(reiniciarJogo), userInfo: nil, repeats: false)
        }
    }
    
    func verificarColizao(_bala: UIButton, _alien: UIButton) {
        let x1 = _bala.frame.origin.x / 2
        let y1 = _bala.frame.origin.y / 2
        
        let x2 = _alien.frame.origin.x / 2
        let y2 = _alien.frame.origin.y / 2
        
        if calcularDistacia(x1: Int(x1), y1: Int(y1),
                            x2: Int(x2), y2: Int(y2)) <= 30 {
            disparoEmAndamento = false
            atualizarPosXBala()
            habilitarDisparo()
            
            _alien.isHidden = true
        }
    }
    
    func verificarFimJogo() -> Bool {
        return btnAlien0.isHidden &&
            btnAlien1.isHidden &&
            btnAlien2.isHidden
    }
    
    @objc func reiniciarJogo() {
        btnAlien0.isHidden = false
        btnAlien1.isHidden = false
        btnAlien2.isHidden = false
        
        imgNave.frame = posInicialNave
        
        atualizarPosXBala()
    }
    
    
    @objc func didBtnDirecaoClick(_sender: UIButton) {
        let XPosition:CGFloat = imgNave.frame.origin.x + (_sender === btnEsquerda ? -1 * incrementoMovimento : incrementoMovimento)

        let YPosition:CGFloat = imgNave.frame.origin.y

        if(XPosition >= minX && XPosition <= maxX) {
            imgNave.frame =  CGRect(x: XPosition, y: YPosition, width: imgNave.frame.width, height: imgNave.frame.height)
        }
        
        if(!disparoEmAndamento) {
            atualizarPosXBala()
        }
    }
    
    func atualizarPosXBala() {
        let XPosition:CGFloat = imgNave.frame.origin.x + (imgNave.frame.width / 2) - (btnBala.frame.width / 2)

        let YPosition:CGFloat = imgNave.frame.origin.y - 30
        
        btnBala.frame =  CGRect(x: XPosition, y: YPosition, width: btnBala.frame.width, height: btnBala.frame.height)
    }
    
    @objc func didBtnDispararClick(_sender: UIButton) {
        desabilitarDisparo()
        disparar()
    }
    
    func disparar() {
        disparoEmAndamento = true
    }
    
    func desabilitarDisparo() {
        btnDisparo.isEnabled = false
    }
    
    func habilitarDisparo() {
        btnDisparo.isEnabled = true
    }
    
    func calcularDistacia(x1: Int,y1: Int,x2: Int,y2: Int) -> Double{
        let powX = pow(Decimal(x2) - Decimal(x1), 2)
        let powY = (pow(Decimal(y2) - Decimal(y1), 2))
        
        let resultPow = (powX + powY)
        
        let resultDouble = Double(truncating: resultPow as NSNumber)

        let raiz  = sqrt(resultDouble)
       
        return raiz
    }
}
