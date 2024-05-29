import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/form_field_controller.dart';
import 'dart:async';
import 'editar_perfil_negocio_widget.dart' show EditarPerfilNegocioWidget;
import 'package:flutter/material.dart';

class EditarPerfilNegocioModel
    extends FlutterFlowModel<EditarPerfilNegocioWidget> {
  ///  Local state fields for this page.

  bool realizadoCambios = false;

  List<String> linkRedesSociales = [];
  void addToLinkRedesSociales(String item) => linkRedesSociales.add(item);
  void removeFromLinkRedesSociales(String item) =>
      linkRedesSociales.remove(item);
  void removeAtIndexFromLinkRedesSociales(int index) =>
      linkRedesSociales.removeAt(index);
  void insertAtIndexInLinkRedesSociales(int index, String item) =>
      linkRedesSociales.insert(index, item);
  void updateLinkRedesSocialesAtIndex(int index, Function(String) updateFn) =>
      linkRedesSociales[index] = updateFn(linkRedesSociales[index]);

  String? urlLogo;

  List<String> listaHorario = [];
  void addToListaHorario(String item) => listaHorario.add(item);
  void removeFromListaHorario(String item) => listaHorario.remove(item);
  void removeAtIndexFromListaHorario(int index) => listaHorario.removeAt(index);
  void insertAtIndexInListaHorario(int index, String item) =>
      listaHorario.insert(index, item);
  void updateListaHorarioAtIndex(int index, Function(String) updateFn) =>
      listaHorario[index] = updateFn(listaHorario[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown_TipoNegocio widget.
  String? dropDownTipoNegocioValue;
  FormFieldController<String>? dropDownTipoNegocioValueController;
  // State field(s) for TextField_Descripcion widget.
  FocusNode? textFieldDescripcionFocusNode;
  TextEditingController? textFieldDescripcionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescripcionTextControllerValidator;
  // State field(s) for TextField_Direccion widget.
  FocusNode? textFieldDireccionFocusNode;
  TextEditingController? textFieldDireccionTextController;
  String? Function(BuildContext, String?)?
      textFieldDireccionTextControllerValidator;
  // State field(s) for ChoiceChips_Lunes widget.
  FormFieldController<List<String>>? choiceChipsLunesValueController;
  String? get choiceChipsLunesValue =>
      choiceChipsLunesValueController?.value?.firstOrNull;
  set choiceChipsLunesValue(String? val) =>
      choiceChipsLunesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Martes widget.
  FormFieldController<List<String>>? choiceChipsMartesValueController;
  String? get choiceChipsMartesValue =>
      choiceChipsMartesValueController?.value?.firstOrNull;
  set choiceChipsMartesValue(String? val) =>
      choiceChipsMartesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Miercoles widget.
  FormFieldController<List<String>>? choiceChipsMiercolesValueController;
  String? get choiceChipsMiercolesValue =>
      choiceChipsMiercolesValueController?.value?.firstOrNull;
  set choiceChipsMiercolesValue(String? val) =>
      choiceChipsMiercolesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Jueves widget.
  FormFieldController<List<String>>? choiceChipsJuevesValueController;
  String? get choiceChipsJuevesValue =>
      choiceChipsJuevesValueController?.value?.firstOrNull;
  set choiceChipsJuevesValue(String? val) =>
      choiceChipsJuevesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Viernes widget.
  FormFieldController<List<String>>? choiceChipsViernesValueController;
  String? get choiceChipsViernesValue =>
      choiceChipsViernesValueController?.value?.firstOrNull;
  set choiceChipsViernesValue(String? val) =>
      choiceChipsViernesValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Sabado widget.
  FormFieldController<List<String>>? choiceChipsSabadoValueController;
  String? get choiceChipsSabadoValue =>
      choiceChipsSabadoValueController?.value?.firstOrNull;
  set choiceChipsSabadoValue(String? val) =>
      choiceChipsSabadoValueController?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips_Domingo widget.
  FormFieldController<List<String>>? choiceChipsDomingoValueController;
  String? get choiceChipsDomingoValue =>
      choiceChipsDomingoValueController?.value?.firstOrNull;
  set choiceChipsDomingoValue(String? val) =>
      choiceChipsDomingoValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField_Telefono widget.
  FocusNode? textFieldTelefonoFocusNode;
  TextEditingController? textFieldTelefonoTextController;
  String? Function(BuildContext, String?)?
      textFieldTelefonoTextControllerValidator;
  // State field(s) for TextField_PaginaWeb widget.
  FocusNode? textFieldPaginaWebFocusNode;
  TextEditingController? textFieldPaginaWebTextController;
  String? Function(BuildContext, String?)?
      textFieldPaginaWebTextControllerValidator;
  Completer<List<CuentasNegociosAppRow>>? requestCompleter2;
  Completer<List<CuentasNegociosAppRow>>? requestCompleter1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    textFieldDescripcionFocusNode?.dispose();
    textFieldDescripcionTextController?.dispose();

    textFieldDireccionFocusNode?.dispose();
    textFieldDireccionTextController?.dispose();

    textFieldTelefonoFocusNode?.dispose();
    textFieldTelefonoTextController?.dispose();

    textFieldPaginaWebFocusNode?.dispose();
    textFieldPaginaWebTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
