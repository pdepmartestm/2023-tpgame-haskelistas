import wollok.game.*
import movimientos.*
import juego.*

class Objeto {
	
	method crearObjeto() {
		game.addVisual(self)
	}
	
	method sePuedePisar() = null
}

class ObjetoVisual inherits Objeto {
	const property identificador = ""
	var property position 
	var property image
	
	override method sePuedePisar() = true
	
	method colisionarCon() {}
	
	method mirarHaciaUnaDireccion(unaDireccion) {
		image = identificador + unaDireccion + ".png"
	}	
}

class ObjetoNoVisual inherits Objeto {
	var property position
	
	override method sePuedePisar() = false
}
// que cada objeto nexo tenga la vida y cuando lo dañan le avisa a la barra de vida que cambie imagen
class Nexus inherits ObjetoVisual {
	const barraDeVida
	var siguienteEstado = 2
	var property estadoDeVida = true
	
   	override method colisionarCon() {
   		barraDeVida.actualizarCorazones()
   	}
   	
   	method actualizarCorazones() {
		if(siguienteEstado <= 6) 
		{
			barraDeVida.image("corazones" + siguienteEstado + ".png")
			siguienteEstado++
		}
		else
		{
			barraDeVida.image("corazones7.png")
			estadoDeVida = false
			image = "tumba.png"
			// aca hay que conectar barra con nexo para poder llamar a metodo cambiarVisual()
		}

	}
}

// Jugador:
const jugador = new ObjetoVisual(image = "playerAbajo.png", position = game.at(2,3), identificador = "player")

// Barras de vidas:
const barraDeVida1 = new ObjetoVisual(image = "corazones1.png", position = game.at(0,0))
const barraDeVida2 = new ObjetoVisual(image = "corazones1.png", position = game.at(3,0))
const barraDeVida3 = new ObjetoVisual(image = "corazones1.png", position = game.at(6,0))
const barraDeVida4 = new ObjetoVisual(image = "corazones1.png", position = game.at(9,0))

// Nexus:
const nexus1 = new Nexus(image = "nexus.png", position = game.at(0,1), barraDeVida = barraDeVida1)
const nexus2 = new Nexus(image = "nexus.png", position = game.at(constantesGlobales.anchuraJuego() - 1,1), barraDeVida = barraDeVida2)
const nexus3 = new Nexus(image = "nexus.png", position = game.at(constantesGlobales.anchuraJuego() - 1,constantesGlobales.alturaJuego() - 1), barraDeVida = barraDeVida3)
const nexus4 = new Nexus(image = "nexus.png", position = game.at(0,constantesGlobales.alturaJuego() - 1), barraDeVida = barraDeVida4)


