import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_choice_chips.dart';
import '/flutter_assets/flutter_flow_drop_down.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/flutter_assets/form_field_controller.dart';
import '/screens/s_04_negocio/s_04_components/establecer_red_social/establecer_red_social_widget.dart';
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'editar_perfil_negocio_model.dart';
export 'editar_perfil_negocio_model.dart';

class EditarPerfilNegocioWidget extends StatefulWidget {
  const EditarPerfilNegocioWidget({
    super.key,
    String? idNegocio,
  }) : idNegocio = idNegocio ?? '';

  final String idNegocio;

  @override
  State<EditarPerfilNegocioWidget> createState() =>
      _EditarPerfilNegocioWidgetState();
}

class _EditarPerfilNegocioWidgetState extends State<EditarPerfilNegocioWidget>
    with TickerProviderStateMixin {
  late EditarPerfilNegocioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarPerfilNegocioModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.realizadoCambios = true;
      },
    );

    _model.textFieldDescripcionFocusNode ??= FocusNode();
    _model.textFieldDescripcionFocusNode!.addListener(
      () async {
        _model.realizadoCambios = true;
      },
    );

    _model.textFieldDireccionFocusNode ??= FocusNode();
    _model.textFieldDireccionFocusNode!.addListener(
      () async {
        _model.realizadoCambios = true;
      },
    );

    _model.textFieldTelefonoFocusNode ??= FocusNode();
    _model.textFieldTelefonoFocusNode!.addListener(
      () async {
        _model.realizadoCambios = true;
      },
    );

    _model.textFieldPaginaWebFocusNode ??= FocusNode();
    _model.textFieldPaginaWebFocusNode!.addListener(
      () async {
        _model.realizadoCambios = true;
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'EditarPerfil_Negocio',
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
                    25.0,
                    0.0,
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height * 0.078125,
                      75.0,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.060827,
                            25.0,
                          ),
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.060827,
                            25.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.realizadoCambios == false) {
                                context.pushNamed(
                                  'perfil_negocio',
                                  queryParameters: {
                                    'idNegocio': serializeParam(
                                      widget.idNegocio,
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
                                  }.withoutNulls,
                                );

                                return;
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: const Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  context.pushNamed(
                                    'perfil_negocio',
                                    queryParameters: {
                                      'idNegocio': serializeParam(
                                        widget.idNegocio,
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
                                    }.withoutNulls,
                                  );

                                  return;
                                } else {
                                  return;
                                }
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.0260416,
                                    25.0,
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'r8iuu2eb' /* VOLVER ATRAS */,
                                  ),
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
                                      ),
                                ),
                              ].divide(SizedBox(
                                  width: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.012165,
                                5.0,
                              ))),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.help,
                                color: FlutterFlowTheme.of(context).primary,
                                size: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.026041,
                                  25.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.060827,
                            25.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.015625,
                            15.0,
                          ),
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width * 0.060827,
                            25.0,
                          ),
                          0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'q9zafpk4' /* EDITAR PERFIL DEL NEGOCIO */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.02083,
                                20.0,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.060827,
                              25.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).height * 0.010416,
                              10.0,
                            ),
                            valueOrDefault<double>(
                              MediaQuery.sizeOf(context).width * 0.060827,
                              25.0,
                            ),
                            0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0125,
                                        12.0,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).error,
                                indicatorWeight: 2.0,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'jgcg76wl' /* DATOS */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'banefpeg' /* CUSTOMIZAR */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'ssib0rby' /* MENU */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.026041,
                                          25.0,
                                        ),
                                        0.0,
                                        0.0),
                                    child: FutureBuilder<
                                        List<CuentasNegociosAppRow>>(
                                      future: (_model.requestCompleter1 ??=
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
                                          return Center(
                                            child: SizedBox(
                                              width: 100.0,
                                              height: 100.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CuentasNegociosAppRow>
                                            columnDatosNegocioCuentasNegociosAppRowList =
                                            snapshot.data!;
                                        final columnDatosNegocioCuentasNegociosAppRow =
                                            columnDatosNegocioCuentasNegociosAppRowList
                                                    .isNotEmpty
                                                ? columnDatosNegocioCuentasNegociosAppRowList
                                                    .first
                                                : null;
                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rbt0lnu2' /* INFORMACIÓN GENERAL */,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.03649,
                                                                  15.0,
                                                                ),
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.badge,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.026041,
                                                                25.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'vr28hvc3' /* NOMBRE */,
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
                                                        TextFormField(
                                                          controller: _model
                                                                  .textController1 ??=
                                                              TextEditingController(
                                                            text:
                                                                columnDatosNegocioCuentasNegociosAppRow
                                                                    ?.nombre,
                                                          ),
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController1',
                                                            const Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              _model.realizadoCambios =
                                                                  true;
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                                            0.015625,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
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
                                                                            0.015625,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            contentPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
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
                                                          maxLines: 2,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0052083,
                                                                    5.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .business_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.026041,
                                                                  25.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wvp38sft' /* TIPO DE NEGOCIO */,
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
                                                                        MediaQuery.sizeOf(context).height *
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
                                                            ].divide(SizedBox(
                                                                width:
                                                                    valueOrDefault<
                                                                        double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.01216,
                                                              5.0,
                                                            ))),
                                                          ),
                                                        ),
                                                        FutureBuilder<
                                                            List<
                                                                TiposNegociosRow>>(
                                                          future:
                                                              TiposNegociosTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'activo',
                                                              true,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return const Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      Color(
                                                                          0xFFF6F6F6),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TiposNegociosRow>
                                                                dropDownTipoNegocioTiposNegociosRowList =
                                                                snapshot.data!;
                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownTipoNegocioValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownTipoNegocioValue ??=
                                                                    columnDatosNegocioCuentasNegociosAppRow
                                                                        ?.tipoNegocio,
                                                              ),
                                                              options:
                                                                  dropDownTipoNegocioTiposNegociosRowList
                                                                      .map((e) =>
                                                                          e.tipo)
                                                                      .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.dropDownTipoNegocioValue =
                                                                        val);
                                                                _model.realizadoCambios =
                                                                    true;
                                                              },
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02604,
                                                                  25.0,
                                                                ),
                                                              ),
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius:
                                                                  15.0,
                                                              margin:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                              labelText: '',
                                                              labelTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0052083,
                                                                    5.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .image_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.026041,
                                                                  25.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'qm0yuqhx' /* LOGO DEL NEGOCIO/MARCA */,
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
                                                                        MediaQuery.sizeOf(context).height *
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
                                                            ].divide(SizedBox(
                                                                width:
                                                                    valueOrDefault<
                                                                        double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.01216,
                                                              5.0,
                                                            ))),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'mmj9iy5g' /* VISUALIZAR */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .remove_red_eye,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02073,
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
                                                                padding: const EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                            0.012244,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ly1b2ak8' /* SUBIR */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .upload_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.02073,
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
                                                                padding: const EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                            0.012244,
                                                                        12.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'Button pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '6e1ry7tf' /* BORRAR */,
                                                              ),
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .trash,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.015625,
                                                                  15.0,
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
                                                                padding: const EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.012244,
                                                                        12.0,
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
                                                                            10.0),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width:
                                                                  valueOrDefault<
                                                                      double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.02433,
                                                            10.0,
                                                          ))),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.0052083,
                                                        5.0,
                                                      ))),
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
                                                              0.0260416,
                                                          25.0,
                                                        ),
                                                        0.0,
                                                        0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p4ksggv3' /* DETALLES DEL NEGOCIO */,
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.03649,
                                                                    15.0,
                                                                  ),
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .description,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.026041,
                                                                  25.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'y7h8egnx' /* DESCRIPCIÓN */,
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
                                                                        MediaQuery.sizeOf(context).height *
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
                                                            ].divide(SizedBox(
                                                                width:
                                                                    valueOrDefault<
                                                                        double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.01216,
                                                              5.0,
                                                            ))),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                    .textFieldDescripcionTextController ??=
                                                                TextEditingController(
                                                              text: columnDatosNegocioCuentasNegociosAppRow
                                                                  ?.descripcion,
                                                            ),
                                                            focusNode: _model
                                                                .textFieldDescripcionFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textFieldDescripcionTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                _model.realizadoCambios =
                                                                    true;
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
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
                                                                ),
                                                            maxLines: 5,
                                                            minLines: 1,
                                                            validator: _model
                                                                .textFieldDescripcionTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0052083,
                                                                      5.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026041,
                                                                    25.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'qdixgpuv' /* DIRECCIÓN */,
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
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.01216,
                                                                5.0,
                                                              ))),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                    .textFieldDireccionTextController ??=
                                                                TextEditingController(
                                                              text: columnDatosNegocioCuentasNegociosAppRow
                                                                  ?.ubicacion,
                                                            ),
                                                            focusNode: _model
                                                                .textFieldDireccionFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textFieldDireccionTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                _model.realizadoCambios =
                                                                    true;
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
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
                                                                ),
                                                            validator: _model
                                                                .textFieldDireccionTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0052083,
                                                                      5.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .schedule,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026041,
                                                                    25.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8dbf81lm' /* HORARIO */,
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
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.01216,
                                                                5.0,
                                                              ))),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2av7misq' /* LUNES */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '9ot1xmo0' /* MARTES */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ch7yl94t' /* MIÉRCOLES */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'z0cd6uqz' /* JUEVES */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '02klgis0' /* VIERNES */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'rbxqd14e' /* SÁBADO */,
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
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kp5ovfam' /* DOMINGO */,
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
                                                                          ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          15.0)),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '3typsv1m' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'mrx80a3r' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsLunesValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsLunesValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsLunesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[0]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'xb3eb5uo' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '0srgbxq5' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsMartesValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsMartesValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsMartesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[1]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'gmqm5za4' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'y49j82o4' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsMiercolesValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsMiercolesValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsMiercolesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[2]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '8007ub9l' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'k1unpwdd' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsJuevesValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsJuevesValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsJuevesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[3]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '3chifjgp' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'b127wy4g' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsViernesValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsViernesValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsViernesValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[4]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            '2tzpern0' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'g74unyc6' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsSabadoValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsSabadoValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsSabadoValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[5]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          FlutterFlowChoiceChips(
                                                                        options: [
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'f2j5qc8m' /* Abierto */,
                                                                          )),
                                                                          ChipData(
                                                                              FFLocalizations.of(context).getText(
                                                                            'n8zqmhuq' /* Cerrado */,
                                                                          ))
                                                                        ],
                                                                        onChanged:
                                                                            (val) async {
                                                                          setState(() =>
                                                                              _model.choiceChipsDomingoValue = val?.firstOrNull);
                                                                          _model.realizadoCambios =
                                                                              true;
                                                                        },
                                                                        selectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        unselectedChipStyle:
                                                                            ChipStyle(
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          iconSize:
                                                                              15.0,
                                                                          elevation:
                                                                              0.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderWidth:
                                                                              1.0,
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        chipSpacing:
                                                                            10.0,
                                                                        rowSpacing:
                                                                            10.0,
                                                                        multiselect:
                                                                            false,
                                                                        initialized:
                                                                            _model.choiceChipsDomingoValue !=
                                                                                null,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        controller:
                                                                            _model.choiceChipsDomingoValueController ??=
                                                                                FormFieldController<List<String>>(
                                                                          [
                                                                            columnDatosNegocioCuentasNegociosAppRow!.horario[6]
                                                                          ],
                                                                        ),
                                                                        wrapped:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0052083,
                                                                      5.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.phone,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026041,
                                                                    25.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7qp5p4z4' /* TELEFONO */,
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
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.01216,
                                                                5.0,
                                                              ))),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                    .textFieldTelefonoTextController ??=
                                                                TextEditingController(
                                                              text:
                                                                  columnDatosNegocioCuentasNegociosAppRow
                                                                      ?.telefono,
                                                            ),
                                                            focusNode: _model
                                                                .textFieldTelefonoFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textFieldTelefonoTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                _model.realizadoCambios =
                                                                    true;
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                            validator: _model
                                                                .textFieldTelefonoTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0052083,
                                                                      5.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.web,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026041,
                                                                    25.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'v6n872l3' /* PÁGINA WEB */,
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
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.01216,
                                                                5.0,
                                                              ))),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: _model
                                                                    .textFieldPaginaWebTextController ??=
                                                                TextEditingController(
                                                              text: columnDatosNegocioCuentasNegociosAppRow
                                                                  ?.paginaWeb,
                                                            ),
                                                            focusNode: _model
                                                                .textFieldPaginaWebFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textFieldPaginaWebTextController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () async {
                                                                _model.realizadoCambios =
                                                                    true;
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.015625,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
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
                                                                ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .url,
                                                            validator: _model
                                                                .textFieldPaginaWebTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0052083,
                                                                      5.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidComment,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026041,
                                                                    25.0,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ou4ecb4s' /* REDES SOCIALES */,
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
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AlignedTooltip(
                                                                    content:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'wppa7qkv' /* Para enlazar el perfil de tu n... */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
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
                                                                    preferredDirection:
                                                                        AxisDirection
                                                                            .down,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    elevation:
                                                                        5.0,
                                                                    tailBaseWidth:
                                                                        25.0,
                                                                    tailLength:
                                                                        15.0,
                                                                    waitDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                100),
                                                                    showDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                1500),
                                                                    triggerMode:
                                                                        TooltipTriggerMode
                                                                            .tap,
                                                                    child: Icon(
                                                                      Icons
                                                                          .info_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.01216,
                                                                5.0,
                                                              ))),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.08515,
                                                                      35.0,
                                                                    ),
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: FutureBuilder<
                                                                List<
                                                                    CuentasNegociosAppRow>>(
                                                              future: (_model.requestCompleter2 ??= Completer<
                                                                      List<
                                                                          CuentasNegociosAppRow>>()
                                                                    ..complete(
                                                                        CuentasNegociosAppTable()
                                                                            .querySingleRow(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eq(
                                                                        'id_cuenta',
                                                                        widget
                                                                            .idNegocio,
                                                                      ),
                                                                    )))
                                                                  .future,
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            55.0,
                                                                        height:
                                                                            55.0,
                                                                        child:
                                                                            CircularProgressIndicator(
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
                                                                    columnRedesSocialesCuentasNegociosAppRowList =
                                                                    snapshot
                                                                        .data!;
                                                                final columnRedesSocialesCuentasNegociosAppRow =
                                                                    columnRedesSocialesCuentasNegociosAppRowList
                                                                            .isNotEmpty
                                                                        ? columnRedesSocialesCuentasNegociosAppRowList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
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
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.instagram,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.03125,
                                                                                30.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.realizadoCambios = true;
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
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
                                                                                                child: SizedBox(
                                                                                                  child: EstablecerRedSocialWidget(
                                                                                                    redSocial: 'Instagram',
                                                                                                    idNegocio: widget.idNegocio,
                                                                                                    listaRedesSociales: columnRedesSocialesCuentasNegociosAppRow!.redesSociales,
                                                                                                    indice: 0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));

                                                                                        setState(() => _model.requestCompleter2 = null);
                                                                                        await _model.waitForRequestCompleted2();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.03125,
                                                                                          30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if ((columnRedesSocialesCuentasNegociosAppRow?.redesSociales[0]) != 'SinEstablecer')
                                                                                    Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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

                                                                                          setState(() {
                                                                                            _model.linkRedesSociales = columnRedesSocialesCuentasNegociosAppRow!.redesSociales.toList().cast<String>();
                                                                                          });
                                                                                          _model.updateLinkRedesSocialesAtIndex(
                                                                                            0,
                                                                                            (_) => 'SinEstablecer',
                                                                                          );
                                                                                          await CuentasNegociosAppTable().update(
                                                                                            data: {
                                                                                              'redes_sociales': _model.linkRedesSociales,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                          setState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.trashAlt,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.02604,
                                                                                            25.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(
                                                                                    width: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width * 0.0243,
                                                                                  10.0,
                                                                                ))),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.04866,
                                                                            20.0,
                                                                          ))),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.twitter,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.03125,
                                                                                30.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.realizadoCambios = true;
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
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
                                                                                                child: EstablecerRedSocialWidget(
                                                                                                  redSocial: 'Twitter',
                                                                                                  idNegocio: widget.idNegocio,
                                                                                                  listaRedesSociales: columnRedesSocialesCuentasNegociosAppRow!.redesSociales,
                                                                                                  indice: 1,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));

                                                                                        setState(() => _model.requestCompleter2 = null);
                                                                                        await _model.waitForRequestCompleted2();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.03125,
                                                                                          30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if ((columnRedesSocialesCuentasNegociosAppRow?.redesSociales[1]) != 'SinEstablecer')
                                                                                    Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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

                                                                                          setState(() {
                                                                                            _model.linkRedesSociales = columnRedesSocialesCuentasNegociosAppRow!.redesSociales.toList().cast<String>();
                                                                                          });
                                                                                          _model.updateLinkRedesSocialesAtIndex(
                                                                                            1,
                                                                                            (_) => 'SinEstablecer',
                                                                                          );
                                                                                          await CuentasNegociosAppTable().update(
                                                                                            data: {
                                                                                              'redes_sociales': _model.linkRedesSociales,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                          setState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.trashAlt,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.02604,
                                                                                            25.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(
                                                                                    width: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width * 0.0243,
                                                                                  10.0,
                                                                                ))),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.04866,
                                                                            20.0,
                                                                          ))),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
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
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.tiktok,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.03125,
                                                                                30.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.realizadoCambios = true;
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
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
                                                                                                child: EstablecerRedSocialWidget(
                                                                                                  redSocial: 'TikTok',
                                                                                                  idNegocio: widget.idNegocio,
                                                                                                  listaRedesSociales: columnRedesSocialesCuentasNegociosAppRow!.redesSociales,
                                                                                                  indice: 2,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));

                                                                                        setState(() => _model.requestCompleter2 = null);
                                                                                        await _model.waitForRequestCompleted2();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.03125,
                                                                                          30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if ((columnRedesSocialesCuentasNegociosAppRow?.redesSociales[2]) != 'SinEstablecer')
                                                                                    Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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

                                                                                          setState(() {
                                                                                            _model.linkRedesSociales = columnRedesSocialesCuentasNegociosAppRow!.redesSociales.toList().cast<String>();
                                                                                          });
                                                                                          _model.updateLinkRedesSocialesAtIndex(
                                                                                            2,
                                                                                            (_) => 'SinEstablecer',
                                                                                          );
                                                                                          await CuentasNegociosAppTable().update(
                                                                                            data: {
                                                                                              'redes_sociales': _model.linkRedesSociales,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                          setState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.trashAlt,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.02604,
                                                                                            25.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(
                                                                                    width: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width * 0.0243,
                                                                                  10.0,
                                                                                ))),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.04866,
                                                                            20.0,
                                                                          ))),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            FaIcon(
                                                                              FontAwesomeIcons.youtube,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.03125,
                                                                                30.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.realizadoCambios = true;
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
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
                                                                                                child: EstablecerRedSocialWidget(
                                                                                                  redSocial: 'Youtube',
                                                                                                  idNegocio: widget.idNegocio,
                                                                                                  listaRedesSociales: columnRedesSocialesCuentasNegociosAppRow!.redesSociales,
                                                                                                  indice: 3,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));

                                                                                        setState(() => _model.requestCompleter2 = null);
                                                                                        await _model.waitForRequestCompleted2();
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: valueOrDefault<double>(
                                                                                          MediaQuery.sizeOf(context).height * 0.03125,
                                                                                          30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  if ((columnRedesSocialesCuentasNegociosAppRow?.redesSociales[3]) != 'SinEstablecer')
                                                                                    Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
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

                                                                                          setState(() {
                                                                                            _model.linkRedesSociales = columnRedesSocialesCuentasNegociosAppRow!.redesSociales.toList().cast<String>();
                                                                                          });
                                                                                          _model.updateLinkRedesSocialesAtIndex(
                                                                                            3,
                                                                                            (_) => 'SinEstablecer',
                                                                                          );
                                                                                          await CuentasNegociosAppTable().update(
                                                                                            data: {
                                                                                              'redes_sociales': _model.linkRedesSociales,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_cuenta',
                                                                                              widget.idNegocio,
                                                                                            ),
                                                                                          );
                                                                                          setState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.trashAlt,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: valueOrDefault<double>(
                                                                                            MediaQuery.sizeOf(context).height * 0.02604,
                                                                                            25.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(
                                                                                    width: valueOrDefault<double>(
                                                                                  MediaQuery.sizeOf(context).width * 0.0243,
                                                                                  10.0,
                                                                                ))),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(
                                                                              width: valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width *
                                                                                0.04866,
                                                                            20.0,
                                                                          ))),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(
                                                                      SizedBox(
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.015625,
                                                                    15.0,
                                                                  ))),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
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
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      const AvisoEjecutandoWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          await Future.wait([
                                                            Future(() async {
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsLunesValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsMartesValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsMiercolesValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsJuevesValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsViernesValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsSabadoValue!);
                                                              _model.addToListaHorario(
                                                                  _model
                                                                      .choiceChipsDomingoValue!);
                                                              _model.realizadoCambios =
                                                                  false;
                                                            }),
                                                            Future(() async {
                                                              if (_model.urlLogo ==
                                                                      null ||
                                                                  _model.urlLogo ==
                                                                      '') {
                                                                _model.urlLogo =
                                                                    columnDatosNegocioCuentasNegociosAppRow
                                                                        ?.urlLogo;
                                                              }
                                                            }),
                                                          ]);
                                                          await CuentasNegociosAppTable()
                                                              .update(
                                                            data: {
                                                              'nombre': _model
                                                                  .textController1
                                                                  .text,
                                                              'descripcion': _model
                                                                  .textFieldDescripcionTextController
                                                                  .text,
                                                              'ubicacion': _model
                                                                  .textFieldDireccionTextController
                                                                  .text,
                                                              'horario': _model
                                                                  .listaHorario,
                                                              'telefono': _model
                                                                  .textFieldTelefonoTextController
                                                                  .text,
                                                              'pagina_web': _model
                                                                  .textFieldPaginaWebTextController
                                                                  .text,
                                                              'url_logo': _model
                                                                  .urlLogo,
                                                              'tipo_negocio': _model
                                                                  .dropDownTipoNegocioValue,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id_cuenta',
                                                              widget.idNegocio,
                                                            ),
                                                          );
                                                          _model.realizadoCambios =
                                                              false;
                                                          setState(() => _model
                                                                  .requestCompleter1 =
                                                              null);
                                                          await _model
                                                              .waitForRequestCompleted1();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'way6vtr9' /* GUARDAR */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.save,
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
                                                        options:
                                                            FFButtonOptions(
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.041666,
                                                            40.0,
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
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.015625,
                                                                      15.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
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
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'perfil_negocio',
                                                          queryParameters: {
                                                            'idNegocio':
                                                                serializeParam(
                                                              widget.idNegocio,
                                                              ParamType.String,
                                                            ),
                                                            'volverAtras':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'estaVisualizando':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'indiceTabBar':
                                                                serializeParam(
                                                              0,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kb96jg0m' /* VISUALIZAR */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.remove_red_eye,
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
                                                      options: FFButtonOptions(
                                                        height: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.041666,
                                                          40.0,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
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
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.015625,
                                                                    15.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.052083,
                                          50.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.052083,
                                          50.0,
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .grisClaro2,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.015625,
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
                                                          0.015625,
                                                      15.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.010416,
                                                      10.0,
                                                    )),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'edpiusuc' /* PROXIMAMENTE... */,
                                              ),
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02083,
                                                      20.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.060827,
                                                    25.0,
                                                  ),
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.060827,
                                                    25.0,
                                                  ),
                                                  0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'aq5lpef7' /* Esta opción no se encuentra di... */,
                                            ),
                                            textAlign: TextAlign.center,
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
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(
                                          height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.026041,
                                        25.0,
                                      ))),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.052083,
                                          50.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.052083,
                                          50.0,
                                        )),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .grisClaro2,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
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
                                                          0.0104166,
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
                                                          0.0104166,
                                                      10.0,
                                                    )),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2nkc9ty3' /* PROXIMAMENTE... */,
                                              ),
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.02083,
                                                      20.0,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'xxl63ozl' /* Esta opción no se encuentra di... */,
                                          ),
                                          textAlign: TextAlign.center,
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
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'perfil_negocio',
                                              queryParameters: {
                                                'idNegocio': serializeParam(
                                                  widget.idNegocio,
                                                  ParamType.String,
                                                ),
                                                'volverAtras': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                                'estaVisualizando':
                                                    serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                                'indiceTabBar': serializeParam(
                                                  1,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'gj6vzrq2' /* VISUALIZAR */,
                                          ),
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02083,
                                              20.0,
                                            ),
                                          ),
                                          options: FFButtonOptions(
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.041666,
                                              40.0,
                                            ),
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.015625,
                                                    15.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(
                                          height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.026041,
                                        25.0,
                                      ))),
                                    ),
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
            ),
          ),
        ));
  }
}
