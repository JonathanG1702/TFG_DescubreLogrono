import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'seleccionar_cuenta_widget.dart' show SeleccionarCuentaWidget;
import 'package:flutter/material.dart';

class SeleccionarCuentaModel extends FlutterFlowModel<SeleccionarCuentaWidget> {
  ///  Local state fields for this page.

  int? cantCuentasUsuario = 0;

  int? cantCuentasNegocios = 0;

  int? maxCuentasUsuario = 0;

  int? maxCuentasNegocio = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in seleccionarCuenta widget.
  List<CuentasUsuariosAppRow>? cuentasUsuario;
  // Stores action output result for [Backend Call - Query Rows] action in seleccionarCuenta widget.
  List<CuentasNegociosAppRow>? cuentasNegocio;
  // Stores action output result for [Backend Call - Query Rows] action in seleccionarCuenta widget.
  List<DatosUsuariosAppRow>? datosUsuarioBd;
  // Stores action output result for [Backend Call - Query Rows] action in seleccionarCuenta widget.
  List<TipoSuscripcionRow>? infoSuscripcionUsuario;
  // Model for cabecera_InfoApp_02 component.
  late CabeceraInfoApp02Model cabeceraInfoApp02Model;

  @override
  void initState(BuildContext context) {
    cabeceraInfoApp02Model =
        createModel(context, () => CabeceraInfoApp02Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cabeceraInfoApp02Model.dispose();
  }
}
