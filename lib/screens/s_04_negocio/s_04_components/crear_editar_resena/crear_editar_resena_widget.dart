import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/flutter_assets/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'crear_editar_resena_model.dart';
export 'crear_editar_resena_model.dart';

class CrearEditarResenaWidget extends StatefulWidget {
  const CrearEditarResenaWidget({
    super.key,
    required this.nombreNegocio,
    required this.idNegocio,
    required this.idUsuario,
    double? valoracionUsuario,
    this.comentarioUsuario,
    required this.esEdiccionResena,
    this.idResena,
  }) : valoracionUsuario = valoracionUsuario ?? 0.0;

  final String? nombreNegocio;
  final String? idNegocio;
  final String? idUsuario;
  final double valoracionUsuario;
  final String? comentarioUsuario;
  final bool? esEdiccionResena;
  final String? idResena;

  @override
  State<CrearEditarResenaWidget> createState() =>
      _CrearEditarResenaWidgetState();
}

class _CrearEditarResenaWidgetState extends State<CrearEditarResenaWidget> {
  late CrearEditarResenaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearEditarResenaModel());

    _model.textController ??=
        TextEditingController(text: widget.comentarioUsuario);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
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
    context.watch<FFAppState>();

    return Container(
      width: valueOrDefault<double>(
        MediaQuery.sizeOf(context).width * 0.878345,
        361.0,
      ),
      height: valueOrDefault<double>(
        MediaQuery.sizeOf(context).height * 0.4375,
        420.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.0364963,
              15.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.010416,
              10.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.0364963,
              15.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.010416,
              10.0,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03125,
                      30.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.nombreNegocio,
                    'Desconocido',
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
              ],
            ),
            RatingBar.builder(
              onRatingUpdate: (newValue) =>
                  setState(() => _model.ratingBarValue = newValue),
              itemBuilder: (context, index) => Icon(
                Icons.star_rounded,
                color: FlutterFlowTheme.of(context).warning,
              ),
              direction: Axis.horizontal,
              initialRating: _model.ratingBarValue ??= widget.valoracionUsuario,
              unratedColor: FlutterFlowTheme.of(context).grisCustom,
              itemCount: 5,
              itemSize: 30.0,
              glowColor: FlutterFlowTheme.of(context).warning,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'n9352mj0' /* Cuéntanos más sobre tu experie... */,
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
              ],
            ),
            TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                const Duration(milliseconds: 2000),
                () async {
                  _model.cambiosRealizados = true;
                },
              ),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0125,
                        12.0,
                      ),
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0125,
                        12.0,
                      ),
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0125,
                      12.0,
                    ),
                    letterSpacing: 0.0,
                  ),
              maxLines: 10,
              maxLength: 500,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              cursorColor: FlutterFlowTheme.of(context).primary,
              validator: _model.textControllerValidator.asValidator(context),
            ),
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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

                    _model.datosNegocio =
                        await CuentasNegociosAppTable().queryRows(
                      queryFn: (q) => q.eq(
                        'id_cuenta',
                        widget.idNegocio,
                      ),
                    );
                    if (widget.esEdiccionResena!) {
                      await Future.wait([
                        Future(() async {
                          _model.datosActualizadosResena =
                              await CuentasNegociosAppTable().update(
                            data: {
                              'cant_reseñas': functions.actualizarNumResenas(
                                  _model.datosNegocio!.first.cantResenas,
                                  false),
                              'valoracion_media': functions.autoCalculoResenas(
                                  _model.datosNegocio!.first.valoracionMedia,
                                  _model.datosNegocio!.first.cantResenas,
                                  widget.valoracionUsuario,
                                  false),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id_cuenta',
                              widget.idNegocio,
                            ),
                            returnRows: true,
                          );
                          await CuentasNegociosAppTable().update(
                            data: {
                              'cant_reseñas': functions.actualizarNumResenas(
                                  _model.datosActualizadosResena!.first
                                      .cantResenas,
                                  true),
                              'valoracion_media': functions.autoCalculoResenas(
                                  _model.datosActualizadosResena!.first
                                      .valoracionMedia,
                                  _model.datosActualizadosResena!.first
                                      .cantResenas,
                                  _model.ratingBarValue!,
                                  true),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id_cuenta',
                              widget.idNegocio,
                            ),
                          );
                        }),
                        Future(() async {
                          await ReseasNegociosTable().update(
                            data: {
                              'puntuacion': _model.ratingBarValue,
                              'comentario': _model.textController.text,
                              'fecha_edicion':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id_reseña',
                              widget.idResena,
                            ),
                          );
                        }),
                      ]);
                    } else {
                      await Future.wait([
                        Future(() async {
                          await ReseasNegociosTable().insert({
                            'id_negocio': widget.idNegocio,
                            'puntuacion': _model.ratingBarValue,
                            'comentario': _model.textController.text,
                            'id_usuario': FFAppState().idUsuarioLogado,
                            'fecha_publicacion':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                          });
                        }),
                        Future(() async {
                          _model.datosUsuario =
                              await CuentasUsuariosAppTable().queryRows(
                            queryFn: (q) => q.eq(
                              'id_usuario',
                              widget.idUsuario,
                            ),
                          );
                          await CuentasUsuariosAppTable().update(
                            data: {
                              'cant_reseñas': functions.actualizarNumResenas(
                                  _model.datosUsuario!.first.cantResenas!,
                                  true),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id_usuario',
                              widget.idUsuario,
                            ),
                          );
                        }),
                        Future(() async {
                          await CuentasNegociosAppTable().update(
                            data: {
                              'cant_reseñas': functions.actualizarNumResenas(
                                  _model.datosNegocio!.first.cantResenas, true),
                              'valoracion_media': functions.autoCalculoResenas(
                                  _model.datosNegocio!.first.valoracionMedia,
                                  _model.datosNegocio!.first.cantResenas,
                                  _model.ratingBarValue!,
                                  true),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id_cuenta',
                              widget.idNegocio,
                            ),
                          );
                        }),
                      ]);
                    }

                    Navigator.pop(context);
                    Navigator.pop(context);

                    setState(() {});
                  },
                  text: valueOrDefault<String>(
                    widget.esEdiccionResena!
                        ? 'Editar reseña'
                        : 'Publicar reseña',
                    'Publicar reseña',
                  ),
                  options: FFButtonOptions(
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0364583,
                      35.0,
                    ),
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.015625,
                            15.0,
                          ),
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
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
