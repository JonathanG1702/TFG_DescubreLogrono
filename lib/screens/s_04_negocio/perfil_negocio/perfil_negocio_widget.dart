import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_expanded_image_view.dart';
import '/flutter_assets/flutter_flow_icon_button.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_04_negocio/s_04_components/crear_editar_resena/crear_editar_resena_widget.dart';
import '/flutter_assets/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'perfil_negocio_model.dart';
export 'perfil_negocio_model.dart';

class PerfilNegocioWidget extends StatefulWidget {
  const PerfilNegocioWidget({
    super.key,
    String? idNegocio,
    required this.volverAtras,
    required this.estaVisualizando,
    int? indiceTabBar,
  })  : idNegocio = idNegocio ?? '',
        indiceTabBar = indiceTabBar ?? 0;

  final String idNegocio;
  final bool? volverAtras;
  final bool? estaVisualizando;
  final int indiceTabBar;

  @override
  State<PerfilNegocioWidget> createState() => _PerfilNegocioWidgetState();
}

class _PerfilNegocioWidgetState extends State<PerfilNegocioWidget>
    with TickerProviderStateMixin {
  late PerfilNegocioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilNegocioModel());

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
          _model.datosNegocio = await CuentasNegociosAppTable().queryRows(
            queryFn: (q) => q.eq(
              'id_cuenta',
              widget.idNegocio,
            ),
          );
        }),
        Future(() async {
          _model.resenasNegocio = await ReseasNegociosTable().queryRows(
            queryFn: (q) => q.eq(
              'id_negocio',
              widget.idNegocio,
            ),
          );
        }),
        Future(() async {
          _model.negociosMarcadosUsuario =
              await MarcadoresNegociosUsuarioTable().queryRows(
            queryFn: (q) => q.eq(
              'id_usuario',
              FFAppState().idUsuarioLogado,
            ),
          );
          if (_model.negociosMarcadosUsuario != null &&
              (_model.negociosMarcadosUsuario)!.isNotEmpty) {
            if (_model.negociosMarcadosUsuario!.first.idNegociosGuardados
                .contains(widget.idNegocio)) {
              _model.negocioGuardado = true;
            } else {
              _model.negocioGuardado = false;
            }
          }
        }),
      ]);
      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
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
          title: 'PerfilNegocio',
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
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.078125,
                        75.0,
                      )),
                 child: Column(
                   children: [
                      Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  _model.datosNegocio?.first.urlFotoCabecera,
                                  'https://img.freepik.com/foto-gratis/fondo-acuarela-pintada-mano-forma-cielo-nubes_24972-1095.jpg',
                                ),
                                width: double.infinity,
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.2083,
                                  200.0,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
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
                                0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      0.0,
                                      0.0,
                                      valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0052,
                                        5.0,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(),
                                        child: Visibility(
                                          visible: widget.volverAtras == true,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('negocios');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                    'ygpi7yzt' /* VOLVER ATRAS */,
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
                                              ].divide(SizedBox(
                                                  width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.012165,
                                                5.0,
                                              ))),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (widget.estaVisualizando == true)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .grisClaro2,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.010416,
                                                      10.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.0052083,
                                                      5.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.010416,
                                                      10.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.0052083,
                                                      5.0,
                                                    )),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.02083,
                                                    20.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'yahlelya' /* PREVISUALIZANDO */,
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
                                              ].divide(SizedBox(
                                                  width: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.012165,
                                                5.0,
                                              ))),
                                            ),
                                          ),
                                        ),
                                      if (widget.estaVisualizando == false)
                                        FutureBuilder<
                                            List<MarcadoresNegociosUsuarioRow>>(
                                          future: (_model.requestCompleter2 ??=
                                                  Completer<
                                                      List<
                                                          MarcadoresNegociosUsuarioRow>>()
                                                    ..complete(
                                                        MarcadoresNegociosUsuarioTable()
                                                            .querySingleRow(
                                                      queryFn: (q) => q.eq(
                                                        'id_usuario',
                                                        FFAppState()
                                                            .idUsuarioLogado,
                                                      ),
                                                    )))
                                              .future,
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
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (_model.negocioGuardado ==
                                                    false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (rowMarcadoresNegociosUsuarioRow
                                                                  ?.idUsuario !=
                                                              null &&
                                                          rowMarcadoresNegociosUsuarioRow
                                                                  ?.idUsuario !=
                                                              '') {
                                                        if (rowMarcadoresNegociosUsuarioRow!
                                                            .idNegociosGuardados
                                                            .isNotEmpty) {
                                                          _model.addToListadoMarcadores(
                                                              widget.idNegocio);
                                                          await MarcadoresNegociosUsuarioTable()
                                                              .update(
                                                            data: {
                                                              'id_negocios_guardados':
                                                                  _model
                                                                      .listadoMarcadores,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id_usuario',
                                                              FFAppState()
                                                                  .idUsuarioLogado,
                                                            ),
                                                          );
                                                        } else {
                                                          _model.addToListadoMarcadores(
                                                              widget.idNegocio);
                                                          await MarcadoresNegociosUsuarioTable()
                                                              .update(
                                                            data: {
                                                              'id_negocios_guardados':
                                                                  _model
                                                                      .listadoMarcadores,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id_usuario',
                                                              FFAppState()
                                                                  .idUsuarioLogado,
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        _model
                                                            .addToListadoMarcadores(
                                                                widget
                                                                    .idNegocio);
                                                        await MarcadoresNegociosUsuarioTable()
                                                            .insert({
                                                          'id_usuario':
                                                              FFAppState()
                                                                  .idUsuarioLogado,
                                                          'id_negocios_guardados':
                                                              _model
                                                                  .listadoMarcadores,
                                                        });
                                                      }

                                                      _model.negocioGuardado =
                                                          true;
                                                      setState(() => _model
                                                              .requestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted2();
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .bookmark_border_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.0260416,
                                                        25.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.negocioGuardado ==
                                                    true)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model
                                                          .removeFromListadoMarcadores(
                                                              widget.idNegocio);
                                                      await MarcadoresNegociosUsuarioTable()
                                                          .update(
                                                        data: {
                                                          'id_negocios_guardados':
                                                              _model
                                                                  .listadoMarcadores,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id_usuario',
                                                          FFAppState()
                                                              .idUsuarioLogado,
                                                        ),
                                                      );
                                                      _model.negocioGuardado =
                                                          false;
                                                      setState(() => _model
                                                              .requestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted2();
                                                    },
                                                    child: Icon(
                                                      Icons.bookmark_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: valueOrDefault<
                                                          double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.0260416,
                                                        25.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          _model.datosNegocio?.first.urlLogo,
                                          'https://vaswgtvmlhgkurwrlxiz.supabase.co/storage/v1/object/public/logos_cuentas_usuarios/logos_base_app/logo_negocio_base.png?t=2024-05-06T08%3A14%3A29.161Z',
                                        ),
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.243309,
                                          100.0,
                                        ),
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.10416,
                                          100.0,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: AutoSizeText(
                                            valueOrDefault<String>(
                                              _model
                                                  .datosNegocio?.first.nombre,
                                              'Desconocido',
                                            ).maybeHandleOverflow(
                                              maxChars: 16,
                                              replacement: '…',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.03125,
                                                    30.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.datosNegocio?.first
                                                .tipoNegocio,
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
                                          height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0052083,
                                        5.0,
                                      ))),
                                    ),
                                  ].divide(SizedBox(
                                      width: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width * 0.060827,
                                    25.0,
                                  ))),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FutureBuilder<List<CuentasNegociosAppRow>>(
                                      future: (_model.requestCompleter4 ??=
                                              Completer<
                                                  List<CuentasNegociosAppRow>>()
                                                ..complete(
                                                    CuentasNegociosAppTable()
                                                        .querySingleRow(
                                                  queryFn: (q) => q.eq(
                                                    'id_cuenta',
                                                    widget.idNegocio,
                                                  ),
                                                )))
                                          .future,
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
                                        List<CuentasNegociosAppRow>
                                            rowValoracionResenasCuentasNegociosAppRowList =
                                            snapshot.data!;
                                        final rowValoracionResenasCuentasNegociosAppRow =
                                            rowValoracionResenasCuentasNegociosAppRowList
                                                    .isNotEmpty
                                                ? rowValoracionResenasCuentasNegociosAppRowList
                                                    .first
                                                : null;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.tabBarController!
                                                  .animateTo(
                                                2,
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  rowValoracionResenasCuentasNegociosAppRow
                                                      ?.valoracionMedia
                                                      .toString(),
                                                  '0.0',
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
                                                    ),
                                              ),
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                ),
                                                direction: Axis.horizontal,
                                                rating: valueOrDefault<double>(
                                                  rowValoracionResenasCuentasNegociosAppRow
                                                      ?.valoracionMedia,
                                                  0.0,
                                                ),
                                                unratedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .grisCustom,
                                                itemCount: 5,
                                                itemSize: 20.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '(${valueOrDefault<String>(
                                                    rowValoracionResenasCuentasNegociosAppRow
                                                        ?.cantResenas
                                                        .toString(),
                                                    '0',
                                                  )})',
                                                  '(0)',
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
                                                    ),
                                              ),
                                            ].divide(SizedBox(
                                                width: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.012165,
                                              5.0,
                                            ))),
                                          ),
                                        );
                                      },
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((_model.datosNegocio?.first
                                                .redesSociales[0]) !=
                                            'SinEstablecer')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.estaVisualizando ==
                                                  false) {
                                                await launchURL(_model
                                                    .datosNegocio!
                                                    .first
                                                    .redesSociales[0]);
                                                return;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.instagram,
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
                                          ),
                                        if ((_model.datosNegocio?.first
                                                .redesSociales[1]) !=
                                            'SinEstablecer')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.estaVisualizando ==
                                                  false) {
                                                await launchURL(_model
                                                    .datosNegocio!
                                                    .first
                                                    .redesSociales[1]);
                                                return;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.twitter,
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
                                          ),
                                        if ((_model.datosNegocio?.first
                                                .redesSociales[2]) !=
                                            'SinEstablecer')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.estaVisualizando ==
                                                  false) {
                                                await launchURL(_model
                                                    .datosNegocio!
                                                    .first
                                                    .redesSociales[2]);
                                                return;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.tiktok,
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
                                          ),
                                        if ((_model.datosNegocio?.first
                                                .redesSociales[3]) !=
                                            'SinEstablecer')
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (widget.estaVisualizando ==
                                                  false) {
                                                await launchURL(_model
                                                    .datosNegocio!
                                                    .first
                                                    .redesSociales[3]);
                                                return;
                                              } else {
                                                return;
                                              }
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.youtube,
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
                                          ),
                                      ].divide(SizedBox(
                                          width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.02433,
                                        10.0,
                                      ))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.048661,
                              20.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.010416,
                              10.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.048661,
                              20.0,
                            ),
                            0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.datosNegocio?.first.ubicacion !=
                                          null &&
                                      _model.datosNegocio?.first.ubicacion !=
                                          '')
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.03645,
                                        35.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).info,
                                      icon: FaIcon(
                                        FontAwesomeIcons.mapMarkedAlt,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.015625,
                                          15.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  if (_model.datosNegocio?.first.telefono !=
                                          null &&
                                      _model.datosNegocio?.first.telefono !=
                                          '')
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (widget.estaVisualizando == false) {
                                          final uri = Uri(
                                            scheme: 'tel',
                                            path: _model
                                                .datosNegocio!.first.telefono!,
                                          );
                                          await launchUrl(uri);
                                        } else {
                                          return;
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'kvj3x8ls' /* Llamar */,
                                      ),
                                      icon: Icon(
                                        Icons.call,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.015625,
                                          15.0,
                                        ),
                                      ),
                                      options: FFButtonOptions(
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.03645,
                                          35.0,
                                        ),
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.0125,
                                                12.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  if (_model.datosNegocio?.first.telefono !=
                                          null &&
                                      _model.datosNegocio?.first.telefono !=
                                          '')
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'k5slhcgx' /* Compartir */,
                                      ),
                                      icon: Icon(
                                        Icons.share_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.015625,
                                          15.0,
                                        ),
                                      ),
                                      options: FFButtonOptions(
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.03645,
                                          35.0,
                                        ),
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.0125,
                                                12.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  if ((FFAppState().idUsuarioLogado ==
                                          _model.datosNegocio?.first
                                              .idUsuarioPropietario) &&
                                      (widget.estaVisualizando == false))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'editar_perfil_negocio',
                                          queryParameters: {
                                            'idNegocio': serializeParam(
                                              widget.idNegocio,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'l0xjgk4n' /* Editar */,
                                      ),
                                      icon: Icon(
                                        Icons.edit,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.015625,
                                          15.0,
                                        ),
                                      ),
                                      options: FFButtonOptions(
                                        height: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.03645,
                                          35.0,
                                        ),
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFFF7D00),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.0125,
                                                12.0,
                                              ),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                ].divide(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.012165,
                                  5.0,
                                ))),
                              ),
                            ),
                            Container(
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.619791,
                                595.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.0125,
                                              12.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).error,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ssm5la0f' /* RESUMEN */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '10r6ak3m' /* MENÚ */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '4m9yiu7i' /* RESEÑAS */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ibjvs48q' /* FOTOS */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.010416,
                                                    10.0,
                                                  ),
                                                  0.0,
                                                  0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (_model.datosNegocio?.first
                                                          .descripcion !=
                                                      null &&
                                                  _model.datosNegocio?.first
                                                          .descripcion !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .datosNegocio
                                                            ?.first
                                                            .descripcion,
                                                        'Desconocido',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
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
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ],
                                                ),
                                              if (_model.datosNegocio?.first
                                                          .ubicacion !=
                                                      null &&
                                                  _model.datosNegocio?.first
                                                          .ubicacion !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .mapMarkerAlt,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0260416,
                                                            25.0,
                                                          ),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .datosNegocio
                                                                ?.first
                                                                .ubicacion,
                                                            'Desconocido',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 45),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        )),
                                                      ].divide(SizedBox(
                                                          width: valueOrDefault<
                                                              double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.02433,
                                                        10.0,
                                                      ))),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ],
                                                ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController1,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .clock,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0260416,
                                                                      25.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'z8y9zmgp' /* HORARIO */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.015625,
                                                                            15.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                        width: valueOrDefault<
                                                                            double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.02433,
                                                                  10.0,
                                                                ))),
                                                              ),
                                                              collapsed:
                                                                  Container(),
                                                              expanded: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).width * 0.085158,
                                                                              35.0,
                                                                            ),
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ib6ulns7' /* Lunes */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'frwv9cg8' /* Martes */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'dwnmepi9' /* Miércoles */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'cv5kmuyi' /* Jueves */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'uvaf4v8u' /* Viernes */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'c9bk4xzv' /* Sabado */,
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
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '86wltoif' /* Domingo */,
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            200.0,
                                                                        height:
                                                                            135.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                        child: FutureBuilder<
                                                                            List<CuentasNegociosAppRow>>(
                                                                          future:
                                                                              CuentasNegociosAppTable().querySingleRow(
                                                                            queryFn: (q) =>
                                                                                q.eq(
                                                                              'id_cuenta',
                                                                              widget.idNegocio,
                                                                            ),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return const Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      Color(0xFFF6F6F6),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<CuentasNegociosAppRow>
                                                                                listViewCuentasNegociosAppRowList =
                                                                                snapshot.data!;
                                                                            final listViewCuentasNegociosAppRow = listViewCuentasNegociosAppRowList.isNotEmpty
                                                                                ? listViewCuentasNegociosAppRowList.first
                                                                                : null;
                                                                            return Builder(
                                                                              builder: (context) {
                                                                                final horarioNegocio = (listViewCuentasNegociosAppRow?.horario.map((e) => e).toList().toList() ?? []).take(7).toList();
                                                                                return ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: horarioNegocio.length,
                                                                                  itemBuilder: (context, horarioNegocioIndex) {
                                                                                    final horarioNegocioItem = horarioNegocio[horarioNegocioIndex];
                                                                                    return Text(
                                                                                      valueOrDefault<String>(
                                                                                        horarioNegocioItem,
                                                                                        'Cerrado',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: (listViewCuentasNegociosAppRow?.horario[horarioNegocioIndex]) == 'Abierto' ? FlutterFlowTheme.of(context).accent3 : FlutterFlowTheme.of(context).error,
                                                                                            fontSize: MediaQuery.sizeOf(context).height * 0.015625,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(
                                                                    SizedBox(
                                                                        width: valueOrDefault<
                                                                            double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.0729927,
                                                                  30.0,
                                                                ))),
                                                              ),
                                                              theme:
                                                                  const ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    true,
                                                                tapBodyToCollapse:
                                                                    true,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                                expandIcon: Icons
                                                                    .keyboard_arrow_down_sharp,
                                                                collapseIcon: Icons
                                                                    .keyboard_arrow_up_sharp,
                                                                iconSize: 25.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ],
                                              ),
                                              if (_model.datosNegocio?.first
                                                          .telefono !=
                                                      null &&
                                                  _model.datosNegocio?.first
                                                          .telefono !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.phone,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0260416,
                                                            25.0,
                                                          ),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .datosNegocio
                                                                ?.first
                                                                .telefono,
                                                            'Desconocido',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                        )),
                                                      ].divide(SizedBox(
                                                          width: valueOrDefault<
                                                              double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.02433,
                                                        10.0,
                                                      ))),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ],
                                                ),
                                              if (_model.datosNegocio?.first
                                                          .paginaWeb !=
                                                      null &&
                                                  _model.datosNegocio?.first
                                                          .paginaWeb !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.web,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0260416,
                                                            25.0,
                                                          ),
                                                        ),
                                                        SelectionArea(
                                                            child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .datosNegocio
                                                                ?.first
                                                                .paginaWeb,
                                                            'Desconocido',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 45),
                                                          textAlign:
                                                              TextAlign.start,
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
                                                        )),
                                                      ].divide(SizedBox(
                                                          width: valueOrDefault<
                                                              double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.02433,
                                                        10.0,
                                                      ))),
                                                    ),
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<
                                                List<
                                                    CategoriasMenuNegociosRow>>(
                                              future:
                                                  CategoriasMenuNegociosTable()
                                                      .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id_negocio',
                                                  widget.idNegocio,
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
                                                List<CategoriasMenuNegociosRow>
                                                    listViewCategoriasMenuNegociosRowList =
                                                    snapshot.data!;
                                                final listViewCategoriasMenuNegociosRow =
                                                    listViewCategoriasMenuNegociosRowList
                                                            .isNotEmpty
                                                        ? listViewCategoriasMenuNegociosRowList
                                                            .first
                                                        : null;
                                                return Builder(
                                                  builder: (context) {
                                                    final categoriasNegocio =
                                                        listViewCategoriasMenuNegociosRow
                                                                ?.categorias
                                                                .map((e) => e)
                                                                .toList()
                                                                .toList() ??
                                                            [];
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          categoriasNegocio
                                                              .length,
                                                      itemBuilder: (context,
                                                          categoriasNegocioIndex) {
                                                        final categoriasNegocioItem =
                                                            categoriasNegocio[
                                                                categoriasNegocioIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    ExpandableNotifier(
                                                                  initialExpanded:
                                                                      true,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        categoriasNegocioItem,
                                                                        'Desconocido',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.015625,
                                                                              15.0,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(),
                                                                    expanded:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: FutureBuilder<List<ElementosMenuNegociosRow>>(
                                                                                future: ElementosMenuNegociosTable().queryRows(
                                                                                  queryFn: (q) => q
                                                                                      .eq(
                                                                                        'id_negocio',
                                                                                        widget.idNegocio,
                                                                                      )
                                                                                      .eq(
                                                                                        'categoria',
                                                                                        valueOrDefault<String>(
                                                                                          categoriasNegocioItem,
                                                                                          'Desconocido',
                                                                                        ),
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
                                                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                                                            Color(0xFFF6F6F6),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<ElementosMenuNegociosRow> gridViewElementosMenuNegociosRowList = snapshot.data!;
                                                                                  return GridView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                      crossAxisCount: 3,
                                                                                      crossAxisSpacing: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).width * 0.0233,
                                                                                        10.0,
                                                                                      ),
                                                                                      mainAxisSpacing: valueOrDefault<double>(
                                                                                        MediaQuery.sizeOf(context).height * 0.02433,
                                                                                        10.0,
                                                                                      ),
                                                                                      childAspectRatio: 1.0,
                                                                                    ),
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: gridViewElementosMenuNegociosRowList.length,
                                                                                    itemBuilder: (context, gridViewIndex) {
                                                                                      final gridViewElementosMenuNegociosRow = gridViewElementosMenuNegociosRowList[gridViewIndex];
                                                                                      return Stack(
                                                                                        children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              'https://picsum.photos/seed/696/600',
                                                                                              fit: BoxFit.contain,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).width * 0.012165,
                                                                                                  5.0,
                                                                                                ),
                                                                                                valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).height * 0.0052083,
                                                                                                  5.0,
                                                                                                ),
                                                                                                valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).width * 0.012165,
                                                                                                  5.0,
                                                                                                ),
                                                                                                valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).height * 0.0052083,
                                                                                                  5.0,
                                                                                                )),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    AutoSizeText(
                                                                                                      valueOrDefault<String>(
                                                                                                        gridViewElementosMenuNegociosRow.nombre,
                                                                                                        'Desconocido',
                                                                                                      ),
                                                                                                      textAlign: TextAlign.start,
                                                                                                      maxLines: 2,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                            fontSize: valueOrDefault<double>(
                                                                                                              MediaQuery.sizeOf(context).height * 0.015625,
                                                                                                              15.0,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (gridViewElementosMenuNegociosRow.esDestacado)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                                  5.0,
                                                                                                  valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.0052083,
                                                                                                    5.0,
                                                                                                  ),
                                                                                                  0.0,
                                                                                                  0.0),
                                                                                              child: Container(
                                                                                                width: valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).width * 0.20681,
                                                                                                  85.0,
                                                                                                ),
                                                                                                height: valueOrDefault<double>(
                                                                                                  MediaQuery.sizeOf(context).height * 0.02083,
                                                                                                  20.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'tkrwo27w' /* DESTACADO */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Readex Pro',
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                          height: valueOrDefault<double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.010416,
                                                                        10.0,
                                                                      ))),
                                                                    ),
                                                                    theme:
                                                                        const ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible:
                                              widget.estaVisualizando == false,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.0052083,
                                                      5.0,
                                                    ),
                                                    0.0,
                                                    0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Builder(
                                                        builder: (context) =>
                                                            FFButtonWidget(
                                                          onPressed: () async {
                                                            await showDialog(
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
                                                                        CrearEditarResenaWidget(
                                                                      nombreNegocio:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .datosNegocio
                                                                            ?.first
                                                                            .nombre,
                                                                        'Desconocido',
                                                                      ),
                                                                      idNegocio:
                                                                          widget
                                                                              .idNegocio,
                                                                      idUsuario:
                                                                          FFAppState()
                                                                              .idUsuarioLogado,
                                                                      esEdiccionResena:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            setState(() => _model
                                                                    .requestCompleter1 =
                                                                null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                            setState(() => _model
                                                                    .requestCompleter4 =
                                                                null);
                                                            await _model
                                                                .waitForRequestCompleted4();
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'qiet9ra2' /* Publicar */,
                                                          ),
                                                          icon: Icon(
                                                            Icons.add_rounded,
                                                            size:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.02083,
                                                              20.0,
                                                            ),
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height:
                                                                valueOrDefault<
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.0125,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<
                                                            ReseasNegociosRow>>(
                                                      future: (_model
                                                                  .requestCompleter1 ??=
                                                              Completer<
                                                                  List<
                                                                      ReseasNegociosRow>>()
                                                                ..complete(
                                                                    ReseasNegociosTable()
                                                                        .queryRows(
                                                                  queryFn: (q) => q
                                                                      .eq(
                                                                        'id_negocio',
                                                                        widget
                                                                            .idNegocio,
                                                                      )
                                                                      .order('fecha_publicacion')
                                                                      .order('fecha_edicion'),
                                                                )))
                                                          .future,
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
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
                                                            ),
                                                          );
                                                        }
                                                        List<ReseasNegociosRow>
                                                            listViewResenasReseasNegociosRowList =
                                                            snapshot.data!;
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewResenasReseasNegociosRowList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewResenasIndex) {
                                                            final listViewResenasReseasNegociosRow =
                                                                listViewResenasReseasNegociosRowList[
                                                                    listViewResenasIndex];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                FutureBuilder<
                                                                    List<
                                                                        CuentasUsuariosAppRow>>(
                                                                  future: CuentasUsuariosAppTable()
                                                                      .querySingleRow(
                                                                    queryFn:
                                                                        (q) => q
                                                                            .eq(
                                                                      'id_usuario',
                                                                      listViewResenasReseasNegociosRow
                                                                          .idUsuario,
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return const Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0xFFF6F6F6),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<CuentasUsuariosAppRow>
                                                                        rowCuentasUsuariosAppRowList =
                                                                        snapshot
                                                                            .data!;
                                                                    final rowCuentasUsuariosAppRow = rowCuentasUsuariosAppRowList
                                                                            .isNotEmpty
                                                                        ? rowCuentasUsuariosAppRowList
                                                                            .first
                                                                        : null;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.04166,
                                                                                40.0,
                                                                              ),
                                                                              height: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.04166,
                                                                                40.0,
                                                                              ),
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: const BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                rowCuentasUsuariosAppRow!.urlImagenUsuario,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        rowCuentasUsuariosAppRow.nombreUsuario,
                                                                                        'Desconocido',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: valueOrDefault<double>(
                                                                                              MediaQuery.sizeOf(context).height * 0.015625,
                                                                                              15.0,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    if (rowCuentasUsuariosAppRow.cuentaVerificada == true)
                                                                                      AlignedTooltip(
                                                                                        content: Padding(
                                                                                          padding: const EdgeInsets.all(5.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '5s108d8m' /* El usuario está verificado */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  fontFamily: 'Readex Pro',
                                                                                                  fontSize: valueOrDefault<double>(
                                                                                                    MediaQuery.sizeOf(context).height * 0.015625,
                                                                                                    15.0,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        offset: 5.0,
                                                                                        preferredDirection: AxisDirection.down,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 5.0,
                                                                                        tailBaseWidth: 25.0,
                                                                                        tailLength: 10.0,
                                                                                        waitDuration: const Duration(milliseconds: 100),
                                                                                        showDuration: const Duration(milliseconds: 1500),
                                                                                        triggerMode: TooltipTriggerMode.tap,
                                                                                        child: Icon(
                                                                                          Icons.verified_sharp,
                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.02083,
                                                                                            20.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                                          valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).width * 0.012165,
                                                                                            5.0,
                                                                                          ),
                                                                                          0.0,
                                                                                          0.0,
                                                                                          0.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          '${rowCuentasUsuariosAppRow.cantResenas?.toString()}${valueOrDefault<String>(
                                                                                            rowCuentasUsuariosAppRow.cantResenas == 1 ? ' reseña' : ' reseñas',
                                                                                            ' reseña',
                                                                                          )}',
                                                                                          '1 reseña',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              fontSize: valueOrDefault<double>(
                                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                                12.0,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(
                                                                                      width: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).width * 0.012165,
                                                                                    5.0,
                                                                                  ))),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    RatingBarIndicator(
                                                                                      itemBuilder: (context, index) => Icon(
                                                                                        Icons.star_rounded,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                      ),
                                                                                      direction: Axis.horizontal,
                                                                                      rating: listViewResenasReseasNegociosRow.puntuacion!,
                                                                                      unratedColor: FlutterFlowTheme.of(context).grisCustom,
                                                                                      itemCount: 5,
                                                                                      itemSize: 20.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                                          valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).width * 0.012165,
                                                                                            5.0,
                                                                                          ),
                                                                                          0.0,
                                                                                          0.0,
                                                                                          0.0),
                                                                                      child: Text(
                                                                                        listViewResenasReseasNegociosRow.fechaEdicion != null
                                                                                            ? dateTimeFormat(
                                                                                                'd/M/y',
                                                                                                listViewResenasReseasNegociosRow.fechaEdicion!,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              )
                                                                                            : dateTimeFormat(
                                                                                                'd/M/y',
                                                                                                listViewResenasReseasNegociosRow.fechaPublicacion,
                                                                                                locale: FFLocalizations.of(context).languageCode,
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
                                                                                    ),
                                                                                    if (listViewResenasReseasNegociosRow.fechaEdicion != null)
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '9s3c0m2d' /* (Editado) */,
                                                                                        ),
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
                                                                                    MediaQuery.sizeOf(context).width * 0.012165,
                                                                                    5.0,
                                                                                  ))),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.02433,
                                                                            10.0,
                                                                          ))),
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .report_gmailerrorred_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.03125,
                                                                            30.0,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                                if (listViewResenasReseasNegociosRow
                                                                            .comentario !=
                                                                        '')
                                                                  Text(
                                                                    listViewResenasReseasNegociosRow
                                                                        .comentario,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).height *
                                                                                0.015625,
                                                                            15.0,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                FutureBuilder<
                                                                    List<
                                                                        LikesReseasUsuarioRow>>(
                                                                  future: (_model.requestCompleter3 ??= Completer<
                                                                          List<
                                                                              LikesReseasUsuarioRow>>()
                                                                        ..complete(
                                                                            LikesReseasUsuarioTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eq(
                                                                            'id_usuario',
                                                                            FFAppState().idUsuarioLogado,
                                                                          ),
                                                                        )))
                                                                      .future,
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return const Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              Color(0xFFF6F6F6),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<LikesReseasUsuarioRow>
                                                                        rowLikesResenaLikesReseasUsuarioRowList =
                                                                        snapshot
                                                                            .data!;
                                                                    final rowLikesResenaLikesReseasUsuarioRow = rowLikesResenaLikesReseasUsuarioRowList
                                                                            .isNotEmpty
                                                                        ? rowLikesResenaLikesReseasUsuarioRowList
                                                                            .first
                                                                        : null;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            if (() {
                                                                              if (rowLikesResenaLikesReseasUsuarioRow?.listadoResenasLike.contains(listViewResenasReseasNegociosRow.idResena) == null) {
                                                                                return true;
                                                                              } else if (rowLikesResenaLikesReseasUsuarioRow!.listadoResenasLike.contains(listViewResenasReseasNegociosRow.idResena)) {
                                                                                return false;
                                                                              } else {
                                                                                return true;
                                                                              }
                                                                            }())
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (rowLikesResenaLikesReseasUsuarioRow?.idUsuario != null && rowLikesResenaLikesReseasUsuarioRow?.idUsuario != '') {
                                                                                    if (rowLikesResenaLikesReseasUsuarioRow!.listadoResenasLike.isNotEmpty) {
                                                                                      _model.listadoLikes = rowLikesResenaLikesReseasUsuarioRow.listadoResenasLike.toList().cast<String>();
                                                                                    }
                                                                                    _model.addToListadoLikes(listViewResenasReseasNegociosRow.idResena);
                                                                                    await LikesReseasUsuarioTable().update(
                                                                                      data: {
                                                                                        'listado_reseñas_like': _model.listadoLikes,
                                                                                      },
                                                                                      matchingRows: (rows) => rows.eq(
                                                                                        'id_usuario',
                                                                                        FFAppState().idUsuarioLogado,
                                                                                      ),
                                                                                    );
                                                                                    _model.listadoLikes = [];
                                                                                  } else {
                                                                                    _model.addToListadoLikes(listViewResenasReseasNegociosRow.idResena);
                                                                                    await LikesReseasUsuarioTable().insert({
                                                                                      'listado_reseñas_like': _model.listadoLikes,
                                                                                      'id_usuario': FFAppState().idUsuarioLogado,
                                                                                    });
                                                                                  }

                                                                                  await ReseasNegociosTable().update(
                                                                                    data: {
                                                                                      'likes_reseña': functions.actualizarCantLike(listViewResenasReseasNegociosRow.likesResena, true),
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eq(
                                                                                      'id_reseña',
                                                                                      listViewResenasReseasNegociosRow.idResena,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => _model.requestCompleter1 = null);
                                                                                  await _model.waitForRequestCompleted1();
                                                                                  setState(() => _model.requestCompleter3 = null);
                                                                                  await _model.waitForRequestCompleted3();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.favorite_border,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.026041,
                                                                                    25.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if ((rowLikesResenaLikesReseasUsuarioRow?.idUsuario != null && rowLikesResenaLikesReseasUsuarioRow?.idUsuario != '') &&
                                                                                (rowLikesResenaLikesReseasUsuarioRow?.listadoResenasLike.contains(listViewResenasReseasNegociosRow.idResena) == true))
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.listadoLikes = rowLikesResenaLikesReseasUsuarioRow!.listadoResenasLike.toList().cast<String>();
                                                                                  _model.removeFromListadoLikes(listViewResenasReseasNegociosRow.idResena);
                                                                                  await LikesReseasUsuarioTable().update(
                                                                                    data: {
                                                                                      'listado_reseñas_like': _model.listadoLikes,
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eq(
                                                                                      'id_usuario',
                                                                                      FFAppState().idUsuarioLogado,
                                                                                    ),
                                                                                  );
                                                                                  _model.listadoLikes = [];
                                                                                  await ReseasNegociosTable().update(
                                                                                    data: {
                                                                                      'likes_reseña': functions.actualizarCantLike(listViewResenasReseasNegociosRow.likesResena, false),
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eq(
                                                                                      'id_reseña',
                                                                                      listViewResenasReseasNegociosRow.idResena,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => _model.requestCompleter1 = null);
                                                                                  await _model.waitForRequestCompleted1();
                                                                                  setState(() => _model.requestCompleter3 = null);
                                                                                  await _model.waitForRequestCompleted3();
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.favorite,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: valueOrDefault<double>(
                                                                                    MediaQuery.sizeOf(context).height * 0.026041,
                                                                                    25.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                '${listViewResenasReseasNegociosRow.likesResena.toString()} Me gusta',
                                                                                '0 Me gusta',
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
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.012165,
                                                                            5.0,
                                                                          ))),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (FFAppState().idUsuarioLogado ==
                                                                                listViewResenasReseasNegociosRow.idUsuario)
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: CrearEditarResenaWidget(
                                                                                              nombreNegocio: valueOrDefault<String>(
                                                                                                _model.datosNegocio?.first.nombre,
                                                                                                'Desconocido',
                                                                                              ),
                                                                                              idNegocio: widget.idNegocio,
                                                                                              idUsuario: FFAppState().idUsuarioLogado,
                                                                                              esEdiccionResena: true,
                                                                                              valoracionUsuario: listViewResenasReseasNegociosRow.puntuacion,
                                                                                              comentarioUsuario: listViewResenasReseasNegociosRow.comentario,
                                                                                              idResena: listViewResenasReseasNegociosRow.idResena,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));

                                                                                    setState(() => _model.requestCompleter1 = null);
                                                                                    await _model.waitForRequestCompleted1();
                                                                                    setState(() => _model.requestCompleter4 = null);
                                                                                    await _model.waitForRequestCompleted4();
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'om0z0k2p' /* Editar */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.edit,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.015625,
                                                                                      15.0,
                                                                                    ),
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.03125,
                                                                                      30.0,
                                                                                    ),
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                                            if (FFAppState().idUsuarioLogado ==
                                                                                listViewResenasReseasNegociosRow.idUsuario)
                                                                              Builder(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    var shouldSetState = false;
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: const Text('BORRAR RESEÑA'),
                                                                                              content: const Text('¿Estás seguro de que quieres borrar la reseña?'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: const Text('Cancelar'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: const Text('Confirmar'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      showDialog(
                                                                                        barrierDismissible: false,
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                              child: const AvisoEjecutandoWidget(),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));

                                                                                      await Future.wait([
                                                                                        Future(() async {
                                                                                          if ((rowLikesResenaLikesReseasUsuarioRow?.idUsuario != null && rowLikesResenaLikesReseasUsuarioRow?.idUsuario != '') && (rowLikesResenaLikesReseasUsuarioRow!.listadoResenasLike.isNotEmpty)) {
                                                                                            _model.listadoLikes = rowLikesResenaLikesReseasUsuarioRow.listadoResenasLike.toList().cast<String>();
                                                                                            _model.removeFromListadoLikes(listViewResenasReseasNegociosRow.idResena);
                                                                                            await LikesReseasUsuarioTable().update(
                                                                                              data: {
                                                                                                'listado_reseñas_like': _model.listadoLikes,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eq(
                                                                                                'id_usuario',
                                                                                                FFAppState().idUsuarioLogado,
                                                                                              ),
                                                                                            );
                                                                                            _model.listadoLikes = [];
                                                                                          } else {
                                                                                            if (shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }),
                                                                                        Future(() async {
                                                                                          await ReseasNegociosTable().delete(
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_reseña',
                                                                                              listViewResenasReseasNegociosRow.idResena,
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                        Future(() async {
                                                                                          _model.datosUsuario = await CuentasUsuariosAppTable().queryRows(
                                                                                            queryFn: (q) => q.eq(
                                                                                              'id_usuario',
                                                                                              FFAppState().idUsuarioLogado,
                                                                                            ),
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          await CuentasUsuariosAppTable().update(
                                                                                            data: {
                                                                                              'cant_reseñas': functions.actualizarNumResenas(_model.datosUsuario!.first.cantResenas!, false),
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_usuario',
                                                                                              FFAppState().idUsuarioLogado,
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                        Future(() async {
                                                                                          _model.datosNegocioResena = await CuentasNegociosAppTable().queryRows(
                                                                                            queryFn: (q) => q.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          await CuentasNegociosAppTable().update(
                                                                                            data: {
                                                                                              'cant_reseñas': functions.actualizarNumResenas(_model.datosNegocioResena!.first.cantResenas, false),
                                                                                              'valoracion_media': functions.autoCalculoResenas(_model.datosNegocioResena!.first.valoracionMedia, _model.datosNegocioResena!.first.cantResenas, listViewResenasReseasNegociosRow.puntuacion!, false),
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      ]);
                                                                                      setState(() => _model.requestCompleter1 = null);
                                                                                      await _model.waitForRequestCompleted1();
                                                                                      setState(() => _model.requestCompleter4 = null);
                                                                                      await _model.waitForRequestCompleted4();
                                                                                      Navigator.pop(context);
                                                                                    } else {
                                                                                      if (shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (shouldSetState) setState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'y353uv4s' /* Borrar */,
                                                                                  ),
                                                                                  icon: FaIcon(
                                                                                    FontAwesomeIcons.solidTrashAlt,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    size: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.015625,
                                                                                      15.0,
                                                                                    ),
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.03125,
                                                                                      30.0,
                                                                                    ),
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).error,
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
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
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
                                                                    );
                                                                  },
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.010416,
                                                                10.0,
                                                              ))),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              widget.estaVisualizando == false,
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: FutureBuilder<
                                                List<CuentasNegociosAppRow>>(
                                              future: CuentasNegociosAppTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id_cuenta',
                                                  widget.idNegocio,
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
                                                    gridViewCuentasNegociosAppRowList =
                                                    snapshot.data!;
                                                final gridViewCuentasNegociosAppRow =
                                                    gridViewCuentasNegociosAppRowList
                                                            .isNotEmpty
                                                        ? gridViewCuentasNegociosAppRowList
                                                            .first
                                                        : null;
                                                return GridView(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 15.0,
                                                    mainAxisSpacing: 15.0,
                                                    childAspectRatio: 1.0,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                'https://static.eldiario.es/clip/8f7d0ef5-303c-41bf-8aa3-8a65022c6810_16-9-aspect-ratio_default_0.jpg',
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag4',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag4',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image.network(
                                                            'https://static.eldiario.es/clip/8f7d0ef5-303c-41bf-8aa3-8a65022c6810_16-9-aspect-ratio_default_0.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(
                              height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.010416,
                            10.0,
                          ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))
    );
  }
}
