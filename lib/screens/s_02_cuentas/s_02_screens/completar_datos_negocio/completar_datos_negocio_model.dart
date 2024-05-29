import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/form_field_controller.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'completar_datos_negocio_widget.dart' show CompletarDatosNegocioWidget;
import 'package:flutter/material.dart';

class CompletarDatosNegocioModel
    extends FlutterFlowModel<CompletarDatosNegocioWidget> {
  ///  Local state fields for this page.

  int? cantCuentasNegocio = 0;

  int? cantMaxCuentasNegocio = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey4 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosNegocio widget.
  List<CuentasNegociosAppRow>? cuentasNegocio;
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosNegocio widget.
  List<DatosUsuariosAppRow>? datosUsuarioBd;
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosNegocio widget.
  List<TipoSuscripcionRow>? infoSuscripcionUsuario;
  // Model for parteInferior_idiomaTema component.
  late ParteInferiorIdiomaTemaModel parteInferiorIdiomaTemaModel;
  // Model for cabecera_InfoApp_02 component.
  late CabeceraInfoApp02Model cabeceraInfoApp02Model;
  // State field(s) for TextField_NombreUsuario widget.
  FocusNode? textFieldNombreUsuarioFocusNode;
  TextEditingController? textFieldNombreUsuarioTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreUsuarioTextControllerValidator;
  String? _textFieldNombreUsuarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nqf48m0x' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField_DNI widget.
  FocusNode? textFieldDNIFocusNode;
  TextEditingController? textFieldDNITextController;
  String? Function(BuildContext, String?)? textFieldDNITextControllerValidator;
  String? _textFieldDNITextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fyu0qgsi' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for TextField_Pasaporte widget.
  FocusNode? textFieldPasaporteFocusNode;
  TextEditingController? textFieldPasaporteTextController;
  String? Function(BuildContext, String?)?
      textFieldPasaporteTextControllerValidator;
  String? _textFieldPasaporteTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pcrah5x7' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for TextField_NombreNegocio widget.
  FocusNode? textFieldNombreNegocioFocusNode;
  TextEditingController? textFieldNombreNegocioTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreNegocioTextControllerValidator;
  String? _textFieldNombreNegocioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yug3wav8' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    parteInferiorIdiomaTemaModel =
        createModel(context, () => ParteInferiorIdiomaTemaModel());
    cabeceraInfoApp02Model =
        createModel(context, () => CabeceraInfoApp02Model());
    textFieldNombreUsuarioTextControllerValidator =
        _textFieldNombreUsuarioTextControllerValidator;
    textFieldDNITextControllerValidator = _textFieldDNITextControllerValidator;
    textFieldPasaporteTextControllerValidator =
        _textFieldPasaporteTextControllerValidator;
    textFieldNombreNegocioTextControllerValidator =
        _textFieldNombreNegocioTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    parteInferiorIdiomaTemaModel.dispose();
    cabeceraInfoApp02Model.dispose();
    textFieldNombreUsuarioFocusNode?.dispose();
    textFieldNombreUsuarioTextController?.dispose();

    textFieldDNIFocusNode?.dispose();
    textFieldDNITextController?.dispose();

    textFieldPasaporteFocusNode?.dispose();
    textFieldPasaporteTextController?.dispose();

    textFieldNombreNegocioFocusNode?.dispose();
    textFieldNombreNegocioTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
