import '../database.dart';

class TipoSuscripcionTable extends SupabaseTable<TipoSuscripcionRow> {
  @override
  String get tableName => 'tipo_suscripcion';

  @override
  TipoSuscripcionRow createRow(Map<String, dynamic> data) =>
      TipoSuscripcionRow(data);
}

class TipoSuscripcionRow extends SupabaseDataRow {
  TipoSuscripcionRow(super.data);

  @override
  SupabaseTable get table => TipoSuscripcionTable();

  int get idTipoSuscripcion => getField<int>('id_tipo_suscripcion')!;
  set idTipoSuscripcion(int value) =>
      setField<int>('id_tipo_suscripcion', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  List<String> get funcionesIncorpora =>
      getListField<String>('funciones_incorpora');
  set funcionesIncorpora(List<String>? value) =>
      setListField<String>('funciones_incorpora', value);

  double get costeMensual => getField<double>('coste_mensual')!;
  set costeMensual(double value) => setField<double>('coste_mensual', value);

  double get costeAnual => getField<double>('coste_anual')!;
  set costeAnual(double value) => setField<double>('coste_anual', value);

  double? get descuentoTemporal => getField<double>('descuento_temporal');
  set descuentoTemporal(double? value) =>
      setField<double>('descuento_temporal', value);

  double? get descuentoAnual => getField<double>('descuento_anual');
  set descuentoAnual(double? value) =>
      setField<double>('descuento_anual', value);

  bool get esPublica => getField<bool>('es_publica')!;
  set esPublica(bool value) => setField<bool>('es_publica', value);

  int? get grupoPermisos => getField<int>('grupo_permisos');
  set grupoPermisos(int? value) => setField<int>('grupo_permisos', value);

  int get maxUsuarios => getField<int>('max_usuarios')!;
  set maxUsuarios(int value) => setField<int>('max_usuarios', value);

  int get maxNegocios => getField<int>('max_negocios')!;
  set maxNegocios(int value) => setField<int>('max_negocios', value);

  String? get refColorFondo => getField<String>('ref_color_fondo');
  set refColorFondo(String? value) =>
      setField<String>('ref_color_fondo', value);

  String? get refColorCabecera => getField<String>('ref_color_cabecera');
  set refColorCabecera(String? value) =>
      setField<String>('ref_color_cabecera', value);

  String? get refColorBoton => getField<String>('ref_color_boton');
  set refColorBoton(String? value) =>
      setField<String>('ref_color_boton', value);

  String? get refColorTextoBoton => getField<String>('ref_color_texto_boton');
  set refColorTextoBoton(String? value) =>
      setField<String>('ref_color_texto_boton', value);
}
