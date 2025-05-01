/** First Wollok example */
import wollok.game.*

object lionel {
	var property position = game.at(3,5)
	var property bocha = pelota

	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
	method buscarla() {
		position = bocha.position()
	}

	method taquito(){
		self.validarPosicionBocha()
		bocha.position(game.at(0.max(position.x() - 2), position.y()))
	}

	method validarPosicionBocha() {
		if (position != bocha.position()){
			self.error ("No esta la pelota")
		}
	}
}

object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method position(_position){
		position = _position
	}

	method irAlInicio(){
		position = game.at(0, 5)
	}
}
