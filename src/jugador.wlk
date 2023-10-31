import wollok.game.*
import elementos.*

object jugador inherits Objeto {
	const property identificador = "player"
	var property position = game.at(2,3)
	var property image = "playerArriba.png"
	
	method mirarHaciaUnaDireccion(unIdentificador, unaDireccion) {
		image = "player" + unaDireccion + ".png"
	}
	
	method colisionarCon() {}
	
	override method sePuedePisar() = true
}
