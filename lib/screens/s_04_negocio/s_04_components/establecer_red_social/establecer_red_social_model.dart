import '/flutter_assets/flutter_flow_util.dart';
import 'establecer_red_social_widget.dart' show EstablecerRedSocialWidget;
import 'package:flutter/material.dart';

class EstablecerRedSocialModel
    extends FlutterFlowModel<EstablecerRedSocialWidget> {
  ///  Local state fields for this component.

  List<String> listaUrlRedesSociales = [];
  void addToListaUrlRedesSociales(String item) =>
      listaUrlRedesSociales.add(item);
  void removeFromListaUrlRedesSociales(String item) =>
      listaUrlRedesSociales.remove(item);
  void removeAtIndexFromListaUrlRedesSociales(int index) =>
      listaUrlRedesSociales.removeAt(index);
  void insertAtIndexInListaUrlRedesSociales(int index, String item) =>
      listaUrlRedesSociales.insert(index, item);
  void updateListaUrlRedesSocialesAtIndex(
          int index, Function(String) updateFn) =>
      listaUrlRedesSociales[index] = updateFn(listaUrlRedesSociales[index]);

  bool cambiosRealizados = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField_Descripcion widget.
  FocusNode? textFieldDescripcionFocusNode;
  TextEditingController? textFieldDescripcionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescripcionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDescripcionFocusNode?.dispose();
    textFieldDescripcionTextController?.dispose();
  }
}
