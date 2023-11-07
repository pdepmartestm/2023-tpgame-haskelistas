import wollok.game.*

object reproductorDeMusica {
	const musica = game.sound("Adventure-Begin.mp3")
	var volumen = 0.2
	
	method iniciarMusica() {
		musica.shouldLoop(true)
		musica.volume(0.2)
		game.schedule(100, {musica.play()})
	}
	
	method mutearMusica() {
		if(volumen > 0) {
			volumen = 0 
			musica.volume(volumen)
		}
		else
		{
			volumen = 0.2
			musica.volume(volumen)
		}
	}
}
