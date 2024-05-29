import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/screens/s_01_parte_inicial/s_01_components/cabecera_info_app_01/cabecera_info_app01_widget.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import 'restablecer_contrasena_widget.dart' show RestablecerContrasenaWidget;
import 'package:flutter/material.dart';

class RestablecerContrasenaModel
    extends FlutterFlowModel<RestablecerContrasenaWidget> {
  ///  Local state fields for this page.

  String? contrasena;

  String? repetir;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for cabecera_InfoApp_01 component.
  late CabeceraInfoApp01Model cabeceraInfoApp01Model;
  // State field(s) for TextField_Correo_R widget.
  FocusNode? textFieldCorreoRFocusNode;
  TextEditingController? textFieldCorreoRTextController;
  String? Function(BuildContext, String?)?
      textFieldCorreoRTextControllerValidator;
  String? _textFieldCorreoRTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vnavd1gd' /* Este campo es obligatorio */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'kwzb1qd6' /* El formato del correo no es vá... */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServiciosAppRow>? estadoServicioRestablecerContrasena;
  // Model for parteInferior_idiomaTema component.
  late ParteInferiorIdiomaTemaModel parteInferiorIdiomaTemaModel;

  @override
  void initState(BuildContext context) {
    cabeceraInfoApp01Model =
        createModel(context, () => CabeceraInfoApp01Model());
    textFieldCorreoRTextControllerValidator =
        _textFieldCorreoRTextControllerValidator;
    parteInferiorIdiomaTemaModel =
        createModel(context, () => ParteInferiorIdiomaTemaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cabeceraInfoApp01Model.dispose();
    textFieldCorreoRFocusNode?.dispose();
    textFieldCorreoRTextController?.dispose();

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
