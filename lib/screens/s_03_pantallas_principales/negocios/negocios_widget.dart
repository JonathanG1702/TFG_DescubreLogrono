import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/flutter_assets/flutter_flow_choice_chips.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'negocios_model.dart';
export 'negocios_model.dart';

class NegociosWidget extends StatefulWidget {
  const NegociosWidget({super.key});

  @override
  State<NegociosWidget> createState() => _NegociosWidgetState();
}

class _NegociosWidgetState extends State<NegociosWidget> {
  late NegociosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NegociosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: const AvisoCargandoWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      _model.tiposNegocio = await TiposNegociosTable().queryRows(
        queryFn: (q) => q.eq(
          'activo',
          true,
        ),
      );
      Navigator.pop(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'Buscar',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.026041,
                        25.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.052083,
                        50.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.026041,
                        25.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.078125,
                        75.0,
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  '11wr3chc' /* Bar */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'ujwh1eac' /* Restaurante */,
                                ))
                              ],
                              onChanged: (val) => setState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 0.0,
                                elevation: 3.0,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 0.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              chipSpacing: 10.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  FFLocalizations.of(context).getText(
                                    'wyfdz1s1' /* Bar */,
                                  )
                                ],
                              ),
                              wrapped: false,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder<List<CuentasNegociosAppRow>>(
                          future: CuentasNegociosAppTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'tipo_negocio',
                                  valueOrDefault<String>(
                                    _model.choiceChipsValue,
                                    'Bar',
                                  ),
                                )
                                .eq(
                                  'estaOculto',
                                  false,
                                )
                                .order('valoracion_media'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 100.0,
                                  height: 100.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<CuentasNegociosAppRow>
                                gridViewCuentasNegociosAppRowList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  gridViewCuentasNegociosAppRowList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewCuentasNegociosAppRow =
                                    gridViewCuentasNegociosAppRowList[
                                        gridViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'perfil_negocio',
                                      queryParameters: {
                                        'idNegocio': serializeParam(
                                          gridViewCuentasNegociosAppRow
                                              .idCuenta,
                                          ParamType.String,
                                        ),
                                        'volverAtras': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                        'estaVisualizando': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                        'indiceTabBar': serializeParam(
                                          0,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                gridViewCuentasNegociosAppRow
                                                    .urlLogo,
                                                'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_negocio_base.png?t=2024-05-20T14%3A51%3A20.580Z',
                                              ),
                                              width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.2433,
                                                100.0,
                                              ),
                                              height: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.10416,
                                                100.0,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.0121,
                                                      5.0,
                                                    ),
                                                    0.0,
                                                    0.0,
                                                    0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                FutureBuilder<
                                                    List<
                                                        MarcadoresNegociosUsuarioRow>>(
                                                  future:
                                                      MarcadoresNegociosUsuarioTable()
                                                          .querySingleRow(
                                                    queryFn: (q) => q.eq(
                                                      'id_usuario',
                                                      FFAppState()
                                                          .idUsuarioLogado,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<MarcadoresNegociosUsuarioRow>
                                                        rowMarcadoresNegociosUsuarioRowList =
                                                        snapshot.data!;
                                                    final rowMarcadoresNegociosUsuarioRow =
                                                        rowMarcadoresNegociosUsuarioRowList
                                                                .isNotEmpty
                                                            ? rowMarcadoresNegociosUsuarioRowList
                                                                .first
                                                            : null;
                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        if (valueOrDefault<
                                                            bool>(
                                                          rowMarcadoresNegociosUsuarioRow
                                                                  ?.idNegociosGuardados
                                                                  .contains(
                                                                      gridViewCuentasNegociosAppRow
                                                                          .idCuenta) ==
                                                              false,
                                                          true,
                                                        ))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.004866,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.002083,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.004866,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.002083,
                                                                        2.0,
                                                                      )),
                                                              child: Icon(
                                                                Icons
                                                                    .bookmark_border,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.0260416,
                                                                  25.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if (rowMarcadoresNegociosUsuarioRow
                                                                ?.idNegociosGuardados
                                                                .contains(
                                                                    gridViewCuentasNegociosAppRow
                                                                        .idCuenta) ==
                                                            true)
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.004866,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.002083,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.004866,
                                                                        2.0,
                                                                      ),
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.002083,
                                                                        2.0,
                                                                      )),
                                                              child: Icon(
                                                                Icons
                                                                    .bookmark_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.0260416,
                                                                  25.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                gridViewCuentasNegociosAppRow
                                                                    .valoracionMedia
                                                                    .toString(),
                                                                '0.0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        valueOrDefault<
                                                                            double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.015625,
                                                                      15.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              size: 20.0,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width:
                                                                  valueOrDefault<
                                                                      double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.012165,
                                                            5.0,
                                                          ))),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(
                                                  height:
                                                      valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.04166,
                                                40.0,
                                              ))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              gridViewCuentasNegociosAppRow
                                                  .nombre,
                                              'Desconocido',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.0125,
                                                    12.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(
                        height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.010416,
                      10.0,
                    ))),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
