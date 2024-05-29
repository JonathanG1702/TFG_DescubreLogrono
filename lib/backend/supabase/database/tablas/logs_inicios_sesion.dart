import '../database.dart';

class LogsIniciosSesionTable extends SupabaseTable<LogsIniciosSesionRow> {
  @override
  String get tableName => 'logs_inicios_sesion';

  @override
  LogsIniciosSesionRow createRow(Map<String, dynamic> data) =>
      LogsIniciosSesionRow(data);
}

class LogsIniciosSesionRow extends SupabaseDataRow {
  LogsIniciosSesionRow(super.data);

  @override
  SupabaseTable get table => LogsIniciosSesionTable();

  int get idLog => getField<int>('id_log')!;
  set idLog(int value) => setField<int>('id_log', value);

  String get tipoAccion => getField<String>('tipo_accion')!;
  set tipoAccion(String value) => setField<String>('tipo_accion', value);

  DateTime get fecha => getField<DateTime>('fecha')!;
  set fecha(DateTime value) => setField<DateTime>('fecha', value);

  String? get idUsuario => getField<String>('id_usuario');
  set idUsuario(String? value) => setField<String>('id_usuario', value);

  String? get ubicacion => getField<String>('ubicacion');
  set ubicacion(String? value) => setField<String>('ubicacion', value);

  String get estadoAccion => getField<String>('estado_accion')!;
  set estadoAccion(String value) => setField<String>('estado_accion', value);

  String get dispositivo => getField<String>('dispositivo')!;
  set dispositivo(String value) => setField<String>('dispositivo', value);

  String? get descripcionLog => getField<String>('descripcion_log');
  set descripcionLog(String? value) =>
      setField<String>('descripcion_log', value);

  int? get refLog => getField<int>('ref_log');
  set refLog(int? value) => setField<int>('ref_log', value);
}
