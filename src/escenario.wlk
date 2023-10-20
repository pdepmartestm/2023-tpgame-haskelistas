import wollok.game.*
import elementos.*

object escenario {
	var posicionesReservadas = [game.at(2,3), game.center()]
	var cantidadDePiedras = 0
	var cantCeldas = 11

	method crearFondo() {
		cantCeldas.times({unaPosicionEnX => 
			cantCeldas.times({unaPosicionEnY => 
				const pastoActual = new ObjetoVisual(
					image = "grass.png",
					position = game.at(unaPosicionEnX - 1, unaPosicionEnY - 1)
				)
				pastoActual.crearObjeto()
			})
		})
		
		self.crearPiedras()
	}
	
	method crearMarco() {
		cantCeldas.times({posicionEnX =>
			const celdaMarco1 = new ObjetoNoVisual(
				position = game.at(posicionEnX - 1, 0)
				
			)
			const celdaMarco2 = new ObjetoNoVisual(
				position = game.at(posicionEnX - 1, 10)
			)
			const celdaMarco3 = new ObjetoNoVisual(
				position = game.at(0, posicionEnX - 1)
			)
			const celdaMarco4 = new ObjetoNoVisual(
				position = game.at(10, posicionEnX - 1)
			)
			celdaMarco1.crearObjeto()
			celdaMarco2.crearObjeto()
			celdaMarco3.crearObjeto()
			celdaMarco4.crearObjeto()
			game.onCollideDo(celdaMarco1, {elemento => elemento.choco()})
			game.onCollideDo(celdaMarco2, {elemento => elemento.choco()})
			game.onCollideDo(celdaMarco3, {elemento => elemento.choco()})
			game.onCollideDo(celdaMarco4, {elemento => elemento.choco()})
		})
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
			const piedraNueva = new ObjetoVisual(
				image = "rock.png",
				position = positionAletoria
			)
			cantidadDePiedras += 1
			piedraNueva.crearObjeto()
			self.agregarPosicionReservada(positionAletoria)
			game.onCollideDo(piedraNueva, {elemento => elemento.choco()})
		}
	}
	
	method estaEnUnPosicionReservada(unaPosicion) {
		return posicionesReservadas.contains(unaPosicion)
	}
	
	method agregarPosicionReservada(unaPosicion) {
		posicionesReservadas.add(unaPosicion)
	}
}
