import elementos.*
import datos.*
import oleadas.*
import movimientos.*
import wollok.game.*

class Enemigo inherits ObjetoVisual(image = "slimeAbajo.png", identificador = "slime", sePuedePisar = true, esAliado = false) {
	const identificadorDeTick
	const nexusAIr
		
	method colisionarCon(unElemento) {
		if(unElemento.esAliado()) {
			game.removeTickEvent("Moverse al Nexus " + identificadorDeTick)
			game.removeVisual(self)
			oleada.liberarEnemigo(self)
		}
	}
	
	method irAlNexus() {
		game.onTick(datosDelJuego.segundosQueSeMueveUnEnemigo(), "Moverse al Nexus " + identificadorDeTick, {movimiento.moverseAUnaPosicion(nexusAIr, self)})
	}
}
