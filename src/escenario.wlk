import wollok.game.*
import elementos.*

object escenario {
	var posicionesReservadas = [game.at(2,3), game.center()]
	var cantidadDePiedras = 0

	method crearFondo() {
		11.times({unaPosicionEnX => 
			11.times({unaPosicionEnY => 
				const pastoActual = new ObjetoVisual(
					image = "grass.png",
					position = game.at(unaPosicionEnX - 1, unaPosicionEnY - 1)
				)
				pastoActual.crearObjeto()
			})
		})
		
		self.crearPiedras()
	}
	
	// Se puede generar de manera aletoria!
	method crearPiedras() {
		if(cantidadDePiedras < 5) {
			self.colocarPiedraAletoriamente()
			self.crearPiedras()
		}
	}
	
	method colocarPiedraAletoriamente() {
		const positionAletoria = game.at(
			new Range(start = 1, end = 11).anyOne() - 1,
			new Range(start = 1, end = 11).anyOne() - 1
		)
		
		if(!self.estaEnUnPosicionReservada(positionAletoria)) {
			const piedaNueva = new ObjetoVisual(
				image = "rock.png",
				position = positionAletoria
			)
			cantidadDePiedras += 1
			piedaNueva.crearObjeto()
			self.agregarPosicionReservada(positionAletoria)
		}
	}
	
	method estaEnUnPosicionReservada(unaPosicion) {
		return posicionesReservadas.contains(unaPosicion)
	}
	
	method agregarPosicionReservada(unaPosicion) {
		posicionesReservadas.add(unaPosicion)
	}
}
