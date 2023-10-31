import elementos.*
import oleadas.*
import movimientos.*
import wollok.game.*

class Enemigo inherits ObjetoVisual(image = "slimeAbajo.png") {
    const identificadorDeTick
    const posicionAMoverse
    const property identificador = "slime"

    method irAlNexus() {
        game.onTick(250, "Moverse al Nexus " + identificadorDeTick, {movimiento.moverseAUnaPosicion(posicionAMoverse, self)})
    }

    method colisionarCon() {
        game.removeTickEvent("Moverse al Nexus " + identificadorDeTick)
        game.removeVisual(self)
        oleada.liberarEnemigo()
    }
}
