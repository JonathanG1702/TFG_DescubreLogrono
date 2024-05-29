import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import '/screens/s_02_cuentas/s_02_componentes/no_posee_cuenta_negocio/no_posee_cuenta_negocio_widget.dart';
import '/screens/s_02_cuentas/s_02_componentes/no_posee_cuenta_usuario/no_posee_cuenta_usuario_widget.dart';
import '/flutter_assets/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'seleccionar_cuenta_model.dart';
export 'seleccionar_cuenta_model.dart';

class SeleccionarCuentaWidget extends StatefulWidget {
  const SeleccionarCuentaWidget({super.key});

  @override
  State<SeleccionarCuentaWidget> createState() =>
      _SeleccionarCuentaWidgetState();
}

class _SeleccionarCuentaWidgetState extends State<SeleccionarCuentaWidget> {
  late SeleccionarCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarCuentaModel());

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

      await Future.wait([
        Future(() async {
          _model.cuentasUsuario = await CuentasUsuariosAppTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'id_usuario',
                  FFAppState().idUsuarioLogado,
                )
                .order('cuenta_verificada'),
          );
          _model.cantCuentasUsuario = valueOrDefault<int>(
            _model.cuentasUsuario?.length,
            0,
          );
        }),
        Future(() async {
          _model.cuentasNegocio = await CuentasNegociosAppTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'id_usuario_propietario',
                  FFAppState().idUsuarioLogado,
                )
                .order('id_cuenta'),
          );
          _model.cantCuentasNegocios = valueOrDefault<int>(
            _model.cuentasNegocio?.length,
            0,
          );
        }),
        Future(() async {
          _model.datosUsuarioBd = await DatosUsuariosAppTable().queryRows(
            queryFn: (q) => q.eq(
              'id_usuario',
              FFAppState().idUsuarioLogado,
            ),
          );
          _model.infoSuscripcionUsuario =
              await TipoSuscripcionTable().queryRows(
            queryFn: (q) => q.eq(
              'id_tipo_suscripcion',
              _model.datosUsuarioBd?.first.idTipoSuscripcion,
            ),
          );
          await Future.wait([
            Future(() async {
              _model.maxCuentasUsuario = valueOrDefault<int>(
                _model.infoSuscripcionUsuario?.first.maxUsuarios,
                0,
              );
            }),
            Future(() async {
              _model.maxCuentasNegocio = valueOrDefault<int>(
                _model.infoSuscripcionUsuario?.first.maxNegocios,
                0,
              );
            }),
          ]);
        }),
      ]);
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
          title: 'SeleccionarCuenta',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).secondary,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    0.0,
                                    0.0,
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.02,
                                      20.0,
                                    )),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'tr086vvw' /* Seleccione la cuenta a la que ... */,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .verdeCustom,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.03649,
                                            15.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.03649,
                                            15.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.015625,
                                            10.0,
                                          )),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.026041,
                                                  25.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hib4zf14' /* USUARIOS */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.015625,
                                                        15.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ].divide(SizedBox(
                                                width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.01216,
                                              5.0,
                                            ))),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '${valueOrDefault<String>(
                                                  _model.cantCuentasUsuario
                                                      ?.toString(),
                                                  '0',
                                                )} / ${valueOrDefault<String>(
                                                  _model.maxCuentasUsuario
                                                      ?.toString(),
                                                  '0',
                                                )}',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.015625,
                                                        15.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              if (_model.cantCuentasUsuario! <
                                                  valueOrDefault<int>(
                                                    _model
                                                        .infoSuscripcionUsuario
                                                        ?.first
                                                        .maxUsuarios,
                                                    1,
                                                  ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.02433,
                                                            10.0,
                                                          ),
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.goNamed(
                                                          'completarDatosUsuario');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'qfyaxxjl' /* CREAR */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.03125,
                                                        30.0,
                                                      ),
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
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
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                ),
                                              AlignedTooltip(
                                                content: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wmczsgij' /* Para poder crear un nuevo usua... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
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
                                                offset: 5.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 5.0,
                                                tailBaseWidth: 25.0,
                                                tailLength: 10.0,
                                                waitDuration:
                                                    const Duration(milliseconds: 100),
                                                showDuration: const Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: Visibility(
                                                  visible: _model
                                                          .cantCuentasUsuario! >=
                                                      _model.maxCuentasUsuario!,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.02433,
                                                                  10.0,
                                                                ),
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'seleccionar_TipoPlan');
                                                      },
                                                      child: Icon(
                                                        Icons.monetization_on,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.03125,
                                                          30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.2135416,
                                      205.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final datosCuentasUsuario = _model
                                                      .cuentasUsuario
                                                      ?.toList() ??
                                                  [];
                                              if (datosCuentasUsuario.isEmpty) {
                                                return const Center(
                                                  child:
                                                      NoPoseeCuentaUsuarioWidget(),
                                                );
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.010416,
                                                    10.0,
                                                  ),
                                                  0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.010416,
                                                    10.0,
                                                  ),
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    datosCuentasUsuario.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                        height: valueOrDefault<
                                                            double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.010416,
                                                  10.0,
                                                )),
                                                itemBuilder: (context,
                                                    datosCuentasUsuarioIndex) {
                                                  final datosCuentasUsuarioItem =
                                                      datosCuentasUsuario[
                                                          datosCuentasUsuarioIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .idCuentaLogada =
                                                          valueOrDefault<
                                                              String>(
                                                        datosCuentasUsuarioItem
                                                            .idCuenta,
                                                        'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_usuario_base.png',
                                                      );

                                                      context.goNamed('inicio');
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.036456,
                                                                  15.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.010416,
                                                                  10.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.036456,
                                                                  15.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.010416,
                                                                  10.0,
                                                                )),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0364583,
                                                                    35.0,
                                                                  ),
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0364583,
                                                                    35.0,
                                                                  ),
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      datosCuentasUsuarioItem
                                                                          .urlImagenUsuario,
                                                                      'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_usuario_base.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            datosCuentasUsuarioItem.nombreUsuario,
                                                                            'Desconocido',
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
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        if (datosCuentasUsuarioItem
                                                                            .cuentaVerificada)
                                                                          Icon(
                                                                            Icons.verified_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.026041,
                                                                              25.0,
                                                                            ),
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                          width: valueOrDefault<double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.036496,
                                                                        15.0,
                                                                      ))),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.036456,
                                                                15.0,
                                                              ))),
                                                            ),
                                                          ],
                                                        ),
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
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .rojoCustom,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.0364963,
                                            15.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.0364963,
                                            15.0,
                                          ),
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          )),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.0260416,
                                                  25.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yrt2wdlu' /* NEGOCIOS */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.015625,
                                                        15.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ].divide(SizedBox(
                                                width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.012165,
                                              5.0,
                                            ))),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '${valueOrDefault<String>(
                                                  _model.cantCuentasNegocios
                                                      ?.toString(),
                                                  '0',
                                                )} / ${valueOrDefault<String>(
                                                  _model.maxCuentasNegocio
                                                      ?.toString(),
                                                  '0',
                                                )}',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.015625,
                                                        15.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              if (_model.cantCuentasNegocios! <
                                                  valueOrDefault<int>(
                                                    _model.maxCuentasNegocio,
                                                    0,
                                                  ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.02433,
                                                            10.0,
                                                          ),
                                                          0.0,
                                                          0.0,
                                                          0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      context.goNamed(
                                                          'completarDatosNegocio');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'q6trun5d' /* CREAR */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.03125,
                                                        30.0,
                                                      ),
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
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
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                ),
                                              AlignedTooltip(
                                                content: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'otg2scw9' /* Para poder crear un nuevo nego... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
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
                                                offset: 5.0,
                                                preferredDirection:
                                                    AxisDirection.down,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 5.0,
                                                tailBaseWidth: 25.0,
                                                tailLength: 10.0,
                                                waitDuration:
                                                    const Duration(milliseconds: 100),
                                                showDuration: const Duration(
                                                    milliseconds: 1500),
                                                triggerMode:
                                                    TooltipTriggerMode.tap,
                                                child: Visibility(
                                                  visible: _model
                                                          .cantCuentasNegocios! >=
                                                      valueOrDefault<int>(
                                                        _model
                                                            .maxCuentasNegocio,
                                                        0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.02433,
                                                                  10.0,
                                                                ),
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'seleccionar_TipoPlan');
                                                      },
                                                      child: Icon(
                                                        Icons.monetization_on,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.03125,
                                                          30.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.3375,
                                      324.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final datosCuentasNegocio = _model
                                                      .cuentasNegocio
                                                      ?.toList() ??
                                                  [];
                                              if (datosCuentasNegocio.isEmpty) {
                                                return const NoPoseeCuentaNegocioWidget();
                                              }
                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.010416,
                                                    10.0,
                                                  ),
                                                  0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.010416,
                                                    10.0,
                                                  ),
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    datosCuentasNegocio.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(
                                                        height: valueOrDefault<
                                                            double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.010416,
                                                  10.0,
                                                )),
                                                itemBuilder: (context,
                                                    datosCuentasNegocioIndex) {
                                                  final datosCuentasNegocioItem =
                                                      datosCuentasNegocio[
                                                          datosCuentasNegocioIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                              .idCuentaNegocio =
                                                          datosCuentasNegocioItem
                                                              .idCuenta;

                                                      context.goNamed(
                                                        'perfil_negocio',
                                                        queryParameters: {
                                                          'idNegocio':
                                                              serializeParam(
                                                            datosCuentasNegocioItem
                                                                .idCuenta,
                                                            ParamType.String,
                                                          ),
                                                          'volverAtras':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                          'estaVisualizando':
                                                              serializeParam(
                                                            false,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.036496,
                                                                  15.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.010416,
                                                                  10.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.036496,
                                                                  15.0,
                                                                ),
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.010416,
                                                                  10.0,
                                                                )),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0364583,
                                                                    35.0,
                                                                  ),
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0364583,
                                                                    35.0,
                                                                  ),
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      datosCuentasNegocioItem
                                                                          .urlLogo,
                                                                      'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_negocio_base.png',
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            datosCuentasNegocioItem.nombre,
                                                                            'Desconocido',
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
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                          width: valueOrDefault<double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.02433,
                                                                        10.0,
                                                                      ))),
                                                                    ),
                                                                    if (datosCuentasNegocioItem.tipoNegocio !=
                                                                            null &&
                                                                        datosCuentasNegocioItem.tipoNegocio !=
                                                                            '')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.0052083,
                                                                              5.0,
                                                                            ),
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'd0mjuili' /* Tipo: */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.0125,
                                                                                      12.0,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              datosCuentasNegocioItem.tipoNegocio != null && datosCuentasNegocioItem.tipoNegocio != ''
                                                                                  ? valueOrDefault<String>(
                                                                                      datosCuentasNegocioItem.tipoNegocio,
                                                                                      'Desconocido',
                                                                                    )
                                                                                  : '',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.0125,
                                                                                      12.0,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.012165,
                                                                            5.0,
                                                                          ))),
                                                                        ),
                                                                      ),
                                                                    if (datosCuentasNegocioItem.ubicacion !=
                                                                            null &&
                                                                        datosCuentasNegocioItem.ubicacion !=
                                                                            '')
                                                                      Text(
                                                                        datosCuentasNegocioItem.ubicacion != null &&
                                                                                datosCuentasNegocioItem.ubicacion != ''
                                                                            ? functions.formatearDireccionNegocio(datosCuentasNegocioItem.ubicacion!)
                                                                            : '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.0364963,
                                                                15.0,
                                                              ))),
                                                            ),
                                                          ],
                                                        ),
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
                            ],
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
