import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'elegir_idioma_model.dart';
export 'elegir_idioma_model.dart';

class ElegirIdiomaWidget extends StatefulWidget {
  const ElegirIdiomaWidget({super.key});

  @override
  State<ElegirIdiomaWidget> createState() => _ElegirIdiomaWidgetState();
}

class _ElegirIdiomaWidgetState extends State<ElegirIdiomaWidget> {
  late ElegirIdiomaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ElegirIdiomaModel());

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
        MediaQuery.sizeOf(context).width * 0.462287,
        190.0,
      ),
      height: 170.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).grisClaro2,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.0365,
              15.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.0104,
              10.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.0365,
              15.0,
            ),
            10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'iv0rdplb' /* IDIOMA */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.0208,
                          20.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.03125,
                      30.0,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).primary,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.0052,
                    5.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    MediaQuery.sizeOf(context).height * 0.010416,
                    10.0,
                  )),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setAppLanguage(context, 'es');
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.0243,
                          10.0,
                        ),
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.0052083,
                          5.0,
                        ),
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.0243,
                          10.0,
                        ),
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.0052083,
                          5.0,
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'qfbuxwzi' /* Español */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                fontSize: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.015625,
                                  15.0,
                                ),
                                letterSpacing: 0.0,
                              ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.asset(
                            'assets/images/bandera_espana.png',
                            width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.060827,
                              25.0,
                            ),
                            height: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.026041,
                              25.0,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setAppLanguage(context, 'en');
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.0243,
                        10.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0052083,
                        5.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.0243,
                        10.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0052083,
                        5.0,
                      )),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '9abfc72g' /* Inglés */,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/bandera_reino_unido.png',
                          width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.060827,
                            25.0,
                          ),
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.026041,
                            25.0,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
