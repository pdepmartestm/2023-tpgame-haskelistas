import wollok.game.*

object pepita {

	method position() = game.center()

	method image() = "pepita.png"

}

/*
Clases:
- Torres {
	danioXdisparo
	velDeAtaque
	rangoDeAtaque
	cantMaximaDisparosALaVez
	ubicacion
	estado (on/off)
	costoComprar
	costoUpgradear

	ubicarEnMapa()
	iniciar( estado = on)
	upgradear()
	venderTorre()
	disparar()
}
	// podemos definir al menos 4 torres

- Monstruos {
	vida
	danio
	velocidad
	estado (on/off)
	dineroDado	// la guita que nos da matarlos
	nivel

	caminar()	// tiene que ir probando casillas para adivinar por donde puede moverse
	herido()	// cada vez que una torre le dispara llama a esta funcion, si vida llega a cero se muere
	morir()	
	subirNivel()	// cambia un poco las stats de los bichos para arriba
}

- Jugador {
	vida
	dinero
	oleada
	ronda	//un contador para saber x que ronda va

	comenzarOleada()
	comprarTorre()
	venderTorre()
	UpgradearTorre()
}

- Mapa {
	matriz 	// creo que puede ser una simple lista de listas que tenga 0s y 1s segun se puedan o no pisar las casillas
}

- Oleada {	// creo que vamos a necesitar una clase que a medida que pasemos de ronda se cree un objeto llamado rondaX que sirva para iniciar o saber que finalizo la ronda y para setear cantidad de monstruos y su nivel
	cantBichos
	estadoGeneral (on/off)
	camino		// guardariamos el mapa actual o algo asi
}
*/
