object almacen {
    const cosas = []

    method bultosMax() {
        return 3
    }

    method bultosEnAlmacen() {
        return cosas.sum({cosa => cosa.bulto()})
    }

    method validarBultos(vehiculo) {
        if (self.excesoDeBultos(vehiculo)) {
            self.error("El almacen no puede recibir " + vehiculo.totalBultos() + " bultos")
        }
    }
    
    method excesoDeBultos(vehiculo) {
        return (vehiculo.totalBultos() + self.bultosEnAlmacen() > self.bultosMax())
    }

    method agregarCosas(_cosas) {
        cosas.addAll(_cosas)
    }
}