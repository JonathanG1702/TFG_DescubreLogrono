import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/screens/s_01_parte_inicial/s_01_components/cabecera_info_app_01/cabecera_info_app01_widget.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import 'dart:async';
import 'iniciar_sesion_registrarse_widget.dart'
    show IniciarSesionRegistrarseWidget;
import 'package:flutter/material.dart';

class IniciarSesionRegistrarseModel
    extends FlutterFlowModel<IniciarSesionRegistrarseWidget> {
  ///  Local state fields for this page.

  int? numRandom;

  int? numLog;

  bool accionEnEjecucion = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in iniciarSesion_Registrarse widget.
  List<InfoAppRow>? infoApp;
  // Model for cabecera_InfoApp_01 component.
  late CabeceraInfoApp01Model cabeceraInfoApp01Model;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField_Correo_L widget.
  FocusNode? textFieldCorreoLFocusNode;
  TextEditingController? textFieldCorreoLTextController;
  String? Function(BuildContext, String?)?
      textFieldCorreoLTextControllerValidator;
  String? _textFieldCorreoLTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8xhqh1vv' /* Este campo es obligatorio */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'jmmjqa8a' /* El formato del correo no es vá... */,
      );
    }
    return null;
  }

  // State field(s) for TextField_Contrasena_L widget.
  FocusNode? textFieldContrasenaLFocusNode;
  TextEditingController? textFieldContrasenaLTextController;
  late bool textFieldContrasenaLVisibility;
  String? Function(BuildContext, String?)?
      textFieldContrasenaLTextControllerValidator;
  String? _textFieldContrasenaLTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nffoncqq' /* Este campo es obligatorio */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        '7lyqlfnu' /* Debe de contener al menos 10 c... */,
      );
    }

    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).*$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '4ohlunxb' /* El formato no cumple con requi... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiciosAppRow>? sIniciarSesion;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<LogsIniciosSesionRow>? logBD1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DatosUsuariosAppRow>? datosUsuarioBD1;
  // State field(s) for TextField_Correo_R widget.
  FocusNode? textFieldCorreoRFocusNode;
  TextEditingController? textFieldCorreoRTextController;
  String? Function(BuildContext, String?)?
      textFieldCorreoRTextControllerValidator;
  String? _textFieldCorreoRTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'r44259ej' /* Este campo es obligatorio */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '19r9l1u6' /* El formato del correo no es vá... */,
      );
    }
    return null;
  }

  // State field(s) for TextField_Contrasena_R widget.
  FocusNode? textFieldContrasenaRFocusNode;
  TextEditingController? textFieldContrasenaRTextController;
  late bool textFieldContrasenaRVisibility;
  String? Function(BuildContext, String?)?
      textFieldContrasenaRTextControllerValidator;
  String? _textFieldContrasenaRTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vssi6hk7' /* Este campo es obligatorio */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        '1nlheqv0' /* Debe de contener al menos 10 c... */,
      );
    }

    if (!RegExp(
            '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_])[A-Za-z\\d\\W_]{10,}\$/')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bphe76kg' /* El formato no cumple con requi... */,
      );
    }
    return null;
  }

  // State field(s) for TextField_RepetirContrasena_R widget.
  FocusNode? textFieldRepetirContrasenaRFocusNode;
  TextEditingController? textFieldRepetirContrasenaRTextController;
  late bool textFieldRepetirContrasenaRVisibility;
  String? Function(BuildContext, String?)?
      textFieldRepetirContrasenaRTextControllerValidator;
  String? _textFieldRepetirContrasenaRTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7krkat3q' /* Este campo es obligatorio */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'ju3c2yze' /* Debe de contener al menos 10 c... */,
      );
    }

    if (!RegExp(
            '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_])[A-Za-z\\d\\W_]{10,}\$/')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '364d1rcc' /* El formato no cumple con requi... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiciosAppRow>? sRegistrarse;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<LogsRegistrosUsuariosRow>? logBD2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DatosUsuariosAppRow>? datosUsuarioBD2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<DatosUsuariosAppRow>? datosUsuarioBD3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiciosAppRow>? estadoServicioRegistrarseGoogle;
  // Model for parteInferior_idiomaTema component.
  late ParteInferiorIdiomaTemaModel parteInferiorIdiomaTemaModel;

  @override
  void initState(BuildContext context) {
    cabeceraInfoApp01Model =
        createModel(context, () => CabeceraInfoApp01Model());
    textFieldCorreoLTextControllerValidator =
        _textFieldCorreoLTextControllerValidator;
    textFieldContrasenaLVisibility = false;
    textFieldContrasenaLTextControllerValidator =
        _textFieldContrasenaLTextControllerValidator;
    textFieldCorreoRTextControllerValidator =
        _textFieldCorreoRTextControllerValidator;
    textFieldContrasenaRVisibility = false;
    textFieldContrasenaRTextControllerValidator =
        _textFieldContrasenaRTextControllerValidator;
    textFieldRepetirContrasenaRVisibility = false;
    textFieldRepetirContrasenaRTextControllerValidator =
        _textFieldRepetirContrasenaRTextControllerValidator;
    parteInferiorIdiomaTemaModel =
        createModel(context, () => ParteInferiorIdiomaTemaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cabeceraInfoApp01Model.dispose();
    tabBarController?.dispose();
    textFieldCorreoLFocusNode?.dispose();
    textFieldCorreoLTextController?.dispose();

    textFieldContrasenaLFocusNode?.dispose();
    textFieldContrasenaLTextController?.dispose();

    textFieldCorreoRFocusNode?.dispose();
    textFieldCorreoRTextController?.dispose();

    textFieldContrasenaRFocusNode?.dispose();
    textFieldContrasenaRTextController?.dispose();

    textFieldRepetirContrasenaRFocusNode?.dispose();
    textFieldRepetirContrasenaRTextController?.dispose();

    parteInferiorIdiomaTemaModel.dispose();
  }

  /// Action blocks.
  Future sIniciarSesionRegistrarseCambiarContrasena(
    BuildContext context, {
    required int? indiceServicioBuscar,
  }) async {
    List<ServiciosAppRow>? serviciosApp;

    if ((indiceServicioBuscar! > 0) && (indiceServicioBuscar < 6)) {
      serviciosApp = await ServiciosAppTable().queryRows(
        queryFn: (q) => q.eq(
          'id_servicio',
          indiceServicioBuscar.toString(),
        ),
      );
      if (indiceServicioBuscar == 1) {
        FFAppState().SRegistrarse = valueOrDefault<String>(
          serviciosApp[0].estadoServicio,
          'Desconocido',
        );
        return;
      } else {
        if (indiceServicioBuscar == 2) {
          FFAppState().SRegistrarseGoogle = valueOrDefault<String>(
            serviciosApp[1].estadoServicio,
            'Desconocido',
          );
          return;
        } else {
          if (indiceServicioBuscar == 3) {
            FFAppState().SIniciarSesion = valueOrDefault<String>(
              serviciosApp[2].estadoServicio,
              'Desconocido',
            );
            return;
          } else {
            if (indiceServicioBuscar == 4) {
              FFAppState().SIniciarSesionGoogle = valueOrDefault<String>(
                serviciosApp[3].estadoServicio,
                'Desconocido',
              );
              return;
            } else {
              FFAppState().SRestablecerContrasena = valueOrDefault<String>(
                serviciosApp[4].estadoServicio,
                'Desconocido',
              );
              return;
            }
          }
        }
      }
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('ERROR INTERNO'),
            content: const Text(
                'Error al obtener el estado de los servicios de la pantalla de iniciar sesion/registrarse'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
      return;
    }
  }
}
