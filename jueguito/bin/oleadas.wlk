import enemigos.*
import escenario.*
import wollok.game.*
import juego.*
object oleada {

	var cantidadDeEnemigos = 0

	method crearEnemigos() {
		if (self.sePuedeCrearEnemigo()) {
			const estadisticasDelEnemigoActual = self.estadisticasDelEnemigo()
			
			
			if (escenario.noHayElementos(estadisticasDelEnemigoActual.position())) {
				const enemigoSeleccionado = new Enemigo(identificadorDeTick = cantidadDeEnemigos, posicionAMoverse = estadisticasDelEnemigoActual.get(0), position = estadisticasDelEnemigoActual.position())
				cantidadDeEnemigos += 1
				self.configurarEnemigo(enemigoSeleccionado)
			}
		}
	}

	method sePuedeCrearEnemigo() {
		return cantidadDeEnemigos < constantesGlobales.cantEnemigosPorOleada()
	}

	// nombrar a las constantes
	method estadisticasDelEnemigo() {
		
		return new Estadisticas(velocidad = 100, position = game.at(0.randomUpTo(9),0.randomUpTo(10)))
	}

	method configurarEnemigo(unEnemigo) {
		unEnemigo.crearObjeto()
		unEnemigo.irAlNexus()
		game.whenCollideDo(unEnemigo, { unElemento => unElemento.colisionarCon()})
	}

	method liberarEnemigo() {
		cantidadDeEnemigos -= 1
	}

}

class Estadisticas {
	const velocidad
	const property position
}
