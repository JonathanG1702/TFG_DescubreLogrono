double? autoCalculoResenas(
  double valoracionMedia,
  int cantResenas,
  double valoracionUsuario,
  bool esNuevaResena,
) {
  double nuevaValoracion;

  if (esNuevaResena) {
    nuevaValoracion =  ((valoracionMedia * cantResenas) + valoracionUsuario) /
        (cantResenas + 1);
  } else {
    if(cantResenas - 1 <= 0) return 0;
    nuevaValoracion = ((valoracionMedia * cantResenas) - valoracionUsuario) /
        (cantResenas - 1);
  }

  return double.parse(nuevaValoracion.toStringAsFixed(2));

}

int actualizarNumResenas(
  int cantResenas,
  bool sumarResena,
) {
  if (sumarResena) {
    return ++cantResenas;
  }
  return --cantResenas;
}

int? actualizarCantLike(
  int cantLikes,
  bool sumarLikes,
) {
  int nuevaCantLikes;
  if (sumarLikes) {
    return ++cantLikes;
  }
  return --cantLikes;
}

String formatearDireccionNegocio(String direccionNegocio) {
  if (direccionNegocio.length < 40) return direccionNegocio;

  return direccionNegocio.substring(0, 41) + "...";
}

bool? comprobarValidezDNI(String dniAComprobar) {
  // Definimos las letras válidas en orden.
  const letrasValidas = "TRWAGMYFPDXBNJZSQVHLCKE";
  String secuenciaDNI, letraDNI, letraCalculada;
  int numeroDNI, indiceCalculado;

  // Verificamos que el DNI tenga una longitud de 9 caracteres.
  if (dniAComprobar.length != 9) {
    return false;
  }

  // Extraemos el número y la letra del DNI.
  secuenciaDNI = dniAComprobar.substring(0, 8);
  letraDNI = dniAComprobar.substring(8).toUpperCase();

  // Verificamos que los primeros 8 caracteres sean números.
  if (!RegExp(r'^\d{8}$').hasMatch(secuenciaDNI)) {
    return false;
  }

  // Convertimos el número a entero.
  numeroDNI = int.parse(secuenciaDNI);

  // Calculamos el índice correspondiente a la letra.
  indiceCalculado = numeroDNI % 23;

  // Obtenemos la letra calculada a partir del índice.
  letraCalculada = letrasValidas[indiceCalculado];

  // Comparamos la letra calculada con la letra proporcionada.
  return letraDNI == letraCalculada;
}
