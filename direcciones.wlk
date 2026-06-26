import jugador.*
import enemigos.*

class Direccion{
    method mover(jugador)
    method siguientePosicion(posicion)
    method hayBordeHacia(jugador)
}
object derecha inherits Direccion{
    override method mover(jugador){
        if(!self.hayBordeHacia(jugador)){
            jugador.position(self.siguientePosicion(jugador.position()))
        }
    }
    override method siguientePosicion(posicion){
        return game.at(posicion.x() + 1, posicion.y())
    }
    override method hayBordeHacia(jugador){
        return jugador.position().x()+1 == game.width()
    }
}
object izquierda inherits Direccion{
    override method mover(jugador){
        if(!self.hayBordeHacia(jugador)){
            jugador.position(self.siguientePosicion(jugador.position()))
        }
    }
    override method siguientePosicion(posicion){
        return game.at(posicion.x() - 1, posicion.y())
    }
    override method hayBordeHacia(jugador){
        return jugador.position().x() -1 == -1
    }
}