// sistema.wlk
import estudiante.*
import notas.*
import carreras.*
import materias.*


object sistema {

    method validarCarreraParaEstudiante(estudiante,carrera) {
      if (not estudiante.esUnaCarreraQueCurso(carrera)){
        self.error("NO ESTOY INSCIPTO")
      }
    }


    method promedioDeMateriasEnTodasLasCarreras(estudiante) {
      return estudiante.notasAprobadas().sum({nota => nota.notaDada()}) / estudiante.cantMateriasAprobadas()
    }

    method inscribirAEnMateria(estudiante,materia,carrera) {
      estudiante.agregarMateria(materia)
      materia.agregarEstudiante(estudiante)
    }

}

