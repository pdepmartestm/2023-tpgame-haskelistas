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
		self.crearPantalla()
		self.crearEventos()
		self.configurarTeclas()
		self.crearElementos()
	}
	
	method crearPantalla() {
		game.height(20)
		game.width(20)
		game.cellSize(70)
		game.title("Defend The Nexus")
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
		game.onTick(1000, "Dispara un Nexus", {nexus.disparar()})
	}
}


// En proceso de creacion -> Pantalla de inicio
object pantallaDeInicio {
	
}