import estudiante.*
import notas.*

import carreras.Carrera

object sistema {
    
    method estudianteFinalizoCursada(estudiante,nota, materia) {
      self.validarEstudiante(estudiante,materia)
      self.validarNota(nota)
      estudiante.agregarNota(new Nota(estudiante = estudiante, notaDada = nota, materiaDada = materia))
    }

    method validarEstudiante(estudiante,materia) {
      if (estudiante.AprobéLaMateria(materia)|| not estudiante.materiaSeEncuentraEnAlgunaCarrera(materia)){
        self.error("Estudiante No valido")
      }
    }

    method validarNota(nota) {
      if (nota < 1 || nota > 10){
        self.error("No es valida la nota")
      }
    }

    method cantMateriasAprobadasEnCarrera(estudiante,carrera) {
      return estudiante.notasAprobadasEnCarrera(carrera).size()
    }

    method promedioDeMateriasAprobadasEnCarrera(estudiante,carrera) {
      self.validarCarreraParaEstudiante(estudiante,carrera)
      return (estudiante.notasAprobadasEnCarrera(carrera)).sum({nota => nota.notaDada() }) / self.cantMateriasAprobadasEnCarrera(estudiante,carrera)
    }

    method validarCarreraParaEstudiante(estudiante,carrera) {
      if (not estudiante.esUnaCarreraQueCurso(carrera)){
        self.error("NO ESTOY INSCIPTO")
      }
    }


    method promedioDeMateriasEnTodasLasCarreras(estudiante) {
      return estudiante.notasAprobadas().sum({nota => nota.notaDada()}) / estudiante.cantMateriasAprobadas()
    }

    method validarInscribcionAMateriaDe(estudiante,materia,carrera) {
      return estudiante.materiaSeEncuentraEnAlgunaCarrera(materia) &&
      not estudiante.AprobéLaMateria(materia) &&
      not estudiante.estoyInscriptoAMateria(materia) &&
      materia.estudianteCumpleConTodosLosRequesitos(estudiante,carrera)
    }

    method inscribirAEnMateria(estudiante,materia,carrera) {
      self.validarinscribcion(estudiante,materia,carrera)
      estudiante.agregarMateria(materia)
      materia.agregarEstudiante(estudiante)
    }

    method validarinscribcion(estudiante,materia,carrera) {
      if(not self.validarInscribcionAMateriaDe(estudiante,materia,carrera)){
        self.error("No es valida la inscripcion")
      }
    }
    
    method materiasHabilitadasEnCarrera(carrera,estudiante) {
      return carrera.materias().filter({materia => self.validarInscribcionAMateriaDe(estudiante,materia,carrera)})      
    }

}

