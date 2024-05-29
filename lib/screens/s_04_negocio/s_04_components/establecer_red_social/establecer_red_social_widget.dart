import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'establecer_red_social_model.dart';
export 'establecer_red_social_model.dart';

class EstablecerRedSocialWidget extends StatefulWidget {
  const EstablecerRedSocialWidget({
    super.key,
    required this.redSocial,
    required this.idNegocio,
    required this.indice,
    required this.listaRedesSociales,
  });

  final String? redSocial;
  final String? idNegocio;
  final int? indice;
  final List<String>? listaRedesSociales;

  @override
  State<EstablecerRedSocialWidget> createState() =>
      _EstablecerRedSocialWidgetState();
}

class _EstablecerRedSocialWidgetState extends State<EstablecerRedSocialWidget> {
  late EstablecerRedSocialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstablecerRedSocialModel());

    _model.textFieldDescripcionTextController ??= TextEditingController(
        text: (widget.listaRedesSociales?[widget.indice!]) != 'SinEstablecer'
            ? (widget.listaRedesSociales?[widget.indice!])
            : '');
    _model.textFieldDescripcionFocusNode ??= FocusNode();
    _model.textFieldDescripcionFocusNode!.addListener(
      () async {
        _model.cambiosRealizados = true;
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: valueOrDefault<double>(
        MediaQuery.sizeOf(context).width * 0.87834,
        361.0,
      ),
      height: valueOrDefault<double>(
        MediaQuery.sizeOf(context).height * 0.34895,
        335.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.060827,
              25.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.06082,
              15.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.060827,
              25.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.06082,
              15.0,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.cambiosRealizados == false) {
                      Navigator.pop(context);
                      return;
                    } else {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('CAMBIOS NO GUARDADOS'),
                                content: const Text(
                                    'Has realizado cambios que no has guardado. ¿Estás seguro de que quieres salir?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        Navigator.pop(context);
                        return;
                      } else {
                        return;
                      }
                    }
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: MediaQuery.sizeOf(context).height * 0.03125,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.indice == 0)
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    color: FlutterFlowTheme.of(context).primary,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0260416,
                      25.0,
                    ),
                  ),
                if (widget.indice == 1)
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: FlutterFlowTheme.of(context).primary,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0260416,
                      25.0,
                    ),
                  ),
                if (widget.indice == 2)
                  FaIcon(
                    FontAwesomeIcons.tiktok,
                    color: FlutterFlowTheme.of(context).primary,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0260416,
                      25.0,
                    ),
                  ),
                if (widget.indice == 3)
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: FlutterFlowTheme.of(context).primary,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0260416,
                      25.0,
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.02433,
                        10.0,
                      ),
                      0.0,
                      0.0,
                      0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.redSocial,
                      'Desconocida',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02083,
                            20.0,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ].divide(SizedBox(
                  width: valueOrDefault<double>(
                MediaQuery.sizeOf(context).width * 0.012165,
                5.0,
              ))),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '850awvpw' /* Introduzca el enlace a su perf... */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.015625,
                      15.0,
                    ),
                    letterSpacing: 0.0,
                  ),
            ),
            TextFormField(
              controller: _model.textFieldDescripcionTextController,
              focusNode: _model.textFieldDescripcionFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textFieldDescripcionTextController',
                const Duration(milliseconds: 2000),
                () async {
                  _model.cambiosRealizados = true;
                },
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.015625,
                        15.0,
                      ),
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.015625,
                        15.0,
                      ),
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.015625,
                      15.0,
                    ),
                    letterSpacing: 0.0,
                  ),
              minLines: 1,
              keyboardType: TextInputType.url,
              validator: _model.textFieldDescripcionTextControllerValidator
                  .asValidator(context),
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.010416,
                      10.0,
                    ),
                    0.0,
                    0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: const AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: const AvisoEjecutandoWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));

                    _model.listaUrlRedesSociales =
                        widget.listaRedesSociales!.toList().cast<String>();
                    _model.updateListaUrlRedesSocialesAtIndex(
                      widget.indice!,
                      (_) => _model.textFieldDescripcionTextController.text,
                    );
                    await CuentasNegociosAppTable().update(
                      data: {
                        'redes_sociales': _model.listaUrlRedesSociales,
                      },
                      matchingRows: (rows) => rows.eq(
                        'id_cuenta',
                        widget.idNegocio,
                      ),
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'btjs2212' /* ESTABLECER */,
                  ),
                  options: FFButtonOptions(
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03645,
                      35.0,
                    ),
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.015625,
                            15.0,
                          ),
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(
              height: valueOrDefault<double>(
            MediaQuery.sizeOf(context).height * 0.0052083,
            5.0,
          ))),
        ),
      ),
    );
  }
}
