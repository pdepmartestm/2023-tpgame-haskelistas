import enemigos.*
import escenario.*
import wollok.game.*

object oleada {

	var cantidadDeEnemigos = 0

	method crearEnemigos() {
		if (self.sePuedeCrearEnemigo()) {
			const estadisticasDelEnemigoActual = self.estadisticasDelEnemigo()
			const posEnX = estadisticasDelEnemigoActual.get(1)
			const posEnY = estadisticasDelEnemigoActual.get(2)
			const positionNueva = game.at(posEnX, posEnY)
			
			// const positionNueva = self.estadisticasDelEnemigo().dameLaPosicion()
			
			
			if (escenario.noHayElementos(positionNueva)) {
				const enemigoSeleccionado = new Enemigo(identificadorDeTick = cantidadDeEnemigos, posicionAMoverse = estadisticasDelEnemigoActual.get(0), position = positionNueva)
				cantidadDeEnemigos += 1
				self.configurarEnemigo(enemigoSeleccionado)
			}
		}
	}

	method sePuedeCrearEnemigo() {
		return cantidadDeEnemigos < 15
	}

	// nombrar a las constantes
	method estadisticasDelEnemigo() {
		return new Class 
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

