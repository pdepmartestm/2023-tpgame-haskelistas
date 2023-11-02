import oleadas.*
import elementos.*
import escenario.*
import movimientos.*
import wollok.game.*

object juego {
	
	method iniciar() {
		self.iniciarConfiguracionesBasicas()
		game.start()
	}
	// sacar valores de aca y guardarlos en objeto como variables o const
	method iniciarConfiguracionesBasicas() {
		game.height(constantesGlobales.alturaJuego())
		game.width(constantesGlobales.anchuraJuego())
		game.cellSize(constantesGlobales.tamanioCeldas())
		game.boardGround("fondo.png")
		game.title("Defend The Nexus")
		game.addVisual(pantallaDePresentacion)
		game.schedule(4000, {self.iniciarPantallaDeInstrucciones()})
		game.schedule(10000, {self.iniciarPantallaDeInicio()})
	}
	// Manejo de cambio de pantalla
	method iniciarPantallaDeInstrucciones() {
		pantalla.iniciarPantalla(pantallaDePresentacion, pantallaDeInstrucciones)
	}
	
	method iniciarPantallaDeInicio() {
		pantalla.iniciarPantalla(pantallaDeInstrucciones, pantallaDeInicio)
		keyboard.enter().onPressDo{self.iniciarJuego()}	
	}
	
	
	
	
	method iniciarJuego() {
		game.clear()
		escenario.colocarElementos()
		escenario.crearMarcoSolido()
		self.configurarTeclas()
		self.crearColisiones()
		self.crearEventos()
	}
	
	method configurarTeclas() {
		keyboard.w().onPressDo{movimiento.moverseA(arriba, jugador, movimiento.puedeMoverseJugador())}
		keyboard.s().onPressDo{movimiento.moverseA(abajo, jugador, movimiento.puedeMoverseJugador())}
		keyboard.a().onPressDo{movimiento.moverseA(izquierda, jugador, movimiento.puedeMoverseJugador())}
		keyboard.d().onPressDo{movimiento.moverseA(derecha, jugador, movimiento.puedeMoverseJugador())}
	}
	
	method crearColisiones() {
		// pasarlo a una coleccion y hacer un .forEach()
		// poder agregar la roca
		// no depender de que haya 4 nexos nomás
		game.onCollideDo(jugador, {unElemento => unElemento.colisionarCon()})
		game.whenCollideDo(nexus1, {unElemento => unElemento.colisionarCon()})
		game.whenCollideDo(nexus2, {unElemento => unElemento.colisionarCon()})
		game.whenCollideDo(nexus3, {unElemento => unElemento.colisionarCon()})
		game.whenCollideDo(nexus4, {unElemento => unElemento.colisionarCon()})
	}
	
	method crearEventos() {
		game.onTick(constantesGlobales.velocidadDeCreacion(), "Crear un enemigo", {oleada.crearEnemigos()})
		game.onTick(constantesGlobales.velocidadDeAumentoDeNivel(), "Aumentar creacion de enemigos", {self.aumentarVelCreacion()})
	}
	
	method aumentarVelCreacion() {
		constantesGlobales.aumentarVelocidad()
		game.removeTickEvent("Crear un enemigo")
		game.onTick(constantesGlobales.velocidadDeCreacion(), "Crear un enemigo", {oleada.crearEnemigos()})
		
	}
}
// CONSTANTES GLOBALES
object constantesGlobales {
	const property alturaJuego = 10
	const property anchuraJuego = 11
	const property tamanioCeldas = 70
	
	const property velocidadDeAumentoDeNivel = 60000
	const property modificacionDeVelocidad = 100
	var property velocidadDeCreacion = 1000
	
	const property velocidadDeMonstruos = 250
	
	const property cantEnemigosPorOleada = 15

	
	method aumentarVelocidad() {
		if(velocidadDeCreacion > modificacionDeVelocidad) {
		velocidadDeCreacion -= modificacionDeVelocidad
	}
	
}
// CLASE PANTALLA
object pantalla {
	method iniciarPantalla(visualRemovido, visualAniadido) {
		game.removeVisual(visualRemovido)
		game.addVisual(visualAniadido)
	}
}

// Pantallas:
const pantallaDeInicio = new ObjetoVisual(image = "pantallaDeInicio.png", position = game.at(0,0), identificador = "")
const pantallaDeInstrucciones = new ObjetoVisual(image = "pantallaDeInstrucciones.png", position = game.at(0,0), identificador = "")
const pantallaDePresentacion = new ObjetoVisual(image = "pantallaDePresentacion.png", position = game.at(0,0), identificador = "")

