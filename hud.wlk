import jugador.*
object contadorVidas{
    method text() = "" + jugador.vidas()
    var property position = game.at(1,14)
    method textColor(){
        return "FFFFFFFF"
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