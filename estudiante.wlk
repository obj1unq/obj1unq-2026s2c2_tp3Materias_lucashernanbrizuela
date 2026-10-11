import notas.*



class Estudiante {

  const carrerasInscriptas = #{} 
  const materiasInscriptas = #{}
  const notas = []
  //var cantidadDeCreditos = 0 


  method cantidadDeCreditos(carrera) {
    return self.materiasAprobadasDeCarrera(carrera).sum({materia => materia.creditosOtorgados()})
  }

  method inscribirseACarrera(carrera) {
    self.verificarCarrera(carrera)
    carrerasInscriptas.add(carrera)
  }

  method agregarNota(nota) {
    notas.add(nota)
  }

  method verificarCarrera(carrera) {
    if (self.esUnaCarreraQueCurso(carrera)){
      self.error("Carrera ya inscripta")
    }
  }

  method esUnaCarreraQueCurso(carrera) {
    return carrerasInscriptas.contains(carrera)
  }

  method materiaSeEncuentraEnAlgunaCarrera(materia) {
    return carrerasInscriptas.any({carrera => carrera.materiaSeEncuentraAqui(materia)})
  }

  method carrerasInscriptas() {
    return carrerasInscriptas
  }

  method materiasInscriptas() {
    return materiasInscriptas
  }

  method agregarMateria(materia) {
    materiasInscriptas.add(materia)
  }

  method AprobéLaMateria(materia) {
    return notas.any({nota => nota.materiaDada() == materia && nota.notaDada() >= 6})  
  }

  method notasAprobadasEnCarrera(carrera) {
    return (notas.filter({nota => carrera.materiaSeEncuentraAqui(nota.materiaDada()) && nota.notaDada() >= 6 }))
  }

  
  method notasAprobadas() {
    return notas.filter({nota => nota.notaDada() >= 6 })
  }

  method materiasAprobadas() {
    return self.notasAprobadas().map({nota => nota.materiaDada()})
  }

  method materiasAprobadasDeCarrera(carrera) {
    return self.materiasAprobadas().filter({materia => carrera.materiaSeEncuentraAqui(materia)})
  }

  method aprobeTodasLasMateriasNecesarias(meteriasNecesarias) {
    return meteriasNecesarias.all({materiaN => self.materiasAprobadas().contains(materiaN)})
  }


  method estoyInscriptoAMateria(materiaDada) {
    return materiasInscriptas.any({materia => materia == materiaDada})
  }


  method todasLasCursadasDeMateria(materia) {
    return notas.filter({nota => nota.materiaDada() == materia})
  }

  method cantMateriasAprobadas() {
    return self.materiasAprobadas().size()
  }

  method aproboTodasLasMateriasDeAño(año,carrera) {
    return carrera.materiasDeAño(año).all({materia => self.materiasAprobadas().contains(materia)})
  }



  
}