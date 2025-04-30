/** First Wollok example */
import wollok.game.*

object lionel {

	var property bocha = pelota
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method patear() {
		self.validarPosicionPelota()
		bocha.position(game.at((position.x() + 3).min(game.width() - 1), position.y()))
	}

	method validarPosicionPelota() {
	  if (position != bocha.position()){
		self.error("Toy pateando al aire flaco")
	  }
	}
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
