import '../database.dart';

class CategoriasMenuNegociosTable
    extends SupabaseTable<CategoriasMenuNegociosRow> {
  @override
  String get tableName => 'categorias_menu_negocios';

  @override
  CategoriasMenuNegociosRow createRow(Map<String, dynamic> data) =>
      CategoriasMenuNegociosRow(data);
}

class CategoriasMenuNegociosRow extends SupabaseDataRow {
  CategoriasMenuNegociosRow(super.data);

  @override
  SupabaseTable get table => CategoriasMenuNegociosTable();

  List<String> get categorias => getListField<String>('categorias');
  set categorias(List<String> value) =>
      setListField<String>('categorias', value);

  String get idNegocio => getField<String>('id_negocio')!;
  set idNegocio(String value) => setField<String>('id_negocio', value);
}
