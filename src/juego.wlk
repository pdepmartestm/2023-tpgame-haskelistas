import oleadas.*
import elementos.*
import escenario.*
import datos.*
import movimientos.*
import jugador.*
import pantallas.*
import wollok.game.*

object juego {
		
	method iniciar() {
		self.iniciarConfiguracionesBasicas()
		game.start()
	}
	
	method iniciarConfiguracionesBasicas() {
		game.height(datosDelJuego.cantDeFilas())
		game.width(datosDelJuego.cantDeColumnas())
		game.cellSize(datosDelJuego.pixelesDeCelda())
		game.boardGround("fondo.png")
		game.title("Defend The Nexus")
		pantallaDePresentacion.iniciarPantalla()
	}
	
	method iniciarJuego() {
		game.clear()
		self.musikita()
		escenario.colocarElementos()
		escenario.crearMarcoSolido()
		escenario.crearColisiones()
		self.configurarTeclas()
		self.crearEventos()
	}
	
	method configurarTeclas() {
		keyboard.w().onPressDo{movimiento.moverseA(arriba, jugador)}
		keyboard.s().onPressDo{movimiento.moverseA(abajo, jugador)}
		keyboard.a().onPressDo{movimiento.moverseA(izquierda, jugador)}
		keyboard.d().onPressDo{movimiento.moverseA(derecha, jugador)}
	}

	method crearEventos() {
		game.onTick(datosDelJuego.velocidadDeCreacionNormal(), "Crear un enemigo", {oleada.crearEnemigos()})
	}

	method musikita() {
	const musica = game.sound("Adventure-Begin.mp3")
	musica.shouldLoop(true)
	game.schedule(500, {musica.play()})
	keyboard.p().onPressDo({musica.pause()})
	keyboard.r().onPressDo({musica.resume()})
	}
}
