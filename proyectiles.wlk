import managers.*
import jugador.*

class Proyectil{
//Clase abstracta 
/*Esto es una clase abstracta, se usa para definir mensajes sin ningun comportamiento, este ultimo lo van
a definir las clases que hereden de la abstracta
Generalmente los criterios que uso son, bueno si tengo muchas cosas que comparten un tipo, puedo hacer una 
clase abstracta que defina los comportamientos en comun de las posibles clases hijas, despues cada una 
redefine y si es necesario agrega tanto mensajes como atributos*/ 
    method mover()
    method chocar(objeto)
    //method desaparecer()
/*Observacion: este mensaje de abajo, es el mismo para ambas clases entonces pensaras, bueno por que no 
definis el comportamiento ahora? Bueno, por que si no dejaria de ser una clase abstracta, ya que esta no
puede tener ningun comportamiento definido, entonces se perderia el concepto que quiero que veas de usar 
templates, ya que dudo que vuelva a aplicarlo
En un futuro se podrian agregar enemigos con distintos comportamientos mas complejos y reducir el proyectil
a una clase no abstracta, pero programar enemigos con distintos comportamientos es mas complejo*/
    method inicializarColision()
}

class ProyectilJugador inherits Proyectil{
//Herencia de la abstracta 
/*Esto es una clase hija, como podes ver aca, se definen los comportamientos heredados de las clase padre,
en esta clase tambien podes agregar cosas nuevas. Para definir los mensajes heredados se utiliza la palabra 
OVERRIDE, acordate que las redefiniciones deben ser sobre mensajes iguales (con esto me refiero a que deben
tener la misma firma siempre)
*/

    var property position  //debo fijarme la pos del jugador, y el proyectil va a estar 1 mas arriba
                            /*no es necesario inicializar la posicion, eso lo hago a la hora de disparar
                            o sea cuando inicializo una instancia de esta clase*/
    const property image = "jugador-proyectil.png"

    override method mover(){
        if(! self.alBorde()){
            position = game.at(self.position().x(), self.position().y()+1)
            //game.at no recibe una posicion completa, recibe un x e y 
        }else{
            managerProyectiles.remover(self)
        }
    }
    override method chocar(objeto){
        objeto.colision()
        managerProyectiles.remover(self) //Misma observacion que con los enemigos 
    }
    override method inicializarColision(){
        game.onCollideDo(self, ({objeto => self.chocar(objeto)}))
    }
    method alBorde(){
        return self.position().y() + 1 == game.height()
    }
}
class ProyectilEnemigo inherits Proyectil{
    var property position   //debo fijarme la pos del enemigo, y el proyectil va a estar 1 mas abajo 
                            /*no es necesario inicializar la posicion,  eso lo hago a la hora de disparar
                            o sea cuando inicializo una instancia de esta clase*/
    var property image = "enemigo-proyectil.png"

    override method mover(){
        if(! self.alBorde()){
            position = game.at(self.position().x(), self.position().y()-1)
        }else{
            managerProyectiles.remover(self)
        }
    }
    override method chocar(objeto){
        objeto.colision()
        managerProyectiles.remover(self) //Misma observacion ue con los enemigos 
    }
    override method inicializarColision(){
        game.onCollideDo(self, ({objeto => self.chocar(objeto)}))
    }
    method alBorde(){
        return self.position().y() - 1 == 0 
    }
}