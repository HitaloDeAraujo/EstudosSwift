import UIKit
import Foundation

var str = "Hello, playground"

print(str)
umNovoMundo()
imprimirAlgo(nome: "Elvis", idade: 12);

imprimirCoisas(nomes: "1","2", "3")

let objpessoa = Pessoa()
print(objpessoa.idade)

ExecutorSingleton.instanciaCompartilhada.processoOperacao();

func umNovoMundo() {
    print("um novo mundo")
}

func imprimirAlgo(nome : String = "Presley") {
    print(nome)
}

func imprimirAlgo(nome : String = "Presley", idade : Int) {
    print("\(nome) com \(idade) anos")
}

func imprimirCoisas(nomes: String...){
    for nome in nomes {
        print(nome)
    }
}

class Pessoa {
    var idade = 25
    
    init(){
        print("Nova instancia")
    }
}

class ExecutorSingleton  {
    static let instanciaCompartilhada = ExecutorSingleton()
    
    init(){
        print("ExecutorSingleton")
    }
    
    func processoOperacao() {
        print("Iniciando a funcao processoOperacao")
    }
}
