import oleadas.*
import elementos.*
import escenario.*
import movimientos.*
import wollok.game.*

object juego {
	var velocidadDeCreacion = 1000
	
	method iniciar() {
		self.iniciarConfiguracionesBasicas()
		game.start()
	}
	// sacar valores de aca y guardarlos en objeto como variables o const
	method iniciarConfiguracionesBasicas() {
		game.height(10)
		game.width(11)
		game.cellSize(70)
		game.boardGround("fondo.png")
		game.title("Defend The Nexus")
		game.addVisual(pantallaDePresentacion)
		game.schedule(4000, {self.iniciarPantallaDeInstrucciones()})
		game.schedule(10000, {self.iniciarPantallaDeInicio()})
	}
	// ver si se puede usar clase pantalla
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
		game.onTick(velocidadDeCreacion, "Crear un enemigo", {oleada.crearEnemigos()})
		game.onTick(5000, "Aumentar creacion de enemigos", {self.aumentarVelCreacion()})
	}
	
	method aumentarVelCreacion() {
		// ojo, constante
		if(velocidadDeCreacion > 100) {
			game.removeTickEvent("Crear un enemigo")
			velocidadDeCreacion -= 100
			game.onTick(velocidadDeCreacion, "Crear un enemigo", {oleada.crearEnemigos()})
		}	
	}
}
