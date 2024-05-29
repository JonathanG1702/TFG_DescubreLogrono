import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_01_parte_inicial/s_01_components/elegir_idioma/elegir_idioma_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'parte_inferior_idioma_tema_model.dart';
export 'parte_inferior_idioma_tema_model.dart';

class ParteInferiorIdiomaTemaWidget extends StatefulWidget {
  const ParteInferiorIdiomaTemaWidget({super.key});

  @override
  State<ParteInferiorIdiomaTemaWidget> createState() =>
      _ParteInferiorIdiomaTemaWidgetState();
}

class _ParteInferiorIdiomaTemaWidgetState
    extends State<ParteInferiorIdiomaTemaWidget> {
  late ParteInferiorIdiomaTemaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParteInferiorIdiomaTemaModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width * 0.120,
            50.0,
          ),
          0.0,
          valueOrDefault<double>(
            MediaQuery.sizeOf(context).width * 0.120,
            50.0,
          ),
          0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(
            builder: (context) => FFButtonWidget(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: const ElegirIdiomaWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              text: valueOrDefault<String>(
                FFLocalizations.of(context).getVariableText(
                  esText: 'ES',
                  enText: 'EN',
                ),
                'ES',
              ),
              icon: Icon(
                Icons.language_sharp,
                color: FlutterFlowTheme.of(context).secondary,
                size: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.026,
                  25.0,
                ),
              ),
              options: FFButtonOptions(
                height: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.0365,
                  35.0,
                ),
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondary,
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!FFAppState().DarkMode)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setDarkModeSetting(
                      context,
                      !FFAppState().DarkMode ? ThemeMode.dark : ThemeMode.light,
                    );
                    setState(() {
                      FFAppState().DarkMode = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).grisClaro2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(0.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.0121,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.0052,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.0121,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.0052,
                            5.0,
                          )),
                      child: Icon(
                        Icons.light_mode,
                        color: FlutterFlowTheme.of(context).primary,
                        size: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.026,
                          25.0,
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().DarkMode)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setDarkModeSetting(
                      context,
                      !FFAppState().DarkMode ? ThemeMode.dark : ThemeMode.light,
                    );
                    setState(() {
                      FFAppState().DarkMode = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).grisClaro2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(0.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.0121,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.0052,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.0121,
                            5.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.0052,
                            5.0,
                          )),
                      child: Icon(
                        Icons.dark_mode,
                        color: FlutterFlowTheme.of(context).primary,
                        size: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.026,
                          25.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
