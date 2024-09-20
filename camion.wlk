import cosas.*
import destinos.*
import caminos.*
object camion {
	const property cosas = #{}

	method cargar(cosa) {
		cosa.consecuenciaDeCarga()
		cosas.add(cosa)
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => self.esPar(cosa.peso())})
	}

	method esPar(numero) {
		return numero % 2 == 0
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({cosa2 => cosa2.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return (not self.excedidoDePeso()) and (self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad) == 0)
	}

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso() > min and cosa.peso() < max})
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}

	method transportar(destino, camino) {
		self.validarTransportar(destino, camino)
		destino.agregarCosas(cosas)
		cosas.clear()
	}

	method validarTransportar(destino, camino) {
		self.validarPeso(self.pesoTotal())
		destinos.validarBultos(self)
		caminos.validarViaje(self)
	}

	method validarPeso(peso) {
		if (self.excedidoDePeso()) {
			self.error("El camión está excedido de peso")
		}
	}
	
}
