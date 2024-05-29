import '../database.dart';

class TiposNegociosTable extends SupabaseTable<TiposNegociosRow> {
  @override
  String get tableName => 'tipos_negocios';

  @override
  TiposNegociosRow createRow(Map<String, dynamic> data) =>
      TiposNegociosRow(data);
}

class TiposNegociosRow extends SupabaseDataRow {
  TiposNegociosRow(super.data);

  @override
  SupabaseTable get table => TiposNegociosTable();

  String get tipo => getField<String>('tipo')!;
  set tipo(String value) => setField<String>('tipo', value);

  bool get activo => getField<bool>('activo')!;
  set activo(bool value) => setField<bool>('activo', value);
}
