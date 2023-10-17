import elementos.*
import oleadas.*
import wollok.game.*

class Enemigo inherits ObjetoVisual{
	var vida
	var velocidad

	method irAlNexus() {
		game.onTick(1000 * velocidad, "Moverse al Nexus", {self.moverseA(nexus.position())})
	}
	
	method colisionarConAlgunElemento() {
		game.whenCollideDo(self, {unElemento => unElemento.recibirAtaque(0)})
	}
	
	method perderVida(unDanio) {
		vida -= unDanio
	}
	
	method recibirAtaque(unAtaque) {
		self.perderVida(unAtaque)
		if(vida < 0) {
			game.removeVisual(self)
			oleada.liberarEnemigo()
		}
	}
	
	method recibirDanio() {}
}
