import oleadas.*
import personaje.*
import nexus.*
import wollok.game.*

object juego {
	
	method iniciar() {
		self.iniciarConfiguracionesBasicas()
		game.start()
	}
	
	method iniciarConfiguracionesBasicas() {
		game.height(10)
		game.width(10)
		game.cellSize(70)
		game.title("Defend The Nexus")
		game.addVisual(haskelistas)
		game.schedule(4000, {self.pantallaDeInstrucciones()})
		game.schedule(10000, {self.pantallaDeInicio()})
	}
	
	method pantallaDeInstrucciones() {
		game.removeVisual(haskelistas)
		game.addVisual(pantallaDeInstrucciones)
	}
	
	method pantallaDeInicio() {
		game.removeVisual(pantallaDeInstrucciones)
		game.addVisual(pantallaDeInicio)
		keyboard.enter().onPressDo{self.iniciarJuego()}	
	}
	
	method iniciarJuego() {
		game.clear()
		self.configurarTeclas()
		self.crearElementos()
		self.crearEventos()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo{personaje.arriba()}
		keyboard.down().onPressDo{personaje.abajo()}
		keyboard.left().onPressDo{personaje.izquierda()}
		keyboard.right().onPressDo{personaje.derecha()}
	}
	
	method crearElementos() {
		personaje.crear()
		nexus.crear()
	}
	
	method crearEventos() {
		game.onTick(5000, "Crear un enemigo", {oleada.crearEnemigos()})
		game.onTick(1000, "Dispara el nexus", {nexus.disparar()})
	}
}

class Pantalla {
	const property position = game.at(0,0)
	var property image 
}

const pantallaDeInicio = new Pantalla(image = "pantallaDeInicio.png")
const pantallaDeInstrucciones = new Pantalla(image = "pantallaDeInstrucciones.png")
const haskelistas = new Pantalla(image = "haskelistas.png")
