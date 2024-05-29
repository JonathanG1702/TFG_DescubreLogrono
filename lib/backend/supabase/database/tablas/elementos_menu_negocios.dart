import '../database.dart';

class ElementosMenuNegociosTable
    extends SupabaseTable<ElementosMenuNegociosRow> {
  @override
  String get tableName => 'elementos_menu_negocios';

  @override
  ElementosMenuNegociosRow createRow(Map<String, dynamic> data) =>
      ElementosMenuNegociosRow(data);
}

class ElementosMenuNegociosRow extends SupabaseDataRow {
  ElementosMenuNegociosRow(super.data);

  @override
  SupabaseTable get table => ElementosMenuNegociosTable();

  String get idElemento => getField<String>('id_elemento')!;
  set idElemento(String value) => setField<String>('id_elemento', value);

  String get idNegocio => getField<String>('id_negocio')!;
  set idNegocio(String value) => setField<String>('id_negocio', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  bool get esDestacado => getField<bool>('es_destacado')!;
  set esDestacado(bool value) => setField<bool>('es_destacado', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  double? get precio => getField<double>('precio');
  set precio(double? value) => setField<double>('precio', value);

  double? get cantUnidades => getField<double>('cant_unidades');
  set cantUnidades(double? value) => setField<double>('cant_unidades', value);

  String? get ingredientes => getField<String>('ingredientes');
  set ingredientes(String? value) => setField<String>('ingredientes', value);

  List<String> get fotos => getListField<String>('fotos');
  set fotos(List<String>? value) => setListField<String>('fotos', value);

  List<String> get etiquetas => getListField<String>('etiquetas');
  set etiquetas(List<String>? value) =>
      setListField<String>('etiquetas', value);
}
