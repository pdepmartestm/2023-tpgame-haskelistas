import elementos.*
import datos.*
import random.*
import wollok.game.*

class Nexus inherits ObjetoVisual(sePuedePisar = true, esAliado = true) {
	var barraDeVida
	var estadoActual = 1

	method colisionarCon(unElemento) {
		if(self.sigueConVida())
		{
			if(unElemento.esAliado())
				game.schedule(datosDelJuego.segundosEnCurar(), {self.curarUnCorazon()})
			else
				self.restarVida()
				
		}
		else
			self.destruirNexus()		
	}
	
	method curarUnCorazon() {
		if(self.estaEnUnEstadoCurable()) {
			estadoActual--
			barraDeVida.actualizarCorazones(estadoActual)
		}
		else
			game.say(self, "No se puede curar más al nexo!")
	}
	
	method estaEnUnEstadoCurable() {
		return estadoActual >= 2 && estadoActual <= 6
	}
	
	method restarVida() {
		estadoActual++
		barraDeVida.actualizarCorazones(estadoActual)
	}
	
	method destruirNexus() {
		image = "tumba.png"
		barraDeVida.actualizarCorazones(datosDelJuego.estadoFinal())
		self.sePuedePisar(false)
		random.removerUnaPosicionReservada(self.position())
	}

	method sigueConVida() {
		return estadoActual < 6
	}
}

const nexus1 = new Nexus(image = "rana1.png", position = datosDelJuego.posicionDelNexus1(), barraDeVida = barraDeVida1)
const nexus2 = new Nexus(image = "rana2.png", position = datosDelJuego.posicionDelNexus2(), barraDeVida = barraDeVida2)
const nexus3 = new Nexus(image = "rana3.png", position = datosDelJuego.posicionDelNexus3(), barraDeVida = barraDeVida3)
const nexus4 = new Nexus(image = "rana4.png", position = datosDelJuego.posicionDelNexus4(), barraDeVida = barraDeVida4)