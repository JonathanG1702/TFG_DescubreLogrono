import '../database.dart';

class CuentasUsuariosAppTable extends SupabaseTable<CuentasUsuariosAppRow> {
  @override
  String get tableName => 'cuentas_usuarios_app';

  @override
  CuentasUsuariosAppRow createRow(Map<String, dynamic> data) =>
      CuentasUsuariosAppRow(data);
}

class CuentasUsuariosAppRow extends SupabaseDataRow {
  CuentasUsuariosAppRow(super.data);

  @override
  SupabaseTable get table => CuentasUsuariosAppTable();

  String get idCuenta => getField<String>('id_cuenta')!;
  set idCuenta(String value) => setField<String>('id_cuenta', value);

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  String get nombreUsuario => getField<String>('nombre_usuario')!;
  set nombreUsuario(String value) => setField<String>('nombre_usuario', value);

  String? get telefono => getField<String>('telefono');
  set telefono(String? value) => setField<String>('telefono', value);

  String get edad => getField<String>('edad')!;
  set edad(String value) => setField<String>('edad', value);

  bool get cuentaVerificada => getField<bool>('cuenta_verificada')!;
  set cuentaVerificada(bool value) =>
      setField<bool>('cuenta_verificada', value);

  String get urlImagenUsuario => getField<String>('url_imagen_usuario')!;
  set urlImagenUsuario(String value) =>
      setField<String>('url_imagen_usuario', value);

  int? get cantResenas => getField<int>('cant_reseñas');
  set cantResenas(int? value) => setField<int>('cant_reseñas', value);
}
