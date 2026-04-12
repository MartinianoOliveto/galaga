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
    const tickP = game.tick(1000, {managerProyectiles.mover()}, true)
    //aca voy a poner todos los ticks del juego como const y que arranquen con el method 
    method tick(){
        tickP.start()
    }
    // ahora, cuando quiera reiniciar voy a parar todos los ticks 
}
