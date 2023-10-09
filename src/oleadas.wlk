import enemigos.*
import wollok.game.*

object oleada {
	var cantidadDeEnemigos = 0
	
	method crearEnemigos() {
		if(cantidadDeEnemigos <= 10) {
			const estadisticasDelEnemigoActual = self.estadisticasDelEnemigo()
			
			const enemigoSeleccionado = new Enemigo(
				vida = estadisticasDelEnemigoActual.get(0),
				velocidad = estadisticasDelEnemigoActual.get(1),
				position = game.at(4, 3),
				image = "slime.png"
			)
			
			cantidadDeEnemigos += 1 
			self.configurarEnemigo(enemigoSeleccionado)
		}
	}
	
	method estadisticasDelEnemigo() {
		const vida = new Range(start = 1, end = 100).anyOne()
		const velocidad = new Range(start = 1, end = 10).anyOne()
		// const posEnX = new Range(start = 0, end = 9).anyOne()
		// const posEnY = new Range(start = 0, end = 9).anyOne()
		const nroDeImagen = new Range(start = 1, end = 9).anyOne()
		
		return [vida, velocidad, nroDeImagen]
	}
	
	method configurarEnemigo(unEnemigo) {
		unEnemigo.crearEnemigo()
		unEnemigo.irAlNexus()
		unEnemigo.colisionarConAlgunElemento()
	}
	
	method liberarEnemigo() {
		cantidadDeEnemigos -= 1
	}
}
