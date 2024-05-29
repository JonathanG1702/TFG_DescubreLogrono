import '../database.dart';

class ReseasNegociosTable extends SupabaseTable<ReseasNegociosRow> {
  @override
  String get tableName => 'reseñas_negocios';

  @override
  ReseasNegociosRow createRow(Map<String, dynamic> data) =>
      ReseasNegociosRow(data);
}

class ReseasNegociosRow extends SupabaseDataRow {
  ReseasNegociosRow(super.data);

  @override
  SupabaseTable get table => ReseasNegociosTable();

  String get idResena => getField<String>('id_reseña')!;
  set idResena(String value) => setField<String>('id_reseña', value);

  String get idNegocio => getField<String>('id_negocio')!;
  set idNegocio(String value) => setField<String>('id_negocio', value);

  double? get puntuacion => getField<double>('puntuacion');
  set puntuacion(double? value) => setField<double>('puntuacion', value);

  String get comentario => getField<String>('comentario')!;
  set comentario(String value) => setField<String>('comentario', value);

  List<String> get urlFotos => getListField<String>('url_fotos');
  set urlFotos(List<String>? value) => setListField<String>('url_fotos', value);

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  DateTime get fechaPublicacion => getField<DateTime>('fecha_publicacion')!;
  set fechaPublicacion(DateTime value) =>
      setField<DateTime>('fecha_publicacion', value);

  DateTime? get fechaEdicion => getField<DateTime>('fecha_edicion');
  set fechaEdicion(DateTime? value) =>
      setField<DateTime>('fecha_edicion', value);

  int get likesResena => getField<int>('likes_reseña')!;
  set likesResena(int value) => setField<int>('likes_reseña', value);
}
