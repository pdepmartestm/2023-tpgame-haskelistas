import wollok.game.*
import jugador.*
import elementos.*

object escenario {
	const posicionesReservadas = [game.at(10,1), game.at(0,1), game.at(0,9), game.at(10,9)]
	const elementoExtrasAColocar = [nexus1, nexus2, nexus3, nexus4, jugador]
	const barraDeVidasAColocar = [barraDeVida1, barraDeVida2, barraDeVida3, barraDeVida4]
	
	method colocarElementos() {
		self.dibujarElementos(barraDeVidasAColocar + elementoExtrasAColocar)
	}
	
	method dibujarElementos(unaListaDeElementos) {
		unaListaDeElementos.forEach({unElemento => unElemento.crearObjeto()})
	}
	
	method crearMarcoSolido() {
		self.dibujarMarcoHorizontal(11,0)
		self.dibujarMarcoHorizontal(11,10)
		self.dibujarMarcoVertical(10,-1)
		self.dibujarMarcoVertical(11,11)
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

