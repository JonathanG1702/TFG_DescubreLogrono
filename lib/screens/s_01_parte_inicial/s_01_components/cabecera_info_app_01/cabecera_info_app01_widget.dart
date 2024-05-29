import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'cabecera_info_app01_model.dart';
export 'cabecera_info_app01_model.dart';

class CabeceraInfoApp01Widget extends StatefulWidget {
  const CabeceraInfoApp01Widget({super.key});

  @override
  State<CabeceraInfoApp01Widget> createState() =>
      _CabeceraInfoApp01WidgetState();
}

class _CabeceraInfoApp01WidgetState extends State<CabeceraInfoApp01Widget> {
  late CabeceraInfoApp01Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabeceraInfoApp01Model());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.05,
                        50.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.025,
                        25.0,
                      )),
                  child: Container(
                    width: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.4475,
                      184.0,
                    ),
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.0573,
                      55.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).grisClaro2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Container(
                      width: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.4475,
                        184.0,
                      ),
                      height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0573,
                        55.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.05,
                              20.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.0052,
                              5.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.06,
                              25.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.0052,
                              5.0,
                            )),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                FFAppState().tipoVersion,
                                'DESCONOCIDO',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.018,
                                      17.0,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'kes4qz5o' /* V. */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.018,
                                          17.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    FFAppState().version,
                                    '1.00.01',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.018,
                                          17.0,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ].divide(SizedBox(
                                  width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.02,
                                8.0,
                              ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
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
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.0155,
                            15.0,
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/logo_app_descubre_logrono.svg',
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.245,
                                  100.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.105,
                                  100.0,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'a056dj44' /* Descubre
Logroño */
                              ,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.0415,
                                    40.0,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ].divide(SizedBox(
                            width: valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.0485,
                          20.0,
                        ))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.02,
                            20.0,
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.web,
                                color: FlutterFlowTheme.of(context).primary,
                                size: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.025,
                                  25.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await launchURL('http://localhost:3000');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'e3sc0bn5' /* PAGINA WEB */,
                                  ),
                                  options: FFButtonOptions(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.026,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.0155,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(
                                width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.025,
                              10.0,
                            ))),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL('https://twitter.com/');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.025,
                                    25.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL('https://www.instagram.com/');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.025,
                                    25.0,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL('https://www.youtube.com/');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height * 0.025,
                                    25.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(
                                width: valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.0245,
                              10.0,
                            ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
