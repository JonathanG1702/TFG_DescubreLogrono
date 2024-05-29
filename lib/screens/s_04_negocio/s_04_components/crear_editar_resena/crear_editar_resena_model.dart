import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'crear_editar_resena_widget.dart' show CrearEditarResenaWidget;
import 'package:flutter/material.dart';

class CrearEditarResenaModel extends FlutterFlowModel<CrearEditarResenaWidget> {
  ///  Local state fields for this component.

  bool? cambiosRealizados = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasNegociosAppRow>? datosNegocio;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<CuentasNegociosAppRow>? datosActualizadosResena;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasUsuariosAppRow>? datosUsuario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
