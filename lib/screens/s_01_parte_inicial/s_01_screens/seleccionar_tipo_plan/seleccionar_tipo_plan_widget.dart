import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'seleccionar_tipo_plan_model.dart';
export 'seleccionar_tipo_plan_model.dart';

class SeleccionarTipoPlanWidget extends StatefulWidget {
  const SeleccionarTipoPlanWidget({super.key});

  @override
  State<SeleccionarTipoPlanWidget> createState() =>
      _SeleccionarTipoPlanWidgetState();
}

class _SeleccionarTipoPlanWidgetState extends State<SeleccionarTipoPlanWidget> {
  late SeleccionarTipoPlanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarTipoPlanModel());

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

      _model.datosUsuarioLogado = await DatosUsuariosAppTable().queryRows(
        queryFn: (q) => q.eq(
          'id_usuario',
          FFAppState().idUsuarioLogado,
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
          title: 'SeleccionarPlan',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.052083,
                          50.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.0260416,
                          25.0,
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.cabeceraInfoApp02Model,
                          updateCallback: () => setState(() {}),
                          child: const CabeceraInfoApp02Widget(),
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.010416,
                                        10.0,
                                      )),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'y5ykrbql' /* Elige un plan que funcione par... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.015625,
                                            15.0,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.010416,
                                        10.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's7k5zsxm' /* PAGO MENSUAL */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.0125,
                                                12.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Container(
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.0364583,
                                          35.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Switch.adaptive(
                                              value: _model.switchValue ??=
                                                  _model.pagoAnual!,
                                              onChanged: (newValue) async {
                                                setState(() => _model
                                                    .switchValue = newValue);
                                                if (newValue) {
                                                  setState(() {
                                                    _model.pagoAnual = true;
                                                  });
                                                } else {
                                                  setState(() {
                                                    _model.pagoAnual = false;
                                                  });
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tslbqkcv' /* PAGO ANUAL */,
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
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'jhn5j35n' /* (AHORRAS UN 20%) */,
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
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.02433)),
                                  ),
                                ),
                                FutureBuilder<List<TipoSuscripcionRow>>(
                                  future: TipoSuscripcionTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'es_publica',
                                      true,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 75.0,
                                          height: 75.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<TipoSuscripcionRow>
                                        listViewTipoSuscripcionRowList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewTipoSuscripcionRowList.length,
                                      separatorBuilder: (_, __) => SizedBox(
                                          height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.010416,
                                        10.0,
                                      )),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewTipoSuscripcionRow =
                                            listViewTipoSuscripcionRowList[
                                                listViewIndex];
                                        return Container(
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.166,
                                            160.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: colorFromCssString(
                                              listViewTipoSuscripcionRow
                                                  .refColorFondo!,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.036496,
                                                      15.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.010416,
                                                      10.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.036496,
                                                      15.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.010416,
                                                      10.0,
                                                    )),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewTipoSuscripcionRow
                                                      .nombre,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            colorFromCssString(
                                                          listViewTipoSuscripcionRow
                                                              .refColorCabecera!,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                        ),
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.02083,
                                                          20.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${valueOrDefault<String>(
                                                              _model.pagoAnual!
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      listViewTipoSuscripcionRow
                                                                          .costeAnual
                                                                          .toString(),
                                                                      '0',
                                                                    )
                                                                  : valueOrDefault<
                                                                      String>(
                                                                      listViewTipoSuscripcionRow
                                                                          .costeMensual
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                              '0',
                                                            )} €',
                                                            '0 €',
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
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02083,
                                                                  20.0,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            valueOrDefault<String>(
                                                              _model.pagoAnual!
                                                                  ? '/ año'
                                                                  : '/ mes',
                                                              '/ mes',
                                                            ),
                                                            '/ mes',
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
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.015625,
                                                                  15.0,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: valueOrDefault<
                                                              double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.012165,
                                                        5.0,
                                                      ))),
                                                    ),
                                                    Text(
                                                      '${listViewTipoSuscripcionRow.maxUsuarios > 0 ? '${listViewTipoSuscripcionRow.maxUsuarios.toString()}${valueOrDefault<String>(
                                                          listViewTipoSuscripcionRow
                                                                      .maxUsuarios >
                                                                  1
                                                              ? ' usuarios'
                                                              : ' usuario',
                                                          '1 usuario',
                                                        )}' : ''}${(listViewTipoSuscripcionRow.maxUsuarios > 0) && (listViewTipoSuscripcionRow.maxNegocios > 0) ? ' / ' : ''}${listViewTipoSuscripcionRow.maxNegocios > 0 ? '${listViewTipoSuscripcionRow.maxNegocios.toString()}${valueOrDefault<String>(
                                                          listViewTipoSuscripcionRow
                                                                      .maxNegocios >
                                                                  1
                                                              ? ' negocios'
                                                              : ' negocio',
                                                          '1 usuario',
                                                        )}' : ''}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.015625,
                                                              15.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewTipoSuscripcionRow
                                                          .descripcion,
                                                      'Pendiente',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.015625,
                                                            15.0,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0,
                                                          0.0,
                                                          0.0,
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0052093,
                                                            5.0,
                                                          )),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cv6139nc' /* Características
que incluye */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color:
                                                                      colorFromCssString(
                                                                    listViewTipoSuscripcionRow
                                                                        .refColorCabecera!,
                                                                    defaultColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                  ),
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0125,
                                                                    12.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                      Builder(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        const AvisoEjecutandoWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            await DatosUsuariosAppTable()
                                                                .update(
                                                              data: {
                                                                'id_tipo_suscripcion':
                                                                    valueOrDefault<
                                                                        int>(
                                                                  listViewTipoSuscripcionRow
                                                                      .idTipoSuscripcion,
                                                                  1,
                                                                ),
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id_usuario',
                                                                FFAppState()
                                                                    .idUsuarioLogado,
                                                              ),
                                                            );
                                                            Navigator.pop(
                                                                context);

                                                            context.goNamed(
                                                                'seleccionarCuenta');
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'j8lsmhxl' /* CONTINUAR */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.03645,
                                                              35.0,
                                                            ),
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                colorFromCssString(
                                                              listViewTipoSuscripcionRow
                                                                  .refColorBoton!,
                                                              defaultColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color:
                                                                          colorFromCssString(
                                                                        listViewTipoSuscripcionRow
                                                                            .refColorTextoBoton!,
                                                                        defaultColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.015625,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(
                                                  height:
                                                      valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.0052083,
                                                5.0,
                                              ))),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
