import jugador.* //importar modulo 
import direcciones.*

object config{
    method keybinds(){
        keyboard.d().onPressDo({derecha.mover(jugador)})    //moverse derecha
        keyboard.a().onPressDo({izquierda.mover(jugador)})  //moverse izquierda
        keyboard.f().onPressDo({jugador.disparar()})        //disparar
        keyboard.r().onPressDo({jugador.restart()})         //restart
    }
}

