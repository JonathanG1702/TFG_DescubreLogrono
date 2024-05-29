import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'seleccionar_tipo_plan_widget.dart' show SeleccionarTipoPlanWidget;
import 'package:flutter/material.dart';

class SeleccionarTipoPlanModel
    extends FlutterFlowModel<SeleccionarTipoPlanWidget> {
  ///  Local state fields for this page.

  bool? pagoAnual = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in seleccionar_TipoPlan widget.
  List<DatosUsuariosAppRow>? datosUsuarioLogado;
  // Model for cabecera_InfoApp_02 component.
  late CabeceraInfoApp02Model cabeceraInfoApp02Model;
  // State field(s) for Switch widget.
  bool? switchValue;

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
