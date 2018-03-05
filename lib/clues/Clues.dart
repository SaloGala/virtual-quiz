class Clues {
  static Map allClues = {
    /*Clues length information*/
    'moradoTotal': {'type': 'info', 'value': 12},

    /*Clues content*/
    'morado1': {'type': 'morado', 'value': 1},
    'morado2': {'type': 'morado', 'value': 2},
    'naranja3': {'type': 'naranja', 'value': 3},
    'verde1': {
      'type': 'verde',
      'value': 1,
      'question': '¿Cuál es la capital de Irlanda?',
      'responses': ['dublin'],
      'responseToShow': 'Dublín'
    },
    'verde2': {
      'type': 'verde',
      'value': 2,
      'question': '¿Cuál es la capital de Irlanda?',
      'responses': ['dublin', 'dublín'],
      'responseToShow': 'Dublín'
    },
  };
}
