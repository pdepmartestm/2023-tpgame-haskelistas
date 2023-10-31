import escenario.*

object movimiento {
	const direcciones = [arriba, abajo, izquierda, derecha] 
	
	method moverseA(unaDireccion, unElemento, unCriterio) {
		const unaPosicion = unaDireccion.siguiente(unElemento.position())
		unElemento.mirarHaciaUnaDireccion(unElemento.identificador(), unaDireccion.nombre())
		
		if(unCriterio.apply(unaPosicion)) 
			unElemento.position(unaPosicion)
	}
	
	method puedeMoverseJugador() {
		 return {unaPosicion => escenario.noEstaEnUnaPosicionReservada(unaPosicion)  
		 	&& escenario.noHayElementosOHayElementosPisables(unaPosicion)
		 }
	}
	
	method puedeMoverseEnemigo() {
		return {unaPosicion => escenario.noHayElementosOHayElementosPisables(unaPosicion)}
	}
	
	method moverseAUnaPosicion(unaPosicion, unElemento) {
		const direccionAMoverse = self.direccionRandom()
		const posicionNueva = direccionAMoverse.siguiente(unElemento.position())
		
		if(posicionNueva.distance(unaPosicion) <= unElemento.position().distance(unaPosicion))
			self.moverseA(direccionAMoverse, unElemento, self.puedeMoverseEnemigo())
	}
	
	method direccionRandom() {
		const index = 0.randomUpTo(3)
		return direcciones.get(index)
	}
}

object arriba {
	method nombre() = "Arriba"
	method siguiente(position) = position.up(1)	
	method opuesto() = abajo 
}

object abajo {
	method nombre() = "Abajo"
	method siguiente(position) = position.down(1)
	method opuesto() = arriba 
}

object izquierda {
	method nombre() = "Izquierda"
	method siguiente(position) = position.left(1)
	method opuesto() = derecha 
}

object derecha {
	method nombre() = "Derecha"
	method siguiente (position) = position.right(1)
	method opuesto() = izquierda
}


