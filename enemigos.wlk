import jugador.*
import proyectiles.*

object managerEnemigos{
/*Este objeto se va a encargar de el comportamiento de todo lo relacionado a los enemigos*/
    const enemigos = []

    method limpiar(){
        enemigos.forEach({enemigo => enemigo.remove()})
    }
}

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
    method colision(){
        game.removeVisual(self)
    }
}
