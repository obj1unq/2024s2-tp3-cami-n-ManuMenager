import transformaciones.*
object knightRider {
	method peso() { 
		return 500 
	}

	method nivelPeligrosidad() { 
		return 10 
	}

	method consecuenciaDeCarga() { 
		//No hace nada
	}

	method bulto() {
		return 1
	}
}

object bumblebee {
	var property transformacion = auto

	method peso() { 
		return 800 
	}

	method nivelPeligrosidad() { 
		return transformacion.nivelPeligrosidad()
	}

	method consecuenciaDeCarga() { 
		transformacion = robot
	}

	method bulto() {
		return 2
	}
}

object paqueteDeLadrillos {
	var property ladrillos = 0

	method peso(){
		return 2 * ladrillos
	}

	method nivelPeligrosidad() {
		return 2
	}

	method consecuenciaDeCarga() { 
		ladrillos += 12
	}

	method bulto() {
		if (1 <= ladrillos <= 100) {
			return 1
		} else if (101 <= ladrillos <= 300) {
			return 2
		} else {
			return 3
		}
	}
}

object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad() {
		return 1
	}

	method consecuenciaDeCarga() { 
		peso += 20
	}

	method bulto() {
		return 1
	}
}

object bateriaAntiaerea {
	var property tieneMisiles = false

	method peso(){
		if (tieneMisiles) {
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad(){
		if (tieneMisiles) {
			return 100
		} else {
			return 0
		}
	}

	method consecuenciaDeCarga() { 
		tieneMisiles = true
	}

	method bulto() {
		if (tieneMisiles) {
			return 2
		} else {
			return 1
		}
	}
}

object contenedorPortuario {
	const cosas = #{}

	method agregar(cosa) {
        cosas.add(cosa)
    }

	method peso() {
		return 100 + cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		if (cosas.isEmpty()) {
			return 0
		} else {
			return self.nivelDeCosaMasPeligrosa()
		}
	}

	method nivelDeCosaMasPeligrosa() {
		return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
	}

	method consecuenciaDeCarga() { 
		cosas.forEach({cosa => cosa.consecuenciaDeCarga()})
	}

	method bulto() {
		return cosas.sum({cosa => cosa.bulto()}) + 1
	}
}

object residuosRadioactivos {
	var property peso = 0

	method nivelPeligrosidad() {
		return 200
	}

	method consecuenciaDeCarga() { 
		peso += 15
	}

	method bulto() {
		return 1
	}
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider

	method peso() {
		return cosaEnvuelta.peso()
	}
	
	method nivelPeligrosidad() {
		return cosaEnvuelta.nivelPeligrosidad() / 2
	}

	method consecuenciaDeCarga() { 
		//No hace nada
	}

	method bulto() {
		return 2
	}
}