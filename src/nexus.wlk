import wollok.game.*
import proyectil.*

object nexus {
	var nroBala = 0
	var property position = game.center()
	
	method image() = "ship.png"
	
	method crear() {
		game.addVisual(self)
	}
	
	method disparar() {
        nroBala = nroBala + 1
        const bala = new Proyectil(nro = nroBala)
        game.addVisual(bala)
        bala.empezarAMoverse() 
    }
}
