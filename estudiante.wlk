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

  method finalizeLaCursada(nota,materia) {
    self.validarFinalizacion(nota, materia)
    self.agregarNota(new Cursada(estudiante = self, notaDada = nota, materiaDada = materia) )
  }

  method validarFinalizacion(nota, materia) {
    if(self.AprobéLaMateria(materia) || not self.materiaSeEncuentraEnAlgunaCarrera(materia) || nota < 1 || nota > 10 ){
      self.error("No es valido la finalizacion de cursada")
    }
  }

  method cantMateriasAprobadasEnCarrera(carrera) {
    return self.notasAprobadasEnCarrera(carrera).size()
  }

  method promedioDeMateriasAprobadasEnCarrera(carrera) {
    self.validarCarreraParaEstudiante(carrera)
    return (self.notasAprobadasEnCarrera(carrera)).sum({nota => nota.notaDada() }) / self.cantMateriasAprobadasEnCarrera(carrera) 
  }

  method promedioDeMateriasEnTodasLasCarreras(estudiante) {
    return estudiante.notasAprobadas().sum({nota => nota.notaDada()}) / estudiante.cantMateriasAprobadas()
  }

  method validarCarreraParaEstudiante(carrera) {
    if(not self.esUnaCarreraQueCurso(carrera)){
      self.error("No estoy inscripto")
    }
  }





}

/*
    method validarCarreraParaEstudiante(estudiante,carrera) {
      if (not estudiante.esUnaCarreraQueCurso(carrera)){
        self.error("NO ESTOY INSCIPTO")
      }
    }
*/


const alex = new Estudiante()

const andy = new Estudiante() 