import elementos.*
import oleadas.*
import movimientos.*
import wollok.game.*

class Enemigo inherits ObjetoVisual(image = "slimeAbajo.png", identificador = "slime") {
    const identificadorDeTick
    const posicionAMoverse

    method irAlNexus() {
        game.onTick(250, "Moverse al Nexus " + identificadorDeTick, {movimiento.moverseAUnaPosicion(posicionAMoverse, self)})
    }

    override method colisionarCon() {
        game.removeTickEvent("Moverse al Nexus " + identificadorDeTick)
        game.removeVisual(self)
        oleada.liberarEnemigo()
    }
}
