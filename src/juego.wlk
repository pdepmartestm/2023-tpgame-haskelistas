import wollok.game.*
import configuraciones.*

object juego {
	
	method iniciar() {
		config.configurarPantalla()
		config.crearPersonaje()
		config.configurarTeclas()
		game.start()
	}
}
