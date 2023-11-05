import wollok.game.*
import movimientos.*
import datos.*

object random {
	const posicionesReservadas = [datosDelJuego.posicionDelNexus1(),
		datosDelJuego.posicionDelNexus2(),
		datosDelJuego.posicionDelNexus3(),
		datosDelJuego.posicionDelNexus4()
	]
	
	const direcciones = [arriba, abajo, derecha, izquierda]
	
	method devolverUnaCordenadaRandom() {
		return game.at(self.devolverUnNumeroRandom(1, datosDelJuego.cantDeFilas()) - 1, self.devolverUnNumeroRandom(1, datosDelJuego.cantDeFilas()) - 1)
	}
	
	method devolverUnaPosicionDeNexusRandom() {
		const index = self.devolverUnNumeroRandom(datosDelJuego.inicioDeIndex(), datosDelJuego.finDeIndexDePosicionesReservadas())
		return posicionesReservadas.get(index)
	}
	
	method devolverUnNumeroRandom(unInicio, unLimite) {
		return unInicio.randomUpTo(unLimite)
	}
	
	method removerUnaPosicionReservada(unaPosicion) {
		posicionesReservadas.remove(unaPosicion)
		datosDelJuego.actualizarFinDeIndex()
	}
	
	method devolverUnaDireccionRandom() {
		const index = self.devolverUnNumeroRandom(datosDelJuego.inicioDeIndex(), datosDelJuego.finDeIndexDeDirecciones())
		return direcciones.get(index)
	}	
}
