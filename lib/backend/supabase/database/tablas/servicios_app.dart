import '../database.dart';

class ServiciosAppTable extends SupabaseTable<ServiciosAppRow> {
  @override
  String get tableName => 'servicios_app';

  @override
  ServiciosAppRow createRow(Map<String, dynamic> data) => ServiciosAppRow(data);
}

class ServiciosAppRow extends SupabaseDataRow {
  ServiciosAppRow(super.data);

  @override
  SupabaseTable get table => ServiciosAppTable();

  String get idServicio => getField<String>('id_servicio')!;
  set idServicio(String value) => setField<String>('id_servicio', value);

  String get servicioApp => getField<String>('servicio_app')!;
  set servicioApp(String value) => setField<String>('servicio_app', value);

  String get estadoServicio => getField<String>('estado_servicio')!;
  set estadoServicio(String value) =>
      setField<String>('estado_servicio', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  DateTime? get fechaActualizacion => getField<DateTime>('fecha_actualizacion');
  set fechaActualizacion(DateTime? value) =>
      setField<DateTime>('fecha_actualizacion', value);

  String? get actualizadoPor => getField<String>('actualizado_por');
  set actualizadoPor(String? value) =>
      setField<String>('actualizado_por', value);
}
