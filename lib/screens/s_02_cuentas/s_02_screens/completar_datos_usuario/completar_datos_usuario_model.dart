import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'completar_datos_usuario_widget.dart' show CompletarDatosUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompletarDatosUsuarioModel
    extends FlutterFlowModel<CompletarDatosUsuarioWidget> {
  ///  Local state fields for this page.

  int? cantCuentasUsuario = 0;

  int? cantMaxCuentasUsuario = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosUsuario widget.
  List<CuentasUsuariosAppRow>? cuentasUsuario;
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosUsuario widget.
  List<DatosUsuariosAppRow>? datosUsuarioBd;
  // Stores action output result for [Backend Call - Query Rows] action in completarDatosUsuario widget.
  List<TipoSuscripcionRow>? infoSuscripcionUsuario;
  // Model for parteInferior_idiomaTema component.
  late ParteInferiorIdiomaTemaModel parteInferiorIdiomaTemaModel;
  // Model for cabecera_InfoApp_02 component.
  late CabeceraInfoApp02Model cabeceraInfoApp02Model;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for TextField_Telefono widget.
  FocusNode? textFieldTelefonoFocusNode;
  TextEditingController? textFieldTelefonoTextController;
  final textFieldTelefonoMask =
      MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      textFieldTelefonoTextControllerValidator;
  String? _textFieldTelefonoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p7n556bp' /* Este campo es obligatorio */,
      );
    }

    return null;
  }

  // State field(s) for TextField_NombreUsuario widget.
  FocusNode? textFieldNombreUsuarioFocusNode;
  TextEditingController? textFieldNombreUsuarioTextController;
  String? Function(BuildContext, String?)?
      textFieldNombreUsuarioTextControllerValidator;
  String? _textFieldNombreUsuarioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dgnlh264' /* Este campo es obligatorio */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'smuia2e9' /* El mínimo de caracteres es de ... */,
      );
    }
    if (val.length > 16) {
      return FFLocalizations.of(context).getText(
        'kzwxfj9c' /* El máximo de caracteres es de ... */,
      );
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '9ll7briv' /* El nombre de usuario no es vál... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasUsuariosAppRow>? nombresUsuariosCoinciden;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasUsuariosAppRow>? existeNombreUsuario;

  @override
  void initState(BuildContext context) {
    parteInferiorIdiomaTemaModel =
        createModel(context, () => ParteInferiorIdiomaTemaModel());
    cabeceraInfoApp02Model =
        createModel(context, () => CabeceraInfoApp02Model());
    textFieldTelefonoTextControllerValidator =
        _textFieldTelefonoTextControllerValidator;
    textFieldNombreUsuarioTextControllerValidator =
        _textFieldNombreUsuarioTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    parteInferiorIdiomaTemaModel.dispose();
    cabeceraInfoApp02Model.dispose();
    textFieldTelefonoFocusNode?.dispose();
    textFieldTelefonoTextController?.dispose();

    textFieldNombreUsuarioFocusNode?.dispose();
    textFieldNombreUsuarioTextController?.dispose();
  }
}
