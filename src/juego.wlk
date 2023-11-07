import oleadas.*
import elementos.*
import escenario.*
import datos.*
import movimientos.*
import jugador.*
import pantallas.*
import musica.*
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
		game.title("DEFEND THE FROGS")
		pantallaDePresentacion.iniciarPantalla()
		game.schedule(3000, {reproductorDeMusica.iniciarMusica()})
	}
	
	method iniciarJuego() {
		game.clear()
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
		keyboard.q().onPressDo{self.aumentarDificultad()}
		keyboard.m().onPressDo{reproductorDeMusica.mutearMusica()}
	}

	method aumentarDificultad() {
		game.removeTickEvent("Crear un enemigo")
		game.onTick(datosDelJuego.velocidadDeCreacionExtrema(),"Crear un enemigo" , {oleada.crearEnemigos()})
		datosDelJuego.aumentarCantidadDeEnemigos()
	}

	method crearEventos() {
		game.onTick(datosDelJuego.velocidadDeCreacionNormal(), "Crear un enemigo", {oleada.crearEnemigos()})
		game.onTick(datosDelJuego.segundosVerificacionGameOver(), "Verificacion de GAME OVER", {if(escenario.gameOver()) pantallaDeGameOver.iniciarPantalla()})
	}
}