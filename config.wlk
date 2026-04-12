import jugador.* //importar modulo 
import direcciones.*
import managers.*
object config{
    method keybinds(){
        keyboard.d().onPressDo({derecha.mover(jugador)})    //moverse derecha
        keyboard.a().onPressDo({izquierda.mover(jugador)})  //moverse izquierda
        keyboard.f().onPressDo({jugador.disparar()})        //disparar
        keyboard.r().onPressDo({jugador.restart()})         //restart
    }
}

object onTicks{
    method tick(){
        const tickP = game.tick(1000, {managerProyectiles.mover()}, true)
        tickP.start()
    }
}