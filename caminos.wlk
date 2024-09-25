object ruta9 {
    const nivelPeligrosidad = 11

    method validarViaje(vehiculo) {
        if (not vehiculo.puedeCircularEnRuta(nivelPeligrosidad)) {
            self.error("El " + vehiculo + " no puede circular por ruta 9")
        }
    }
}

object caminosVecinales {
    var property pesoMaximo = 0

    method validarViaje(vehiculo) {
        if (vehiculo.pesoTotal() > self.pesoMaximo()) {
            self.error("El " + vehiculo + " no puede circular por caminos vecinales")
        }
    }
}