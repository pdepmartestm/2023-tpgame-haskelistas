import wollok.game.*
import elementos.*
import juego.*

class Pantalla inherits ObjetoVisual(position = game.at(0,0)) {
	const pantallaAnterior 
	const pantallaSiguiente
	const tiempoDeTransicion
	
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

const pantallaDePresentacion = new Pantalla(image = "pantallaDePresentacion.png", 
	pantallaAnterior = null,
	pantallaSiguiente = pantallaDeInstrucciones,
	tiempoDeTransicion = 4000
)

const pantallaDeInstrucciones = new Pantalla(image = "pantallaDeInstrucciones.png", 
	pantallaAnterior = pantallaDePresentacion,
	pantallaSiguiente = pantallaDeInicio,
	tiempoDeTransicion = 6000
)

const pantallaDeInicio = new Pantalla(image = "pantallaDeInicio.png", 
	pantallaAnterior = pantallaDeInstrucciones,
	pantallaSiguiente = null,
	tiempoDeTransicion = null
)