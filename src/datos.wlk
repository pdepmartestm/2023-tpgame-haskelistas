import wollok.game.*

object datosDelJuego {
	
	// Datos de un Enemigo:
	const property cantidadDeEnemigos = 15	
	const property segundosQueSeMueveUnEnemigo = 250
	const property velocidadDeCreacionNormal = 1000
	
	// Datos de los Nexos:
	const property posicionDelNexus1 = game.at(0,1)
	const property posicionDelNexus2 = game.at(0,9)
	const property posicionDelNexus3 = game.at(10,1)
	const property posicionDelNexus4 = game.at(10,9)
	
	// Datos de las barras de vidas:
	const property posicionDeBarraVida1 = game.at(0,0)
	const property posicionDeBarraVida2 = game.at(3,0)
	const property posicionDeBarraVida3 = game.at(6,0)
	const property posicionDeBarraVida4 = game.at(9,0)
	const property estadoFinal = 7
	
	// Datos de colecciones:
	const property inicioDeIndex = 0
	
	// Datos de las direcciones:
	const property finDeIndexDeDirecciones = 3
	
	// Datos de posiciones reservadas:	
	var property finDeIndexDePosicionesReservadas = 3
	
	// Datos numericos del juego:
	const property cantDeFilas = 10
	const property cantDeColumnas = 11
	const property pixelesDeCelda = 70
	
	method actualizarFinDeIndex() {
		finDeIndexDePosicionesReservadas-- 
	}
}
