import wollok.game.*
import datos.*

class Objeto {
	var property sePuedePisar = null
	var property esAliado = null
	var property identificador = ""
	
	method crearObjeto() {
		game.addVisual(self)
	}	
}

class ObjetoVisual inherits Objeto {
	var property position
	var property image
	
	method verHaciaUnaDireccion(unIdentificador, unaDireccion) {
		image = unIdentificador + unaDireccion + ".png"
	}
}

// Roca: Falta colision! 
class Roca inherits ObjetoVisual { 
	override method image() = "rock.png"
}

class ObjetoNoVisual inherits Objeto(sePuedePisar = false) {
	var property position
}

class BarraDeVida inherits ObjetoVisual(sePuedePisar = false) {
	method actualizarCorazones(unEstadoDeVida) {
		image = "corazones" + unEstadoDeVida + ".png"
	}
}

const barraDeVida1 = new BarraDeVida(image = "corazones1.png", position = datosDelJuego.posicionDeBarraVida1())
const barraDeVida2 = new BarraDeVida(image = "corazones1.png", position = datosDelJuego.posicionDeBarraVida2())
const barraDeVida3 = new BarraDeVida(image = "corazones1.png", position = datosDelJuego.posicionDeBarraVida3())
const barraDeVida4 = new BarraDeVida(image = "corazones1.png", position = datosDelJuego.posicionDeBarraVida4())