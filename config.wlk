import jugador.* //importar modulo 
import enemigos.*

object config{
    method keybinds(){
        keyboard.d().onPressDo({derecha.mover(jugador)})    //moverse derecha
        keyboard.a().onPressDo({izquierda.mover(jugador)})  //moverse izquierda
        keyboard.f().onPressDo({jugador.disparar()})        //disparar
        keyboard.r().onPressDo({jugador.restart()})         //restart
    }
}
class Direccion{
    method mover(jugador){
        if(self.noHayBordeHacia()){
            jugador.position(self.siguientePosicion(jugador.position()))
        }
    }
    method siguientePosicion(posicion){
        return 
    }
    method noHayBordeHacia(){
        return 
    }
}
object derecha inherits Direccion{
    override method siguientePosicion(posicion){
        return game.at(posicion.x() + 1, posicion.y())
    }
    override method noHayBordeHacia(){
        return self.siguientePosicion(jugador.position()) != game.at(15,0)
    }
}
object izquierda inherits Direccion{
    override method siguientePosicion(posicion){
        return game.at(posicion.x() - 1, posicion.y())
    }
    override method noHayBordeHacia(){
        return self.siguientePosicion(jugador.position()) != game.at(-1,0)
    }
}