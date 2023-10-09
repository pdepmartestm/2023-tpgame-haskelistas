import wollok.game.*

object guerrero {
	var property image = "player1.png"
	var property position = game.center()
	
	method crear() {
		game.addVisual(self)
	}
	
	method atacar() {
		animacionDeAtaque.animarAtaque(self)
	}
	
	method cambiarImage(unNumero) {
		image = "player" + unNumero + ".png"
	}
}

object animacionDeAtaque {
	
	method animarAtaque(unPersonaje) {
		5.times{unNumero => unPersonaje.cambiarImage(unNumero)}
	}
}
