import wollok.game.*
import jugador.*
import nexus.*
import elementos.*
import datos.*

object escenario {
	const nexosDelJuego = [nexus1, nexus2, nexus3, nexus4]
	const barrasDeVidas = [barraDeVida1, barraDeVida2, barraDeVida3, barraDeVida4]
	// var cantidadDePiedas = 0

	method colocarElementos() {
		self.dibujarElementos([jugador] + nexosDelJuego + barrasDeVidas)
	}
	
	method dibujarElementos(unaListaDeElementos) {
		unaListaDeElementos.forEach({unElemento => unElemento.crearObjeto()})
	}
	
	method crearColisiones() {
		const elementosImportantes = nexosDelJuego + [jugador]
		elementosImportantes.forEach({unElemento => game.onCollideDo(unElemento, {otroElemento => otroElemento.colisionarCon(unElemento)})})
	}
	
	method crearMarcoSolido() {
		self.dibujarMarcoHorizontal(datosDelJuego.cantDeColumnas(),0)
		self.dibujarMarcoHorizontal(datosDelJuego.cantDeColumnas(),datosDelJuego.cantDeFilas())
		self.dibujarMarcoVertical(datosDelJuego.cantDeFilas(),-1)
		self.dibujarMarcoVertical(datosDelJuego.cantDeColumnas(),datosDelJuego.cantDeColumnas())
	}	
	
	method dibujarMarcoHorizontal(unaPosicion, otraPosicion) {
		unaPosicion.times({unaNuevaPosicion => 
			const marcoSolido = new ObjetoNoVisual(position = game.at(unaNuevaPosicion - 1, otraPosicion))
			marcoSolido.crearObjeto()
		})
	}
	
	method dibujarMarcoVertical(unaPosicion, otraPosicion) {
		unaPosicion.times({unaNuevaPosicion => 
			const marcoSolido = new ObjetoNoVisual(position = game.at(otraPosicion, unaNuevaPosicion))
			marcoSolido.crearObjeto()
		})
	}
	
	method gameOver() {
		return nexosDelJuego.all({unElemento => !unElemento.sigueConVida()})
	}
	
	method sePuedePisarLosElementos(unaPosicion) {
		return game.getObjectsIn(unaPosicion).all({
			unElemento => unElemento.sePuedePisar()
		})
	}
	
	method noHayElementos(unaPosicion) {
		return game.getObjectsIn(unaPosicion).isEmpty()
	}
	
	method noHayElementosOHayElementosPisables(unaPosicion) {
		return self.sePuedePisarLosElementos(unaPosicion) || self.noHayElementos(unaPosicion)
	}
}