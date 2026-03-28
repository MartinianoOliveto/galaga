import jugador.* //importar modulo 


object config{
    method keybinds(){
        keyboard.d().onPressDo({derecha.mover(jugador)})    //moverse derecha
        keyboard.a().onPressDo({izquierda.mover(jugador)})    //moverse izquierda
       // keyboard.f().onPressDo()    //disparar
       // keyboard.r().onPressDo()    //restart
    }
}
class Direccion{
    /*method mover(jugador){
        if(jugador.puedeMoverse(self.siguientePosicion(jugador.position()))){
            jugador.position(self.siguientePosicion(jugador.position()))
        }
    }*/
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