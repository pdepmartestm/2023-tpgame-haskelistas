import enemigos.*
import escenario.*
import wollok.game.*

object oleada {
    var cantidadDeEnemigos = 0

    method crearEnemigos() {
        if(cantidadDeEnemigos < 15) {
            const estadisticasDelEnemigoActual = self.estadisticasDelEnemigo()
            const posEnX = estadisticasDelEnemigoActual.get(1)
            const posEnY = estadisticasDelEnemigoActual.get(2)
            const positionNueva = game.at(posEnX, posEnY)

            if(escenario.noHayElementos(positionNueva)) {
                const enemigoSeleccionado = new Enemigo(
                    identificadorDeTick = cantidadDeEnemigos,
                    posicionAMoverse = estadisticasDelEnemigoActual.get(0),
                    position = positionNueva
                )
                cantidadDeEnemigos += 1
                self.configurarEnemigo(enemigoSeleccionado)
            }
        }
    }

    method estadisticasDelEnemigo() {
        const posEnX = 0.randomUpTo(9)
        const posEnY = 0.randomUpTo(9)
        const posicionAMoverse = escenario.devolverPosicionRandom()

        return [posicionAMoverse, posEnX, posEnY]
    }

    method configurarEnemigo(unEnemigo) {
        unEnemigo.crearObjeto()
        unEnemigo.irAlNexus()
        game.whenCollideDo(unEnemigo, {unElemento => unElemento.colisionarCon()})
    }

    method liberarEnemigo() {
        cantidadDeEnemigos -= 1
    }
}
