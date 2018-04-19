//
//  QuestoesViewController.swift
//  quizNight
//
//  Created by wanderley Landim  on 03/04/2018.
//  Copyright © 2018 wanderleylb. All rights reserved.
//

import UIKit

class QuestoesViewController: UIViewController {


    @IBOutlet weak var dicaImg: UIImageView!
    @IBOutlet weak var stackbotoes: UIStackView!
    var cities : [String] = ["Curitiba","Toronto","New York","Washington"]
    var options : [String] = ["São Paulo", "Vancouver", "Paris"]
    var opcaoCerta : Int!
    var pontuacao : Int = 0
    
    func embaralhar (vetor : [String]) -> [String] {
        var vetorModificavel = vetor
        if vetor.count < 2 {return vetor}
        
        for i in 0 ..< vetor.count - 1 {
            let j = Int(arc4random_uniform(UInt32(vetor.endIndex - i))) + i
            if i != j {
                //Troca os elementos
                vetorModificavel.swapAt(i, j)
            }
        }
        return vetorModificavel
        
    }
    
    func carregarQuestoes() {
        if(cities.count == 0){
            return
        }
        
        let indice = Int(arc4random_uniform(UInt32(cities.count)))
        let cidade = cities[indice]
        cities.remove(at: indice)
        
        let imageName = cidade.replacingOccurrences(of: " ", with: "").lowercased() + ".jpg"
        dicaImg.image = UIImage(named: imageName)
        
        var minhasOpcoes = embaralhar(vetor: options)
        opcaoCerta = 0
        for (indice, opcao) in minhasOpcoes.enumerated(){
            if opcao == cidade {
                opcaoCerta = indice
                break
            }
        }
        
        if opcaoCerta >= 4{
            // Trocar opção certa para estar entre as 4 primeiras
            let novaOpcaoCerta = Int(arc4random_uniform(UInt32(4)))
            minhasOpcoes.swapAt(opcaoCerta, novaOpcaoCerta)
            opcaoCerta = novaOpcaoCerta
        }
        var opcao = 0
        for view in stackbotoes.subviews {
            if let btn = view as? UIButton {
                btn.setTitle(minhasOpcoes[opcao], for: .normal)
                opcao += 1
            }
        }
    }
    
    func botao(_ num :Int) {
        if num == opcaoCerta {
            print("Acertou")
            pontuacao += 1 // pontuação = pontuação + 1
        }
        else
        {
            print ("Errou")
        }
        carregarQuestoes()
        
    }
    
    
    @IBAction func botao1Click(_ sender: Any) {
        botao(0)
    }
    
    @IBAction func botao2Click(_ sender: Any) {
        botao(1)
    }
    
    @IBAction func botao3Click(_ sender: Any) {
        botao(2)
    }
    
    @IBAction func botao4Click(_ sender: Any) {
        botao(3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        options.append(contentsOf: cities)
        carregarQuestoes()

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? GameOverViewController {
           destino.pontuacao = self.pontuacao
        }
    }
    
    
}
