import managers.*
import proyectiles.*
class Enemigo{
    var property position 
    var property image = "enemigo.png"

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


/*Mi idea es hacer que los enemigos vayan apareciendo en dsitintas formas, por 
ejemplo en patrones, voy a empezar a definirlos como WKO y veo si despues los paso a 
clases, por ahora voy a hacer 1 patron y luego agregar mas*/
object patronHorizontal3{
    var property posicionInicial = game.center()

    method spawnearEnemigos(){
        self.spawnearEnemigo(self.posicionInicial())
        self.spawnearEnemigo(self.posicionInicial() + 1)
        self.spawnearEnemigo(self.posicionInicial() -1)
    }
    method spawnearEnemigo(posicion){
        const enemigo = new Enemigo(position = self.posicionInicial())
        managerEnemigos.agregar(enemigo)
    }
}
/*Falta modelar el comportamiento de los enemigos, por ejemplo la frecuencia de 
disparo, frecuencia de movimiento frecuencia de spawn
LO SIGUIENTE A HACER VA A SER LE COMPORTAMIENTO DE LOS ENEMIGOS*/