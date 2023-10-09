import wollok.game.*
import example.*

object config {
	
	method configurarPantalla() {
		game.width(10)
  		game.height(7)
  		game.title("Juego")
	}
	
	method crearPersonaje() {
		guerrero.crear()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo{guerrero.atacar()}
	}
}
