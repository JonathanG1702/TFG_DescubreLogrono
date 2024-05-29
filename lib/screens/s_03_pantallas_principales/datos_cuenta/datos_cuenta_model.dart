import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'datos_cuenta_widget.dart' show DatosCuentaWidget;
import 'package:flutter/material.dart';

class DatosCuentaModel extends FlutterFlowModel<DatosCuentaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in datos_cuenta widget.
  List<DatosUsuariosAppRow>? datosUsuario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
