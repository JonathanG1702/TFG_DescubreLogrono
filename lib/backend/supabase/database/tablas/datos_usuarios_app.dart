import '../database.dart';

class DatosUsuariosAppTable extends SupabaseTable<DatosUsuariosAppRow> {
  @override
  String get tableName => 'datos_usuarios_app';

  @override
  DatosUsuariosAppRow createRow(Map<String, dynamic> data) =>
      DatosUsuariosAppRow(data);
}

class DatosUsuariosAppRow extends SupabaseDataRow {
  DatosUsuariosAppRow(super.data);

  @override
  SupabaseTable get table => DatosUsuariosAppTable();

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  String get correoElectronico => getField<String>('correo_electronico')!;
  set correoElectronico(String value) =>
      setField<String>('correo_electronico', value);

  DateTime get fechaRegistro => getField<DateTime>('fecha_registro')!;
  set fechaRegistro(DateTime value) =>
      setField<DateTime>('fecha_registro', value);

  DateTime? get ultimoInicioSesion =>
      getField<DateTime>('ultimo_inicio_sesion');
  set ultimoInicioSesion(DateTime? value) =>
      setField<DateTime>('ultimo_inicio_sesion', value);

  DateTime? get ultimoCambioContrasena =>
      getField<DateTime>('ultimo_cambio_contraseña');
  set ultimoCambioContrasena(DateTime? value) =>
      setField<DateTime>('ultimo_cambio_contraseña', value);

  DateTime? get ultimoCambioCorreo =>
      getField<DateTime>('ultimo_cambio_correo');
  set ultimoCambioCorreo(DateTime? value) =>
      setField<DateTime>('ultimo_cambio_correo', value);

  String get dispositivoRegistro => getField<String>('dispositivo_registro')!;
  set dispositivoRegistro(String value) =>
      setField<String>('dispositivo_registro', value);

  String? get dispotivoUltimoInicioSesion =>
      getField<String>('dispotivo_ultimo_inicio_sesion');
  set dispotivoUltimoInicioSesion(String? value) =>
      setField<String>('dispotivo_ultimo_inicio_sesion', value);

  bool get cuentaHabilitada => getField<bool>('cuenta_habilitada')!;
  set cuentaHabilitada(bool value) =>
      setField<bool>('cuenta_habilitada', value);

  String? get motivoCuentaInhabilitada =>
      getField<String>('motivo_cuenta_inhabilitada');
  set motivoCuentaInhabilitada(String? value) =>
      setField<String>('motivo_cuenta_inhabilitada', value);

  int? get idTipoSuscripcion => getField<int>('id_tipo_suscripcion');
  set idTipoSuscripcion(int? value) =>
      setField<int>('id_tipo_suscripcion', value);
}
