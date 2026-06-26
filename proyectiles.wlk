import managers.*
import jugador.*

class Proyectil{
    method mover()
    method chocar(objeto)

    method inicializarColision()
}

class ProyectilJugador inherits Proyectil{
    var property position  
    const property image = "jugador-proyectil.png"

    override method mover(){
        if(! self.alBorde()){
            position = game.at(self.position().x(), self.position().y()+1)
        }else{
            managerProyectiles.remover(self)
        }
    }
    override method chocar(objeto){
        objeto.colision()
        managerProyectiles.remover(self) 
    }
    override method inicializarColision(){
        game.onCollideDo(self, ({objeto => self.chocar(objeto)}))
    }
    method alBorde(){
        return self.position().y() + 1 == game.height()
    }
    method colision(){
        
    }
}
class ProyectilEnemigo inherits Proyectil{
    var property position   
    var property image = "enemigo-proyectil.png"

    override method mover(){
        if(! self.alBorde()){
            position = game.at(self.position().x(), self.position().y()-1)
        }else{
            managerProyectiles.remover(self)
        }
    }
    override method chocar(objeto){
        objeto.colision()
        managerProyectiles.remover(self) 
    }
    override method inicializarColision(){
        game.onCollideDo(self, ({objeto => self.chocar(objeto)}))
    }
    method alBorde(){
        return self.position().y() - 1 == 0 
    }
    method colision(){

    }
}
// DESAPARECE ANTES DE LLEGAR AL BORDE = POSIBLE FIX -1 
// ERROR EN LA COLISION PROYECTIL ENEMIGO NO ENTIENDE COLISION 
// SE DEBE AL CHOQUE DE PROYECTILES ENEMIGO-JUGADOR 