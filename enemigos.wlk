import jugador.*
import proyectiles.*

class Enemigo{
    var property position 
    var property image 

    method disparar(){
        const proyectil = new ProyectilEnemigo(position = self.position().y()-1)
        proyectil.inicialiarColision()
        proyectil.agregar(self)
    }
    method desaparecer(){
        game.removeVisual(self)
    }
}
