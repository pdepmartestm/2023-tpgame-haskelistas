import wollok.game.*
import movimientos.*

class Objeto {
	
	method crearObjeto() {
		game.addVisual(self)
	}
	
	method sePuedePisar() = null
}

class ObjetoVisual inherits Objeto {
	var property position 
	var property image
	
	override method sePuedePisar() = true
	
	method mirarHaciaUnaDireccion(unIdentificador, unaDireccion) {
		image = unIdentificador + unaDireccion + ".png"
	}	
}

class ObjetoNoVisual inherits Objeto {
	var property position
	
	override method sePuedePisar() = false
}

class Roca inherits ObjetoVisual{ 
	override method image() = "rock.png"
}

class Nexus inherits ObjetoVisual {
	var barraDeVida
	
   	method colisionarCon() {
   		barraDeVida.actualizarCorazones()
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
		}	
	}
}

// Barras de vidas:
const barraDeVida1 = new BarraDeVida(image = "corazones1.png", position = game.at(0,0))
const barraDeVida2 = new BarraDeVida(image = "corazones1.png", position = game.at(3,0))
const barraDeVida3 = new BarraDeVida(image = "corazones1.png", position = game.at(6,0))
const barraDeVida4 = new BarraDeVida(image = "corazones1.png", position = game.at(9,0))

// Nexus:
const nexus1 = new Nexus(image = "nexus1.png", position = game.at(0,1), barraDeVida = barraDeVida1)
const nexus2 = new Nexus(image = "nexus2.png", position = game.at(10,1), barraDeVida = barraDeVida2)
const nexus3 = new Nexus(image = "nexus3.png", position = game.at(10,9), barraDeVida = barraDeVida3)
const nexus4 = new Nexus(image = "nexus4.png", position = game.at(0,9), barraDeVida = barraDeVida4)

// Pantallas:
const pantallaDeInicio = new ObjetoVisual(image = "pantallaDeInicio.png", position = game.at(0,0))
const pantallaDeInstrucciones = new ObjetoVisual(image = "pantallaDeInstrucciones.png", position = game.at(0,0))
const pantallaDePresentacion = new ObjetoVisual(image = "pantallaDePresentacion.png", position = game.at(0,0))
