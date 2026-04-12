import managers.*
import proyectiles.*

object jugador{
    var property vidas = 3 
    var property position = game.at(7,0)

// Aca le voy a dar pos al proyectil, que es la del jugador + 1 en y 
    method positionP(){
        return game.at(self.position().x(), self.position().y() +1)
    } 
    

    method image(){
        return "jugador.png"
    }

    method disparar(){
        const proyectil = new ProyectilJugador(position = self.positionP())
/*Aca lo que hago es crear una instancia de la clase ProyectilJgador, seteandole la posicion al momento 
de instanciarlo. A lo que se refiere instanciar es, crear un objeto de una clase, pero este no va a ser un
WKO*/
        managerProyectiles.agregar(proyectil)
        proyectil.inicializarColision()
    }
    //Coslision con objetos 
    method colision(){
        self.restarVida()
/*Esto es una verificacion, se usa para redirigir el flujo de codigo*/
        self.verificarVidas()
    }
    method restart(){
        self.vidas(3)
        self.position(game.at(7,0))
        self.limpiarTablero()
    }
    method limpiarTablero(){
        managerEnemigos.limpiar()
        managerProyectiles.limpiar()
    }
//Methods relacionados con las vidas de la nave 
   method restarVida(){
        vidas = vidas - 1 
   }
   method estaViva(){
        return vidas > 0 
   }
   method verificarVidas(){
/*Aca quiero que, si no tiene mas vidas, pare el juego*/
    if(! self.estaViva()){
        game.stop()
    }
   }
}