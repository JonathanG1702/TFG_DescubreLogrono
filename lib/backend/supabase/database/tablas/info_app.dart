import '../database.dart';

class InfoAppTable extends SupabaseTable<InfoAppRow> {
  @override
  String get tableName => 'info_app';

  @override
  InfoAppRow createRow(Map<String, dynamic> data) => InfoAppRow(data);
}

class InfoAppRow extends SupabaseDataRow {
  InfoAppRow(super.data);

  @override
  SupabaseTable get table => InfoAppTable();

  String get version => getField<String>('version')!;
  set version(String value) => setField<String>('version', value);

  String get estadoVersion => getField<String>('estado_version')!;
  set estadoVersion(String value) => setField<String>('estado_version', value);

  DateTime get fechaCreacion => getField<DateTime>('fecha_creacion')!;
  set fechaCreacion(DateTime value) =>
      setField<DateTime>('fecha_creacion', value);

  DateTime? get fechaActualizacion => getField<DateTime>('fecha_actualizacion');
  set fechaActualizacion(DateTime? value) =>
      setField<DateTime>('fecha_actualizacion', value);

  DateTime? get fechaLanzamiento => getField<DateTime>('fecha_lanzamiento');
  set fechaLanzamiento(DateTime? value) =>
      setField<DateTime>('fecha_lanzamiento', value);

  String? get creadaPor => getField<String>('creada_por');
  set creadaPor(String? value) => setField<String>('creada_por', value);

  String? get actualizadaPor => getField<String>('actualizada_por');
  set actualizadaPor(String? value) =>
      setField<String>('actualizada_por', value);

  String? get lanzadaPor => getField<String>('lanzada_por');
  set lanzadaPor(String? value) => setField<String>('lanzada_por', value);

  bool get esPublica => getField<bool>('es_publica')!;
  set esPublica(bool value) => setField<bool>('es_publica', value);

  List<String> get cambiosRealizados =>
      getListField<String>('cambios_realizados');
  set cambiosRealizados(List<String>? value) =>
      setListField<String>('cambios_realizados', value);
}
