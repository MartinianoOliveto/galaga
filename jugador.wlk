import enemigos.*
import proyectiles.*

object jugador{
    var property vidas = 3 
    var property score = 0 
    var property position = game.at(7,0)

    method image(){
        return "jugador.png"
    }

    method disparar(){
        const proyectil = new ProyectilJugador(position = self.position().x()+1)
/*Aca lo que hago es crear una instancia de la clase ProyectilJgador, seteandole la posicion al momento 
de instanciarlo. A lo que se refiere instanciar es, crear un objeto de una clase, pero este no va a ser un
WKO*/
        proyectil.agregar(self)
        proyectil.inicialiarColision()
    }
}