import wollok.game.*

object personaje {
	var property position = game.at(2,3)
	
    method image() = "player.png"

	method crear() {
		game.addVisual(self)
	}

    method derecha() {
        position = position.right(1)
    }
    
    method izquierda() {
        position = position.left(1)
    }
    
    method arriba() {
        position = position.up(1)
    }
    
    method abajo() {
    	position = position.down(1)
    }
    
}
