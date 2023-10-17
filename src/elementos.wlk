import wollok.game.*

class ObjetoVisual {
	var property position 
	var property image
	
	method crearObjeto() {
		game.addVisual(self)
	}
	
	method moverseA(unaDireccion) {
		position = game.at(
			position.x() + (unaDireccion.x()-position.x())/2,
			position.y() + (unaDireccion.y()- position.y())/2
		)
	}
}

// Jugador:
object jugador inherits ObjetoVisual(image = "playerAbajo.png", position = game.at(2,3)) {

    method derecha() {
        position = position.right(1)
        image= "playerDerecha.png"
    }
    
    method izquierda() {
        position = position.left(1)
        image = "playerIzquierda.png"
    }
    
    method arriba() {
        position = position.up(1)
        image = "playerArriba.png"
    }
    
    method abajo() {
    	position = position.down(1)
    	image = "playerAbajo.png"
    }
   	
   	method recibirAtaque(unAtaque) {}
}

// Nexus: 
object nexus inherits ObjetoVisual(image = "player.png", position = game.center()) {
	var nroBala = 0
	
	method disparar() {
        nroBala = nroBala + 1
        const bala = new Proyectil(nro = nroBala)
        game.addVisual(bala)
        bala.empezarAMoverse() 
    }
   
   	method recibirAtaque(unAtaque) {} 
}

// Pantallas:
const pantallaDeInicio = new ObjetoVisual(image = "pantallaDeInicio.png", position = game.at(0,0))
const pantallaDeInstrucciones = new ObjetoVisual(image = "pantallaDeInstrucciones.png", position = game.at(0,0))
const pantallaDePresentacion = new ObjetoVisual(image = "pantallaDePresentacion.png", position = game.at(0,0))


// Proyectil:
class Proyectil inherits ObjetoVisual(image = "bullet6.png", position = nexus.position().left(1)) {
    const danioDeBala = 20
    var nro
    
    method moverse() {
        position = position.left(1)
        if(position.y() > game.height())
            self.sacar()
    }

    method empezarAMoverse() {
        game.onTick(100,"MoverBala" + nro,{self.moverse()})
        game.whenCollideDo(self, {unEnemigo => unEnemigo.recibirAtaque(danioDeBala) 
        	self.sacar()
        })
    }
    
     method sacar(){
         game.removeTickEvent("MoverBala" + nro)
         game.removeVisual(self)
     }
     
     method recibirAtaque(unAtaque) {}
}