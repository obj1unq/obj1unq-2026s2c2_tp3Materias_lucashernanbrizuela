import estudiante.Estudiante
import carreras.*



class Materia {
    //var property requisitosNecesarios = #{}
    var property creditosNecesarios = 0
    var property creditosOtorgados
    var property año 
    const listaDeEstudiantes = #{} 
    //method requisitos(_values) {requisitosNecesarios = _values}
    const requisitosParaInscribirse = #{}

    method agregarRequisito(requisito) {
      requisitosParaInscribirse.add(requisito)
    }

    method agregarEstudiante(estudiante) {
      listaDeEstudiantes.add(estudiante)
    }

    method listaDeEstudiantes() {
      return listaDeEstudiantes
    }

    method estudianteCumpleConTodosLosRequesitos(estudiante,carrera) {
      return requisitosParaInscribirse.isEmpty() || requisitosParaInscribirse.all({requisito => requisito.esCumplidoPor(estudiante,carrera)})
    }

    method x(estudiante,carrera) {
      return requisitosParaInscribirse.all({requisito => requisito.esCumplidoPor(estudiante,carrera)})
    }
}


class RequerimientoCredito {
  var property cantidadDeCreditos

  method esCumplidoPor(estudiante,carrera) {
    return estudiante.cantidadDeCreditos(carrera) >= cantidadDeCreditos
  }
}

class RequerimientoAño {
  var property añoNecesario
  var property carrera 

  method esCumplidoPor(estudiante,carreradada) {
    return estudiante.aproboTodasLasMateriasDeAño(añoNecesario,carreradada)
  }
}

class RequerimientoCorrelativas {
  var property materiasNecesarias 

  method esCumplidoPor(estudiante,carrera) {
    return estudiante.aprobeTodasLasMateriasNecesarias(materiasNecesarias)
  }
}





//programacion
const obj2 = new Materia(creditosOtorgados = 8, año = 2)
const obj1 = new Materia(creditosOtorgados = 4, año = 1)
const mate1 = new Materia(creditosOtorgados = 8, año = 1)
const elementosDeProgramaciónYLógica = new Materia(creditosOtorgados = 5, año = 1)
const obj3 = new Materia(creditosOtorgados = 8, año = 3)
const basesDeDatos = new Materia(creditosOtorgados = 8, año = 1)
const programacionConcurrente = new Materia(creditosOtorgados = 10, año = 4) 

//TESS

const matemáticaSparaEconomíaYAdministración = new Materia(creditosOtorgados = 4, año = 1)
const trabajoYSociedad = new Materia(creditosOtorgados = 4, año = 1)
const economía = new Materia(creditosOtorgados = 6, año = 2)
const desarrolloLocal = new Materia(creditosOtorgados = 10, año = 5)

//TO
const lecturaYEscrituraAcadémica = new Materia(creditosOtorgados = 8, año = 1)
const cienciasDeLaSalud = new Materia(creditosOtorgados = 8, año = 1)
const psicología = new Materia(creditosOtorgados = 4, año = 2, requisitosParaInscribirse = #{new RequerimientoAño(añoNecesario = 1, carrera = terapiaOcupacional)})
const antropología = new Materia(creditosOtorgados = 4, año = 2, requisitosParaInscribirse = #{new RequerimientoCredito(cantidadDeCreditos = 8)})
const sociología = new Materia(creditosOtorgados = 8, año = 3, requisitosParaInscribirse = #{new RequerimientoCredito(cantidadDeCreditos = 10)})

/*
- Lectura y escritura académica (LEA): año 1, créditos 8, no tiene requisitos
- Ciencias de la Salud, año 1, créditos 8, no tiene requisitos
- Psicología, año 2, créditos 4, debe haber aprobado el año anterior completo
- Antropología, año 2, créditos 4, debe tener 8 créditos aprobados
- Sociología, año 3, créditos 8, debe tener 10 créditos aprobados

*/

