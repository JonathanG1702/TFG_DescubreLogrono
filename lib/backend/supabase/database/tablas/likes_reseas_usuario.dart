import '../database.dart';

class LikesReseasUsuarioTable extends SupabaseTable<LikesReseasUsuarioRow> {
  @override
  String get tableName => 'likes_reseñas_usuario';

  @override
  LikesReseasUsuarioRow createRow(Map<String, dynamic> data) =>
      LikesReseasUsuarioRow(data);
}

class LikesReseasUsuarioRow extends SupabaseDataRow {
  LikesReseasUsuarioRow(super.data);

  @override
  SupabaseTable get table => LikesReseasUsuarioTable();

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  List<String> get listadoResenasLike =>
      getListField<String>('listado_reseñas_like');
  set listadoResenasLike(List<String>? value) =>
      setListField<String>('listado_reseñas_like', value);
}
