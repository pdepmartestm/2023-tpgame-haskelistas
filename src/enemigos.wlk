import nexus.*
import oleadas.*
import wollok.game.*

class Enemigo {
	var vida
	var velocidad
	var property position 
	var property image 
	
	method crearEnemigo() {
		game.addVisual(self)
	}
	method irAlNexus() {
		game.onTick(1000 * velocidad, "Moverse al Nexus", {self.moverseA(nexus.position())})
	}
	
	method colisionarConAlgunElemento() {
		game.whenCollideDo(self, {unElemento => unElemento.recibirDanio()})
	}

	method moverseA(unDireccion){
		position = game.at(
			position.x() + (unDireccion.x()-position.x())/2,
			position.y() + (unDireccion.y()- position.y())/2
		)
	}
	
	method perderVida(unDanio) {
		vida -= unDanio
	}
	
	method impactarEnemigo(unDanio) {
		self.perderVida(unDanio)
		if(vida < 0) {
			game.removeVisual(self)
			oleada.liberarEnemigo()
		}
	}
	
	method recibirDanio() {}
}
