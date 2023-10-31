import elementos.*
import oleadas.*
import wollok.game.*

class Enemigo inherits ObjetoVisual{
	var vida
	var velocidad
	

	method irAlNexus() {
		lastPosition = position
		game.onTick(1000 * velocidad, "Moverse al Nexus", {self.moverseA(nexus.position())})
	}
	
	method colisionarCon() {
        game.removeTickEvent("Moverse al Nexus " + identificadorDeTick)
        game.removeVisual(self)
        oleada.liberarEnemigo()
    }
}
