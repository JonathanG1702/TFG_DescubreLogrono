import '../database.dart';

class MarcadoresNegociosUsuarioTable
    extends SupabaseTable<MarcadoresNegociosUsuarioRow> {
  @override
  String get tableName => 'marcadores_negocios_usuario';

  @override
  MarcadoresNegociosUsuarioRow createRow(Map<String, dynamic> data) =>
      MarcadoresNegociosUsuarioRow(data);
}

class MarcadoresNegociosUsuarioRow extends SupabaseDataRow {
  MarcadoresNegociosUsuarioRow(super.data);

  @override
  SupabaseTable get table => MarcadoresNegociosUsuarioTable();

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  List<String> get idNegociosGuardados =>
      getListField<String>('id_negocios_guardados');
  set idNegociosGuardados(List<String>? value) =>
      setListField<String>('id_negocios_guardados', value);
}
