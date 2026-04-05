import jugador.*
import proyectiles.*
//podria hacer una clase manager y que hereden 
object managerEnemigos{
/*Este objeto se va a encargar de el comportamiento de todo lo relacionado a los enemigos*/
    const enemigos = []

    method moverEnemigos(){
        enemigos.forEach({enemigo => enemigo.mover()})
    }
    method agregar(enemigo){
        enemigo.add(enemigo)
        game.addVisual(enemigo)
    }
    method remover(enemigo){
        enemigos.remove(enemigo)
    }
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
    //Colision con objetos 
    method colision(){
       //self.desaparecer()
        managerEnemigos.remover(self) /*aca podria apuntar con una var al manager en vez de usar la 
                                    referencia global, pero no lo veo necesario, el manager siempre va
                                    a ser el mismo*/
    }
   /* method mover(enemigo){
        position = moverAPosicionVacia(self.position)
    }*/

}
