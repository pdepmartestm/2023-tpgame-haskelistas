import wollok.game.*
import elementos.*
import juego.*

object escenario {
	const posicionesReservadas = [nexus1.position(), nexus2.position(), nexus3.position(), nexus4.position()]
	// separar coleccion de nexus
	const elementoExtrasAColocar = [nexus1, nexus2, nexus3, nexus4, jugador]
	const barraDeVidasAColocar = [barraDeVida1, barraDeVida2, barraDeVida3, barraDeVida4]
	
	method colocarElementos() {
		self.dibujarElementos(barraDeVidasAColocar + elementoExtrasAColocar)
	}
	
	method dibujarElementos(unaListaDeElementos) {
		unaListaDeElementos.forEach({unElemento => unElemento.crearObjeto()})
	}
	
	method crearMarcoSolido() {
		// constantes
		self.dibujarMarcoHorizontal(constantesGlobales.anchuraJuego(),0)
		self.dibujarMarcoHorizontal(constantesGlobales.anchuraJuego(),constantesGlobales.alturaJuego())
		self.dibujarMarcoVertical(constantesGlobales.alturaJuego(),-1)
		self.dibujarMarcoVertical(constantesGlobales.anchuraJuego(),constantesGlobales.anchuraJuego())
	}	
	
	// ver si tiene sentido hacer una clase Pared -- no es lo más importante
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
	
	method devolverPosicionRandom() {
		const index = 0.randomUpTo(3)
		return posicionesReservadas.get(index)
	}
	
	method noEstaEnUnaPosicionReservada(unaPosicion) {
		return !posicionesReservadas.contains(unaPosicion)
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
	
	method gameOver() {
		barraDeVidasAColocar.all({unaBarraVida => !unaBarraVida.estadoDeVida()})
	}

}

