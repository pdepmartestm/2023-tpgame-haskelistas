import wollok.game.*

class ObjetoNoVisual {
	var property position
}



class ObjetoVisual {
	var property position 
	var property image
	var lastPosition = position
	
	method crearObjeto() {
		game.addVisual(self)
	}
	
	method moverseA(unaDireccion) {
		position = game.at(
			position.x() + (unaDireccion.x()-position.x())/2,
			position.y() + (unaDireccion.y()- position.y())/2
		)
	}
	
    method choco() {
    	// el jugador contra que choco? 
    	position = lastPosition
    }
    
    
}

// Jugador:
object jugador inherits ObjetoVisual(image = "playerAbajo.png", position = game.at(2,3)) {
	
	const limiteDerecha = 9
	const limiteIzquierda = 0
	const limiteArriba = 9
	const limiteAbajo = 0
	
    method derecha() {
    	lastPosition = position
        position = position.right(1)
        image= "playerDerecha.png"
        self.fueraDeMarcoHorizontal()
    }
    
    method izquierda() {
    	lastPosition = position
        position = position.left(1)
        image = "playerIzquierda.png"
        self.fueraDeMarcoHorizontal()
    }
    
    method arriba() {
    	lastPosition = position
        position = position.up(1)
        image = "playerArriba.png"
        self.fueraDeMarcoVertical()
    }
    
    method abajo() {
    	lastPosition = position
    	position = position.down(1)
    	image = "playerAbajo.png"
    	self.fueraDeMarcoVertical()
    }
    
    method fueraDeMarcoHorizontal() {
    	// chequeo horizontal
    	if (position.x() < limiteIzquierda || position.x() > limiteDerecha) {
    		position = lastPosition
    	}
    }
    
    method fueraDeMarcoVertical() {
    	// chequeo vertical
    	if (position.y() > limiteArriba || position.y() < limiteAbajo) {
    		position = lastPosition
    	}
    }
    
   	
   	method recibirAtaque(unAtaque) {}
}

// Torreta: 
object nexus inherits ObjetoVisual(image = "player.png", position = game.center()) {
	var nroBala = 0
	
	method disparar() {
        nroBala = nroBala + 1
        const bala = new Proyectil(nro = nroBala)
        
        game.addVisual(bala)
        bala.empezarAMoverse() 
    }
   

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
