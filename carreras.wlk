import materias.*

class Carrera {
  const property materias = #{}

  method materiaSeEncuentraAqui(materia) {
    return materias.contains(materia)
  }

  method materiasDeAño(año) {
    return materias.filter({materia => materia.año() == año})
  }

}


const programacion = new Carrera(materias = #{
        elementosDeProgramaciónYLógica,
        obj1,
        mate1,
        obj2,
        obj3,
        basesDeDatos,
        programacionConcurrente
}) 
    
const tecnicaturaEnEconomíaSocialYSolidaria = new Carrera(materias = #{
        matemáticaSparaEconomíaYAdministración,
        trabajoYSociedad,
        economía,
        desarrolloLocal
})

const terapiaOcupacional = new Carrera(materias = #{
        lecturaYEscrituraAcadémica,
        cienciasDeLaSalud,
        psicología,
        antropología,
        sociología
}) 


