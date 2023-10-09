import nexus.*
import wollok.game.*

class Proyectil {
    var property position = nexus.position().left(1)
    const danioDeBala = 20
    var nro
    
    method image() = "bullet6.png"

    method moverse() {
        position = position.left(1)
        if(position.y() > game.height())
            self.sacar()
    }

    method empezarAMoverse() {
        game.onTick(100,"MoverBala" + nro,{self.moverse()})
        game.onCollideDo(self,{
            enemigo => enemigo.impactarEnemigo(danioDeBala)
            self.sacar()
        })
    }
    
     method sacar(){
         game.removeTickEvent("MoverBala" + nro)
         game.removeVisual(self)
     }
     
     method recibirDanio() {}
}