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
	

	method buscarla() {
		position = bocha.position()
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


	method taquito(){
		self.validarPosicionBocha()
		bocha.position(game.at(0.max(position.x() - 2), position.y()))
	}

	method validarPosicionBocha() {
		if (!self.tieneLaPelota()){
			self.error ("Lionel no esta en la misma posicion que la pelota")
		}
	}

	method tieneLaPelota() {
		return position == bocha.position()
	}

	method levantarla(){
		self.validarPosicionBocha()
		bocha.subir(1)
		game.schedule(2000, {
			bocha.bajar(1)
		})
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

	method subir(altura){
		position = self.moverVertical(altura)
	}

	method bajar(altura){
		position = self.moverVertical(-altura)
	}

	method moverVertical(y) {
		return game.at(position.x(), position.y() + y)
	}
}
