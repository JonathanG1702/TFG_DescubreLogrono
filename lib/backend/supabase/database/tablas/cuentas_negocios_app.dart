import '../database.dart';

class CuentasNegociosAppTable extends SupabaseTable<CuentasNegociosAppRow> {
  @override
  String get tableName => 'cuentas_negocios_app';

  @override
  CuentasNegociosAppRow createRow(Map<String, dynamic> data) =>
      CuentasNegociosAppRow(data);
}

class CuentasNegociosAppRow extends SupabaseDataRow {
  CuentasNegociosAppRow(super.data);

  @override
  SupabaseTable get table => CuentasNegociosAppTable();

  String get idCuenta => getField<String>('id_cuenta')!;
  set idCuenta(String value) => setField<String>('id_cuenta', value);

  String get idUsuarioPropietario =>
      getField<String>('id_usuario_propietario')!;
  set idUsuarioPropietario(String value) =>
      setField<String>('id_usuario_propietario', value);

  String? get urlLogo => getField<String>('url_logo');
  set urlLogo(String? value) => setField<String>('url_logo', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get tipoNegocio => getField<String>('tipo_negocio');
  set tipoNegocio(String? value) => setField<String>('tipo_negocio', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  String? get ubicacion => getField<String>('ubicacion');
  set ubicacion(String? value) => setField<String>('ubicacion', value);

  List<String> get horario => getListField<String>('horario');
  set horario(List<String>? value) => setListField<String>('horario', value);

  String? get telefono => getField<String>('telefono');
  set telefono(String? value) => setField<String>('telefono', value);

  String? get paginaWeb => getField<String>('pagina_web');
  set paginaWeb(String? value) => setField<String>('pagina_web', value);

  List<String> get redesSociales => getListField<String>('redes_sociales');
  set redesSociales(List<String>? value) =>
      setListField<String>('redes_sociales', value);

  String? get urlFotoCabecera => getField<String>('url_foto_cabecera');
  set urlFotoCabecera(String? value) =>
      setField<String>('url_foto_cabecera', value);

  int get cantResenas => getField<int>('cant_reseñas')!;
  set cantResenas(int value) => setField<int>('cant_reseñas', value);

  double get valoracionMedia => getField<double>('valoracion_media')!;
  set valoracionMedia(double value) =>
      setField<double>('valoracion_media', value);

  bool get estaOculto => getField<bool>('estaOculto')!;
  set estaOculto(bool value) => setField<bool>('estaOculto', value);

  List<String> get idUsuariosAcceso =>
      getListField<String>('id_usuarios_acceso');
  set idUsuariosAcceso(List<String>? value) =>
      setListField<String>('id_usuarios_acceso', value);

  String? get nombrePropietario => getField<String>('nombre_propietario');
  set nombrePropietario(String? value) =>
      setField<String>('nombre_propietario', value);

  String? get documentoIdentidad => getField<String>('documento_identidad');
  set documentoIdentidad(String? value) =>
      setField<String>('documento_identidad', value);
}
