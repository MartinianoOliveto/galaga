import managers.*
import proyectiles.*
class Enemigo{
    var property position 
    var property image 

    method disparar(){
        const proyectil = new ProyectilEnemigo(position = self.position().y()-1)
        managerProyectiles.agregar(proyectil)
        proyectil.inicializarColision()
    }
    //Colision con objetos 
    method colision(){
        managerEnemigos.remover(self) /*aca podria apuntar con una var al manager en vez de usar la 
                                    referencia global, pero no lo veo necesario, el manager siempre va
                                    a ser el mismo*/
    }

}
