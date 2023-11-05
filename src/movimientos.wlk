import escenario.*
import random.*

object movimiento {
	
	method moverseA(unaDireccion, unElemento) {
		const unaPosicion = unaDireccion.siguiente(unElemento.position())
		unElemento.verHaciaUnaDireccion(unElemento.identificador(), unaDireccion.nombre())
		
		if(self.puedeMoverse(unaPosicion)) 
			unElemento.position(unaPosicion)
	}
		
	method moverseAUnaPosicion(unaPosicion, unElemento) {
		const direccionAMoverse = random.devolverUnaDireccionRandom()
		const posicionNueva = direccionAMoverse.siguiente(unElemento.position())
		
		if(posicionNueva.distance(unaPosicion) <= unElemento.position().distance(unaPosicion)) 
			self.moverseA(direccionAMoverse, unElemento)
	}
	
	method puedeMoverse(unaPosicion) {
		 return escenario.noHayElementosOHayElementosPisables(unaPosicion)
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