import enemigos.*
import wollok.game.*

object oleada {
	var cantidadDeEnemigos = 0
	
	method crearEnemigos() {
		if(cantidadDeEnemigos < 1) {
			const estadisticasDelEnemigoActual = self.estadisticasDelEnemigo()
			const posEnX = estadisticasDelEnemigoActual.get(2)
			const posEnY = estadisticasDelEnemigoActual.get(3)
			
			const enemigoSeleccionado = new Enemigo(
				vida = estadisticasDelEnemigoActual.get(0),
				velocidad = estadisticasDelEnemigoActual.get(1),
				position = game.at(posEnX, posEnY),
				image = "slime.png"
			)
			
			cantidadDeEnemigos += 1 
			self.configurarEnemigo(enemigoSeleccionado)
		}
	}
	
	method estadisticasDelEnemigo() {
		const vida = new Range(start = 1, end = 10).anyOne()
		const velocidad = new Range(start = 1, end = 10).anyOne()
		const posEnX = new Range(start = 0, end = 9).anyOne()
		const posEnY = new Range(start = 0, end = 9).anyOne()
		
		return [vida, velocidad, posEnX, posEnY]
	}
	
	method configurarEnemigo(unEnemigo) {
		unEnemigo.crearObjeto()
		// unEnemigo.iniciarAnimacionDeRebote()
		//unEnemigo.irAlNexus()
		//unEnemigo.colisionarConAlgunElemento()
	}
	
	method liberarEnemigo() {
		cantidadDeEnemigos -= 1
	}
}
