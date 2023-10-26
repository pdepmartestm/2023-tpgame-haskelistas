import oleadas.*
import elementos.*
import escenario.*
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
		game.addVisual(pantallaDePresentacion)
		game.schedule(4000, {self.iniciarPantallaDeInstrucciones()})
		game.schedule(10000, {self.iniciarPantallaDeInicio()})
	}
	
	method iniciarPantallaDeInstrucciones() {
		game.removeVisual(pantallaDePresentacion)
		game.addVisual(pantallaDeInstrucciones)
	}
	
	method iniciarPantallaDeInicio() {
		game.removeVisual(pantallaDeInstrucciones)
		game.addVisual(pantallaDeInicio)
		keyboard.enter().onPressDo{self.iniciarJuego()}	
	}
	
	method iniciarJuego() {
		game.clear()
		escenario.crearFondo()
		self.crearElementos()
		self.configurarTeclas()
		self.crearEventos()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo{jugador.arriba()}
		keyboard.down().onPressDo{jugador.abajo()}
		keyboard.left().onPressDo{jugador.izquierda()}
		keyboard.right().onPressDo{jugador.derecha()}
	}
	
	method crearElementos() {
		jugador.crearObjeto()
		nexus.crearObjeto()
	}
	
	method crearEventos() {
		game.onTick(5000, "Crear un enemigo", {oleada.crearEnemigos()})
		game.onTick(1000, "Dispara el nexus", {nexus.disparar()})
	}
}
