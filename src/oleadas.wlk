import enemigos.*
import random.*
import estadistica.*
import escenario.*
import datos.*
import wollok.game.*

object oleada {
	var enemigosEnPantalla = []
	
	method crearEnemigos() {
		if(enemigosEnPantalla.size() < datosDelJuego.cantidadDeEnemigos()) {
			const estadisticasDelNuevoEnemigo = self.estadisticasDelEnemigo()
			
			if(escenario.noHayElementos(estadisticasDelNuevoEnemigo.position())) {
				const nuevoEnemigo = new Enemigo(
					position = estadisticasDelNuevoEnemigo.position(),
					nexusAIr = estadisticasDelNuevoEnemigo.nexusAIr(),
					identificadorDeTick = enemigosEnPantalla.size()
				)
				
				enemigosEnPantalla.add(nuevoEnemigo)
				self.configurarEnemigo(nuevoEnemigo)
			}
		}
	}
	
	method estadisticasDelEnemigo() {
		return new Estadistica(position = random.devolverUnaCordenadaRandom(), 
			nexusAIr = random.devolverUnaPosicionDeNexusRandom()
		)
	}
	
	method configurarEnemigo(unEnemigo) {
		unEnemigo.crearObjeto()
		unEnemigo.irAlNexus()
		game.whenCollideDo(unEnemigo, {unElemento => unElemento.colisionarCon(unEnemigo)})
	}
	
	method liberarEnemigo(unEnemigo) {
		enemigosEnPantalla.remove(unEnemigo)
	}
}
