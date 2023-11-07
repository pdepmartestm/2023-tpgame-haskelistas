import wollok.game.*
import elementos.*
import juego.*

class Pantalla inherits ObjetoVisual(position = game.at(0,0)) {
	const pantallaAnterior = null
	const pantallaSiguiente = null
	const tiempoDeTransicion = null
	
	method iniciarPantalla() {
		if(pantallaAnterior != null)
			game.removeVisual(pantallaAnterior)

		self.crearObjeto()
		self.configurarPantallaSiguiente()
	}
	
	method configurarPantallaSiguiente() {
		if(pantallaSiguiente != null)
			game.schedule(tiempoDeTransicion, {pantallaSiguiente.iniciarPantalla()})
		else
			keyboard.enter().onPressDo{juego.iniciarJuego()}
	}
}

// Ver como hacer un tecla para reiniciar todo! 
object pantallaDeGameOver inherits Pantalla (image = "pantallaDeGameOver.png") {
	
	override method iniciarPantalla() {
		game.clear()
		self.crearObjeto()
	}
}

const pantallaDePresentacion = new Pantalla(image = "pantallaDePresentacion.png", pantallaSiguiente = pantallaDeInicio, tiempoDeTransicion = 6000)
const pantallaDeInicio = new Pantalla(image = "pantallaDeInicio.png", pantallaAnterior = pantallaDePresentacion)