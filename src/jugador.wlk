import wollok.game.*
import elementos.*

object jugador inherits Objeto(esAliado = true, sePuedePisar = true, identificador = "player") {
	var property position = game.at(2,3)
	var property image = "playerArriba.png"
	
	method verHaciaUnaDireccion(unIdentificador, unaDireccion) {
		image = "player" + unaDireccion + ".png"
	}
	
	method colisionarCon(unElemento) {}
}
