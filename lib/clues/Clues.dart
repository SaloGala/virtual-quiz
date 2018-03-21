class Clues {
  static Map allClues = {
    /*Clues length information*/
    'moradoTotal': {'type': 'info', 'value': 5},
    'rojoTotal': {'type': 'info', 'value': 5},
    'azulTotal': {'type': 'info', 'value': 5},
    'naranjaTotal': {'type': 'info', 'value': 5},
    'amarilloTotal': {'type': 'info', 'value': 5},
    'verdeTotal': {'type': 'info', 'value': 5},

    /*Clues content*/

    /*Morado*/
    'morado1': {'type': 'morado', 'value': 1},
    'morado2': {'type': 'morado', 'value': 2},
    'morado3': {'type': 'morado', 'value': 3},
    'morado4': {'type': 'morado', 'value': 4},
    'morado5': {'type': 'morado', 'value': 5},

    /*Rojo*/
    'rojo1': {'type': 'rojo', 'value': 1},
    'rojo6': {'type': 'rojo', 'value': 6},
    'rojo7': {'type': 'rojo', 'value': 7},
    'rojo15': {'type': 'rojo', 'value': 15},
    'rojo14': {'type': 'rojo', 'value': 14},

    /*Azul*/
    'azul3': {'type': 'azul', 'value': 3},
    'azul5': {'type': 'azul', 'value': 5},
    'azul8': {'type': 'azul', 'value': 8},
    'azul10': {'type': 'azul', 'value': 10},
    'azul14': {'type': 'azul', 'value': 14},

    /*Naranja*/
    'naranja3': {'type': 'naranja', 'value': 3},
    'naranja5': {'type': 'naranja', 'value': 5},
    'naranja7': {'type': 'naranja', 'value': 7},
    'naranja12': {'type': 'naranja', 'value': 12},
    'naranja14': {'type': 'naranja', 'value': 14},

    /*Amarillo*/
    'amarillo1': {
      'type': 'amarillo',
      'value': 1,
      'question': '¿Aquí la respuesta es SIOM?',
      'responses': ['siom'],
      'responseToShow': 'SIOM'
    },
    'amarillo2': {
      'type': 'amarillo',
      'value': 2,
      'question': '¿Aquí la respuesta es VACIS?',
      'responses': ['vacis'],
      'responseToShow': 'VACIS'
    },
    'amarillo3': {
      'type': 'amarillo',
      'value': 3,
      'question': '¿Aquí la respuesta es SUIC?',
      'responses': ['suic'],
      'responseToShow': 'SUIC'
    },
    'amarillo4': {
      'type': 'amarillo',
      'value': 4,
      'question': '¿Aquí la respuesta es APIS?',
      'responses': ['apis'],
      'responseToShow': 'APIS'
    },
    'amarillo5': {
      'type': 'amarillo',
      'value': 5,
      'question': '¿Aquí la respuesta es INTELIGENCIA?',
      'responses': ['inteligencia'],
      'responseToShow': 'INTELIGENCIA'
    },

    /*Verde*/
    'verde1': {
      'type': 'verde',
      'value': 1,
      'question': '¿Aquí la respuesta es CIBERDELINCUENCIA?',
      'responses': [
        'ciber delincuencia',
        'ciberdelincuencia',
      ],
      'responseToShow': 'CIBERDELINCUENCIA'
    },
    'verde2': {
      'type': 'verde',
      'value': 2,
      'question': '¿Aquí la respuesta es ALERTAMIENTOS?',
      'responses': [
        'alertamiento',
        'alertamientos',
      ],
      'responseToShow': 'ALERTAMIENTOS'
    },
    'verde3': {
      'type': 'verde',
      'value': 3,
      'question': '¿Aquí la respuesta es PERFIL CRIMINOLÓGICO?',
      'responses': [
        'perfil criminológico',
        'perfil criminologico',
        'criminológico',
        'criminologico'
      ],
      'responseToShow': 'PERFIL CRIMINOLÓGICO'
    },
    'verde4': {
      'type': 'verde',
      'value': 4,
      'question': '¿Aquí la respuesta es PLATAFORMA MEXICO?',
      'responses': [
        'plataforma méxico',
        'plataforma mexico',
        'plataforma',
        'méxico',
        'mexico',
        'la plataforma méxico',
        'la plataforma mexico',
        'la plataforma',
      ],
      'responseToShow': 'PLATAFORMA MÉXICO'
    },
    'verde5': {
      'type': 'verde',
      'value': 5,
      'question': '¿Aquí la respuesta es MAPAS DELICTIVOS?',
      'responses': [
        'mapas delictivos',
        'mapas',
        'delictivos',
      ],
      'responseToShow': 'MAPAS DELICTIVOS'
    },

    /*Clues addresses*/

    /*Morado*/
    'moradoAddress': {
      'type': 'info',
      'calle': {
        'responses': ['calle morado']
      },
      'numero': 10,
      'ciudad': {
        'responses': ['ciudad morado'],
        'responseToShow': 'CIUDAD MORADO'
      },
      'estado': {
        'responses': ['estado morado'],
        'responseToShow': 'ESTADO MORADO'
      },
    },

    /*Rojo*/
    'rojoAddress': {
      'type': 'info',
      'calle': {
        'responses': ['arboledas'],
        'responseToShow': 'ARBOLEDAS'
      },
      'numero': 27,
      'ciudad': {
        'responses': [
          'villahermosa',
          'villa hermosa',
        ],
        'responseToShow': 'VILLAHERMOSA'
      },
      'estado': {
        'responses': ['tabasco'],
        'responseToShow': 'TABASCO'
      },
    },

    /*Azul*/
    'azulAddress': {
      'type': 'info',
      'calle': {
        'responses': ['escuadron', 'escuadrón'],
        'responseToShow': 'ESCUADRÓN'
      },
      'numero': 59,
      'ciudad': {
        'responses': [
          'juarez',
          'juárez',
          'cd. juarez',
          'cd. juárez',
          'ciudad juarez',
          'ciudad juárez'
        ],
        'responseToShow': 'CIUDAD JUÁREZ'
      },
      'estado': {
        'responses': ['chihuahua'],
        'responseToShow': 'CHIHUAHUA'
      },
    },

    /*Naranja*/
    'naranjaAddress': {
      'type': 'info',
      'calle': {
        'responses': ['venustiano carranza'],
        'responseToShow': 'VENUSTIANO CARRANZA'
      },
      'numero': 48,
      'ciudad': {
        'responses': ['guasave'],
        'responseToShow': 'GUASAVE'
      },
      'estado': {
        'responses': ['sinaloa'],
        'responseToShow': 'SINALOA'
      },
    },

    /*Amarillo*/
    'amarilloAddress': {
      'type': 'info',
      'calle': {
        'responses': [
          'boulevard puerto aereo',
          'boulevard puerto aéreo',
          'boulevard pto aéreo',
          'boulevard pto aereo',
          'boulevard pto. aéreo',
          'boulevard pto. aereo',
          'bulevar puerto aereo',
          'bulevar puerto aéreo',
          'bulevar pto aéreo',
          'bulevar pto aereo',
          'bulevar pto. aéreo',
          'bulevar pto. aereo',
          'puerto aereo',
          'puerto aéreo',
          'pto. aereo',
          'pto. aéreo',
          'pto aereo',
          'pto aéreo',
          'blvd. puerto aereo',
          'blvd. puerto aéreo',
          'blvd puerto aereo',
          'blvd puerto aéreo',
          'blvd. pto aereo',
          'blvd. pto aéreo',
          'blvd pto aereo',
          'blvd pto aéreo',
        ],
        'responseToShow': 'BOULEVARD PUERTO AÉREO'
      },
      'numero': 1,
      'ciudad': {
        'responses': [
          'ciudad de mexico',
          'ciudad de méxico',
          'de mexico',
          'de méxico',
          'cdmx',
          'méxico',
          'mexico',
          'df',
          'df.',
          'd.f.',
        ],
        'responseToShow': 'CIUDAD DE MÉXICO'
      },
      'estado': {
        'responses': [
          'df',
          'df.',
          'd.f.'
              'distrito federal',
          'ciudad de mexico',
          'ciudad de méxico',
          'de mexico',
          'de méxico',
          'cdmx',
          'méxico',
          'mexico',
        ],
        'responseToShow': 'CDMX'
      },
    },

    /*Verde*/
    'verdeAddress': {
      'type': 'info',
      'calle': {
        'responses': [
          'de la griega',
          'griega',
          'la griega',
        ],
        'responseToShow': 'DE LA GRIEGA'
      },
      'numero': 65,
      'ciudad': {
        'responses': ['pachuca'],
        'responseToShow': 'PACHUCA'
      },
      'estado': {
        'responses': ['hidalgo'],
        'responseToShow': 'HIDALGO'
      },
    }
  };
}
