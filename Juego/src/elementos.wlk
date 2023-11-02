import wollok.game.*
import movimientos.*

class Objeto {
	
	method crearObjeto() {
		game.addVisual(self)
	}
	
	method sePuedePisar() = null
}

class ObjetoVisual inherits Objeto {
	const property identificador
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
	var barraDeVida
	
   	override method colisionarCon() {
   		barraDeVida.actualizarCorazones()
   	}
   	
   	override method cambiarVisual() {
   		image= "tumba.png"
   	}
}

class BarraDeVida inherits ObjetoVisual {
	var siguienteEstado = 2
	var property estadoDeVida = true
	
	method actualizarCorazones() {
		if(siguienteEstado <= 6) 
		{
			image = "corazones" + siguienteEstado + ".png"
			siguienteEstado++
		}
		else
		{
			image = "corazones7.png"
			estadoDeVida = false
			// aca hay que conectar barra con nexo para poder llamar a metodo cambiarVisual()
		}	
	}
}

// Jugador:
const jugador = new ObjetoVisual(image = "playerAbajo.png", position = game.at(2,3), identificador = "player")

// Barras de vidas:
const barraDeVida1 = new BarraDeVida(image = "corazones1.png", position = game.at(0,0), identificador = "")
const barraDeVida2 = new BarraDeVida(image = "corazones1.png", position = game.at(3,0), identificador = "")
const barraDeVida3 = new BarraDeVida(image = "corazones1.png", position = game.at(6,0), identificador = "")
const barraDeVida4 = new BarraDeVida(image = "corazones1.png", position = game.at(9,0), identificador = "")

// Nexus:
const nexus1 = new Nexus(image = "nexus1.png", position = game.at(0,1), barraDeVida = barraDeVida1, identificador = "")
const nexus2 = new Nexus(image = "nexus1.png", position = game.at(10,1), barraDeVida = barraDeVida2, identificador = "")
const nexus3 = new Nexus(image = "nexus1.png", position = game.at(10,9), barraDeVida = barraDeVida3, identificador = "")
const nexus4 = new Nexus(image = "nexus1.png", position = game.at(0,9), barraDeVida = barraDeVida4, identificador = "")

// Pantallas:
const pantallaDeInicio = new ObjetoVisual(image = "pantallaDeInicio.png", position = game.at(0,0), identificador = "")
const pantallaDeInstrucciones = new ObjetoVisual(image = "pantallaDeInstrucciones.png", position = game.at(0,0), identificador = "")
const pantallaDePresentacion = new ObjetoVisual(image = "pantallaDePresentacion.png", position = game.at(0,0), identificador = "")
