import jugador.* //importar modulo 
import direcciones.*
import managers.*
import enemigos.*
object config{
    method keybinds(){
        keyboard.d().onPressDo({derecha.mover(jugador)})    //moverse derecha
        keyboard.a().onPressDo({izquierda.mover(jugador)})  //moverse izquierda
        keyboard.f().onPressDo({jugador.disparar()})        //disparar
        keyboard.r().onPressDo({jugador.restart()})         //restart
    }
}

object onTicks{
    const tickP = game.tick(250, {managerProyectiles.mover()}, true)
    //esto funciona perfecto 
    const spawnEnemigos = game.tick(5000, {enemigoIndividual.spawnearEnemigos()}, true)
    const disparar = managerEnemigos.onTickDisparo()
    //aca voy a poner todos los ticks del juego como const y que arranquen con el method 
    method tick(){
        spawnEnemigos.start()
        tickP.start()
        disparar.start()
    }
    // ahora, cuando quiera reiniciar voy a parar todos los ticks 

}
