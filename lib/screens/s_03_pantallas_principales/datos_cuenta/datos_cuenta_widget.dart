import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_icon_button.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_01_parte_inicial/s_01_components/elegir_idioma/elegir_idioma_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'datos_cuenta_model.dart';
export 'datos_cuenta_model.dart';

class DatosCuentaWidget extends StatefulWidget {
  const DatosCuentaWidget({super.key});

  @override
  State<DatosCuentaWidget> createState() => _DatosCuentaWidgetState();
}

class _DatosCuentaWidgetState extends State<DatosCuentaWidget> {
  late DatosCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatosCuentaModel());

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

      _model.datosUsuario = await DatosUsuariosAppTable().queryRows(
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
          title: 'Cuenta',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.060827,
                        25.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0260416,
                        25.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.060827,
                        25.0,
                      ),
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.078125,
                        75.0,
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (FFAppState().idCuentaLogada != '')
                          FutureBuilder<List<CuentasUsuariosAppRow>>(
                            future: CuentasUsuariosAppTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id_cuenta',
                                FFAppState().idCuentaLogada,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CuentasUsuariosAppRow>
                                  rowCuentasUsuariosAppRowList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final rowCuentasUsuariosAppRow =
                                  rowCuentasUsuariosAppRowList.isNotEmpty
                                      ? rowCuentasUsuariosAppRowList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.1041,
                                            100.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.1041,
                                            100.0,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              rowCuentasUsuariosAppRow
                                                  ?.urlImagenUsuario,
                                              'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_usuario_base.png?t=2024-05-21T07%3A02%3A44.408Z',
                                            ),
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            90.0, 0.0, 0.0, 0.0),
                                        child: AlignedTooltip(
                                          content: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yihzgjfy' /* Cuenta verificada */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          offset: 4.0,
                                          preferredDirection:
                                              AxisDirection.down,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 4.0,
                                          tailBaseWidth: 24.0,
                                          tailLength: 12.0,
                                          waitDuration:
                                              const Duration(milliseconds: 100),
                                          showDuration:
                                              const Duration(milliseconds: 1500),
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Visibility(
                                            visible: rowCuentasUsuariosAppRow
                                                    ?.cuentaVerificada ==
                                                true,
                                            child: Icon(
                                              Icons.verified_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.03125,
                                                30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        valueOrDefault<String>(
                                          rowCuentasUsuariosAppRow
                                              ?.nombreUsuario,
                                          'Desconocido',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.02083,
                                                20.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      )),
                                      Text(
                                        '',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: 10.0,
                                              borderWidth: 1.0,
                                              buttonSize:
                                                  valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.03125,
                                                30.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              disabledIconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              icon: Icon(
                                                Icons.share_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                              ),
                                              onPressed: true
                                                  ? null
                                                  : () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                            ),
                                          ].divide(SizedBox(
                                              width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.02433,
                                            10.0,
                                          ))),
                                        ),
                                      ),
                                    ].divide(SizedBox(
                                        height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.0052083,
                                      5.0,
                                    ))),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.02433,
                                  10.0,
                                ))),
                              );
                            },
                          ),
                        if (FFAppState().idCuentaNegocio != '')
                          FutureBuilder<List<CuentasNegociosAppRow>>(
                            future: CuentasNegociosAppTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id_cuenta',
                                FFAppState().idCuentaNegocio,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: SizedBox(
                                      width: 60.0,
                                      height: 60.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<CuentasNegociosAppRow>
                                  rowCuentasNegociosAppRowList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final rowCuentasNegociosAppRow =
                                  rowCuentasNegociosAppRowList.isNotEmpty
                                      ? rowCuentasNegociosAppRowList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.1041,
                                            100.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.1041,
                                            100.0,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              rowCuentasNegociosAppRow?.urlLogo,
                                              'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_negocio_base.png?t=2024-05-21T08%3A31%3A25.367Z',
                                            ),
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          rowCuentasNegociosAppRow?.nombre,
                                          'Desconocido',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.02083,
                                                20.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          rowCuentasNegociosAppRow?.tipoNegocio,
                                          'Desconocido',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.015625,
                                                15.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.goNamed(
                                                  'editar_perfil_negocio',
                                                  queryParameters: {
                                                    'idNegocio': serializeParam(
                                                      FFAppState()
                                                          .idCuentaNegocio,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'nc22n84j' /* Editar perfil */,
                                              ),
                                              options: FFButtonOptions(
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.03125,
                                                  30.0,
                                                ),
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                                          FontWeight.normal,
                                                    ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: 10.0,
                                              borderWidth: 1.0,
                                              buttonSize:
                                                  valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.03125,
                                                30.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              disabledIconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              icon: Icon(
                                                Icons.share_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                              ),
                                              onPressed: true
                                                  ? null
                                                  : () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(
                                        height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.0052083,
                                      5.0,
                                    ))),
                                  ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.02433,
                                  10.0,
                                ))),
                              );
                            },
                          ),
                        FutureBuilder<List<DatosUsuariosAppRow>>(
                          future: DatosUsuariosAppTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id_usuario',
                              FFAppState().idUsuarioLogado,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 100.0, 0.0, 100.0),
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<DatosUsuariosAppRow>
                                containerDatosUsuariosAppRowList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerDatosUsuariosAppRow =
                                containerDatosUsuariosAppRowList.isNotEmpty
                                    ? containerDatosUsuariosAppRowList.first
                                    : null;
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).grisClaro2,
                                borderRadius: BorderRadius.circular(15.0),
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
                                          0.015625,
                                      15.0,
                                    ),
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.03649,
                                      15.0,
                                    ),
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.015625,
                                      15.0,
                                    )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.026041,
                                            25.0,
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'wly8a0ga' /* Cuenta */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.020833,
                                                  20.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.02433,
                                        10.0,
                                      ))),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'rc5rpd2b' /* Correo electrónico */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.015625,
                                              15.0,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            containerDatosUsuariosAppRow
                                                ?.correoElectronico,
                                            'desconocido@gmail.com',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Icon(
                                          Icons.edit_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02083,
                                            20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3wcds0l8' /* Contraseña */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.015625,
                                                15.0,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'olbr37ne' /* ********** */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Icon(
                                          Icons.edit_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.02083,
                                            20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FutureBuilder<List<CuentasUsuariosAppRow>>(
                                      future: CuentasUsuariosAppTable()
                                          .querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'id_cuenta',
                                          FFAppState().idCuentaLogada,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFF6F6F6),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CuentasUsuariosAppRow>
                                            columnCuentasUsuariosAppRowList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final columnCuentasUsuariosAppRow =
                                            columnCuentasUsuariosAppRowList
                                                    .isNotEmpty
                                                ? columnCuentasUsuariosAppRowList
                                                    .first
                                                : null;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.010416,
                                                        10.0,
                                                      ),
                                                      0.0,
                                                      0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '45a9w6ww' /* Id usuario */,
                                                ),
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
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zc7ns2sx' /* ********************* */,
                                                  ),
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    AlignedTooltip(
                                                      content: Padding(
                                                        padding:
                                                            const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'kzb62eh3' /*  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      offset: 4.0,
                                                      preferredDirection:
                                                          AxisDirection.down,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      elevation: 4.0,
                                                      tailBaseWidth: 24.0,
                                                      tailLength: 12.0,
                                                      waitDuration: const Duration(
                                                          milliseconds: 100),
                                                      showDuration: const Duration(
                                                          milliseconds: 1500),
                                                      triggerMode:
                                                          TooltipTriggerMode
                                                              .tap,
                                                      child: Icon(
                                                        Icons.info_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.02083,
                                                          20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 10.0)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ),
                                          0.0,
                                          0.0),
                                      child: FutureBuilder<
                                          List<CuentasNegociosAppRow>>(
                                        future: CuentasNegociosAppTable()
                                            .querySingleRow(
                                          queryFn: (q) => q.eq(
                                            'id_cuenta',
                                            FFAppState().idCuentaNegocio,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFFF6F6F6),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CuentasNegociosAppRow>
                                              columnCuentasNegociosAppRowList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final columnCuentasNegociosAppRow =
                                              columnCuentasNegociosAppRowList
                                                      .isNotEmpty
                                                  ? columnCuentasNegociosAppRowList
                                                      .first
                                                  : null;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1wtu9eny' /* Nombre y apellidos */,
                                                ),
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
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      columnCuentasNegociosAppRow
                                                          ?.nombrePropietario,
                                                      'Desconocido',
                                                    ),
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
                                                  Icon(
                                                    Icons.edit_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02083,
                                                      20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.010416,
                                                          10.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sz201mpb' /* DNI/Pasaporte */,
                                                  ),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      columnCuentasNegociosAppRow
                                                          ?.documentoIdentidad,
                                                      'Desconocido',
                                                    ),
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
                                                  Icon(
                                                    Icons.edit_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02083,
                                                      20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.010416,
                                                          10.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mzqn8vl1' /* Id usuario */,
                                                  ),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'm0ia8ble' /* ********************* */,
                                                    ),
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'rhv58wid' /*  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.down,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        elevation: 4.0,
                                                        tailBaseWidth: 24.0,
                                                        tailLength: 12.0,
                                                        waitDuration: const Duration(
                                                            milliseconds: 100),
                                                        showDuration: const Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Icon(
                                                          Icons.info_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.02083,
                                                            20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 10.0)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        FutureBuilder<List<TipoSuscripcionRow>>(
                          future: TipoSuscripcionTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id_tipo_suscripcion',
                              _model.datosUsuario?.first.idTipoSuscripcion,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 25.0),
                                  child: SizedBox(
                                    width: 80.0,
                                    height: 80.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<TipoSuscripcionRow>
                                containerTipoSuscripcionRowList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerTipoSuscripcionRow =
                                containerTipoSuscripcionRowList.isNotEmpty
                                    ? containerTipoSuscripcionRowList.first
                                    : null;
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).grisClaro2,
                                borderRadius: BorderRadius.circular(15.0),
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
                                          0.015625,
                                      15.0,
                                    ),
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width *
                                          0.03649,
                                      15.0,
                                    ),
                                    valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.015625,
                                      15.0,
                                    )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.monetization_on_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 25.0,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5pik3vwr' /* Suscripción */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.02433,
                                        10.0,
                                      ))),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'uzcdh256' /* Tipo suscripción: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            containerTipoSuscripcionRow?.nombre,
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
                                                      0.015625,
                                                  15.0,
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
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).grisClaro2,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.settings_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'vbata0nv' /* Configuración */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(SizedBox(
                                      width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.02433,
                                    10.0,
                                  ))),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7tfcs5kf' /* Idioma: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'es'
                                              ? FFLocalizations.of(context)
                                                  .getVariableText(
                                                  esText: 'Español',
                                                  enText: 'Spanish',
                                                )
                                              : FFLocalizations.of(context)
                                                  .getVariableText(
                                                  esText: 'Inglés',
                                                  enText: 'English',
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
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
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: const ElegirIdiomaWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'j6num86r' /* Cambiar */,
                                        ),
                                        options: FFButtonOptions(
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.03125,
                                            30.0,
                                          ),
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.010416,
                                        10.0,
                                      ),
                                      0.0,
                                      0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5e1qnkc5' /* Modo: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.015625,
                                                    15.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? FFLocalizations.of(context)
                                                    .getVariableText(
                                                    esText: 'Oscuro',
                                                    enText: 'Dark',
                                                  )
                                                : FFLocalizations.of(context)
                                                    .getVariableText(
                                                    esText: 'Claro',
                                                    enText: 'White',
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.015625,
                                                    15.0,
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
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (Theme.of(context).brightness ==
                                              Brightness.dark) {
                                            setDarkModeSetting(
                                                context, ThemeMode.light);
                                            setState(() {
                                              FFAppState().DarkMode = false;
                                            });
                                            return;
                                          } else {
                                            setDarkModeSetting(
                                                context, ThemeMode.dark);
                                            setState(() {
                                              FFAppState().DarkMode = true;
                                            });
                                            return;
                                          }
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'z97gctli' /* Cambiar */,
                                        ),
                                        options: FFButtonOptions(
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.03125,
                                            30.0,
                                          ),
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.015625,
                                                  15.0,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.015625,
                                15.0,
                              )),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: const AvisoEjecutandoWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    await Future.wait([
                                      Future(() async {
                                        FFAppState().deleteIdCuentaLogada();
                                        FFAppState().idCuentaLogada = '';
                                      }),
                                      Future(() async {
                                        FFAppState().deleteIdCuentaNegocio();
                                        FFAppState().idCuentaNegocio = '';
                                      }),
                                    ]);
                                    Navigator.pop(context);

                                    context.goNamed('seleccionarCuenta');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ikpunevp' /* CAMBIAR CUENTA */,
                                  ),
                                  icon: Icon(
                                    Icons.account_box,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.0277,
                                      25.0,
                                    ),
                                  ),
                                  options: FFButtonOptions(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width * 0.5,
                                      205.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height *
                                          0.04166,
                                      40.0,
                                    ),
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 25.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.015625,
                                            15.0,
                                          ),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
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
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: const AvisoEjecutandoWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      await Future.wait([
                                        Future(() async {
                                          FFAppState().deleteIdCuentaLogada();
                                          FFAppState().idCuentaLogada = '';
                                        }),
                                        Future(() async {
                                          FFAppState().deleteIdCuentaNegocio();
                                          FFAppState().idCuentaNegocio = '';
                                        }),
                                        Future(() async {
                                          FFAppState().deleteIdUsuarioLogado();
                                          FFAppState().idUsuarioLogado = '';
                                        }),
                                      ]);
                                      Navigator.pop(context);
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.goNamedAuth(
                                          'iniciarSesion_Registrarse',
                                          context.mounted);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '8jpv7r98' /* CERRAR SESION */,
                                    ),
                                    icon: Icon(
                                      Icons.login_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0277,
                                        25.0,
                                      ),
                                    ),
                                    options: FFButtonOptions(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width * 0.5,
                                        205.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.04166,
                                        40.0,
                                      ),
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 25.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.015625,
                                              15.0,
                                            ),
                                            letterSpacing: 0.0,
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
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(
                          height: valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.015625,
                        15.0,
                      ))),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
