import jugador.*
object contadorVidas{
    var position = game.at(12,15)

    method image(){
        return "corazon" + jugador.vidas() + ".png"
    }
    method position(){
        return position 
    }
    method colision(){
        
    }

    /*method position(){
        return game.at(0,15)
    }
    method text(){
        return ""+jugador.vidas() 
    }
    method textColor(){
        return "FF0000FF"
    }*/

}