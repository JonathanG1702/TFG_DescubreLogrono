import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import '/screens/s_02_cuentas/s_02_componentes/cabecera_info_app_02/cabecera_info_app02_widget.dart';
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'completar_datos_usuario_model.dart';
export 'completar_datos_usuario_model.dart';

class CompletarDatosUsuarioWidget extends StatefulWidget {
  const CompletarDatosUsuarioWidget({super.key});

  @override
  State<CompletarDatosUsuarioWidget> createState() =>
      _CompletarDatosUsuarioWidgetState();
}

class _CompletarDatosUsuarioWidgetState
    extends State<CompletarDatosUsuarioWidget> {
  late CompletarDatosUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletarDatosUsuarioModel());

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
          _model.cantMaxCuentasUsuario = valueOrDefault<int>(
            _model.infoSuscripcionUsuario?.first.maxUsuarios,
            1,
          );
        }),
      ]);
      Navigator.pop(context);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textFieldTelefonoTextController ??= TextEditingController();
    _model.textFieldTelefonoFocusNode ??= FocusNode();

    _model.textFieldNombreUsuarioTextController ??= TextEditingController();
    _model.textFieldNombreUsuarioFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'CrearCuenta_Usuario',
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
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.052083,
                        50.0,
                      ),
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.026041,
                        25.0,
                      )),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.parteInferiorIdiomaTemaModel,
                                    updateCallback: () => setState(() {}),
                                    child: const ParteInferiorIdiomaTemaWidget(),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        0.0,
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.01041,
                                          10.0,
                                        )),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '680y05fh' /* CUENTA DE USUARIO */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.0365,
                                          15.0,
                                        ),
                                        0.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.0365,
                                          15.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.02,
                                          20.0,
                                        )),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vp03owqs' /* Estás a punto de crearte una c... */,
                                      ),
                                      textAlign: TextAlign.center,
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.036496,
                                              15.0,
                                            ),
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.036496,
                                              15.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.010416,
                                              10.0,
                                            )),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zazai3lr' /* DATOS PERSONALES */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            AlignedTooltip(
                                              content: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0w9vqn63' /* Los datos definidos como "pers... */,
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
                                                              0.0156,
                                                          15.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              offset: 5.0,
                                              preferredDirection:
                                                  AxisDirection.left,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              elevation: 4.0,
                                              tailBaseWidth: 25.0,
                                              tailLength: 12.0,
                                              waitDuration:
                                                  const Duration(milliseconds: 100),
                                              showDuration:
                                                  const Duration(milliseconds: 1500),
                                              triggerMode:
                                                  TooltipTriggerMode.tap,
                                              child: Icon(
                                                Icons.info,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.025,
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(
                                              width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ))),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.0365,
                                              15.0,
                                            ),
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.0365,
                                              15.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.02083,
                                              20.0,
                                            )),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                          0.012165,
                                                      5.0,
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
                                                          0.012165,
                                                      5.0,
                                                    ),
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.0052083,
                                                      5.0,
                                                    )),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.01216545,
                                                                    5.0,
                                                                  ),
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: valueOrDefault<
                                                            double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.025,
                                                          25.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mondtqo7' /* Edad */,
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
                                                                  0.0155,
                                                              15.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(SizedBox(
                                                      width: valueOrDefault<
                                                          double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.02433,
                                                    10.0,
                                                  ))),
                                                ),
                                                SliderTheme(
                                                  data: const SliderThemeData(
                                                    showValueIndicator:
                                                        ShowValueIndicator
                                                            .always,
                                                  ),
                                                  child: Slider(
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    inactiveColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    min: 16.0,
                                                    max: 120.0,
                                                    value: _model
                                                        .sliderValue ??= 18.0,
                                                    label: _model.sliderValue
                                                        ?.toStringAsFixed(0),
                                                    onChanged: (newValue) {
                                                      newValue = double.parse(
                                                          newValue
                                                              .toStringAsFixed(
                                                                  0));
                                                      setState(() =>
                                                          _model.sliderValue =
                                                              newValue);
                                                    },
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
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey2,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.01,
                                                    10.0,
                                                  )),
                                          child: Container(
                                            height: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.073,
                                              70.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.0365,
                                                        15.0,
                                                      ),
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.0365,
                                                        15.0,
                                                      ),
                                                      0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldTelefonoTextController,
                                                focusNode: _model
                                                    .textFieldTelefonoFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldTelefonoTextController',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: false,
                                                textCapitalization:
                                                    TextCapitalization.none,
                                                textInputAction:
                                                    TextInputAction.done,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'jrwcddho' /* Número de teléfono */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.0155,
                                                          15.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.0125,
                                                          12.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        fontSize:
                                                            valueOrDefault<
                                                                double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.0125,
                                                          12.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(25.0, 0.0,
                                                              25.0, 0.0),
                                                  prefixIcon: Icon(
                                                    Icons.phone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size:
                                                        valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.026,
                                                      25.0,
                                                    ),
                                                  ),
                                                  suffixIcon: _model
                                                          .textFieldTelefonoTextController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFieldTelefonoTextController
                                                                ?.clear();
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 25.0,
                                                          ),
                                                        )
                                                      : null,
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
                                                            0.0155,
                                                        15.0,
                                                      ),
                                                      letterSpacing: 0.0,
                                                    ),
                                                keyboardType:
                                                    TextInputType.phone,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                validator: _model
                                                    .textFieldTelefonoTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.textFieldTelefonoMask
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.036496,
                                              15.0,
                                            ),
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.036496,
                                              15.0,
                                            ),
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.010416,
                                              10.0,
                                            )),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'taleob83' /* DATOS USUARIO */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            AlignedTooltip(
                                              content: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mxqg4msa' /* Los datos definidos como "usua... */,
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
                                                              0.0156,
                                                          15.0,
                                                        ),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              offset: 5.0,
                                              preferredDirection:
                                                  AxisDirection.left,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              elevation: 4.0,
                                              tailBaseWidth: 25.0,
                                              tailLength: 12.0,
                                              waitDuration:
                                                  const Duration(milliseconds: 100),
                                              showDuration:
                                                  const Duration(milliseconds: 1500),
                                              triggerMode:
                                                  TooltipTriggerMode.tap,
                                              child: Icon(
                                                Icons.info,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.025,
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(
                                              width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.010416,
                                            10.0,
                                          ))),
                                        ),
                                      ),
                                      Form(
                                        key: _model.formKey1,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      0.0,
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.01,
                                                        10.0,
                                                      )),
                                              child: Container(
                                                height: valueOrDefault<double>(
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.088541,
                                                  85.0,
                                                ),
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.0365,
                                                                    15.0,
                                                                  ),
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.0365,
                                                                    15.0,
                                                                  ),
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldNombreUsuarioTextController,
                                                        focusNode: _model
                                                            .textFieldNombreUsuarioFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textFieldNombreUsuarioTextController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => setState(() {}),
                                                        ),
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'odoz87qv' /* Nombre de usuario */,
                                                          ),
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
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0155,
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
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0125,
                                                                      12.0,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
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
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
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
                                                                        10.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
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
                                                                        10.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
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
                                                                        10.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
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
                                                                        10.0),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      25.0,
                                                                      0.0),
                                                          prefixIcon: Icon(
                                                            Icons.person,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.026,
                                                              25.0,
                                                            ),
                                                          ),
                                                          suffixIcon: _model
                                                                  .textFieldNombreUsuarioTextController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textFieldNombreUsuarioTextController
                                                                        ?.clear();
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 25.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0155,
                                                                    15.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        maxLength: 16,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .enforced,
                                                        keyboardType:
                                                            TextInputType.name,
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .textFieldNombreUsuarioTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .height *
                                                            0.0625,
                                                        60.0,
                                                      ),
                                                      valueOrDefault<double>(
                                                        MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.0364963,
                                                        15.0,
                                                      ),
                                                      0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AlignedTooltip(
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(5.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'y6nb5sdu' /* El nombre de usuario ha de cum... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
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
                                                      ),
                                                    ),
                                                    offset: 5.0,
                                                    preferredDirection:
                                                        AxisDirection.down,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    elevation: 5.0,
                                                    tailBaseWidth: 25.0,
                                                    tailLength: 12.0,
                                                    waitDuration: const Duration(
                                                        milliseconds: 100),
                                                    showDuration: const Duration(
                                                        milliseconds: 1500),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Icon(
                                                      Icons.info_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          if (_model.formKey1.currentState ==
                                                  null ||
                                              !_model.formKey1.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          _model.nombresUsuariosCoinciden =
                                              await CuentasUsuariosAppTable()
                                                  .queryRows(
                                            queryFn: (q) => q.eq(
                                              'nombre_usuario',
                                              _model
                                                  .textFieldNombreUsuarioTextController
                                                  .text,
                                            ),
                                          );
                                          shouldSetState = true;
                                          if (_model.nombresUsuariosCoinciden !=
                                                  null &&
                                              (_model.nombresUsuariosCoinciden)!
                                                  .isNotEmpty) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'NOMBRE DE USUARIO EN USO'),
                                                  content: const Text(
                                                      'El nombre de usuario seleccionado ya está en uso. Por favor, elige otro nombre'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Aceptar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            setState(() {
                                              _model
                                                  .textFieldNombreUsuarioTextController
                                                  ?.clear();
                                            });
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'NOMBRE DE USUARIO VALIDO'),
                                                  content: const Text(
                                                      'El nombre de usuario seleccionado se encuentra disponible'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Aceptar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'h5l1qrp6' /* COMPROBAR DISPONIBILIDAD */,
                                        ),
                                        icon: Icon(
                                          Icons.check_circle_outline_sharp,
                                          size: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.0260416,
                                            25.0,
                                          ),
                                        ),
                                        options: FFButtonOptions(
                                          width: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width *
                                                0.68369,
                                            281.0,
                                          ),
                                          height: valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).height *
                                                0.04166,
                                            40.0,
                                          ),
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
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
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.036458,
                                    35.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        if (_model.formKey2.currentState ==
                                                null ||
                                            !_model.formKey2.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if (_model.formKey1.currentState ==
                                                null ||
                                            !_model.formKey1.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
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

                                        _model.existeNombreUsuario =
                                            await CuentasUsuariosAppTable()
                                                .queryRows(
                                          queryFn: (q) => q.eq(
                                            'nombre_usuario',
                                            _model
                                                .textFieldNombreUsuarioTextController
                                                .text,
                                          ),
                                        );
                                        shouldSetState = true;
                                        if (_model.existeNombreUsuario !=
                                                null &&
                                            (_model.existeNombreUsuario)!
                                                .isNotEmpty) {
                                          setState(() {
                                            _model
                                                .textFieldNombreUsuarioTextController
                                                ?.clear();
                                          });
                                          Navigator.pop(context);
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'NOMBRE DE USUARIO EN USO'),
                                                content: const Text(
                                                    'El nombre de usuario seleccionado ya está en uso. Por favor, elige otro nombre'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Aceptar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (_model.cantCuentasUsuario! <
                                              _model.cantMaxCuentasUsuario!) {
                                            await Future.wait([
                                              Future(() async {
                                                await CuentasUsuariosAppTable()
                                                    .insert({
                                                  'id_usuario': FFAppState()
                                                      .idUsuarioLogado,
                                                  'nombre_usuario': _model
                                                      .textFieldNombreUsuarioTextController
                                                      .text,
                                                  'telefono': _model
                                                      .textFieldTelefonoTextController
                                                      .text,
                                                  'edad':
                                                      valueOrDefault<String>(
                                                    _model.sliderValue
                                                        ?.toString(),
                                                    '16',
                                                  ),
                                                });
                                              }),
                                              Future(() async {
                                                await LikesReseasUsuarioTable()
                                                    .insert({
                                                  'id_usuario': FFAppState()
                                                      .idUsuarioLogado,
                                                });
                                              }),
                                              Future(() async {
                                                await MarcadoresNegociosUsuarioTable()
                                                    .insert({
                                                  'id_usuario': FFAppState()
                                                      .idUsuarioLogado,
                                                });
                                              }),
                                            ]);
                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'CUENTA DE USUARIO CREADA'),
                                                  content: const Text(
                                                      'Tu cuenta de usuario se ha creado correctamente. Disfruta de la aplicación'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Aceptar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                            context
                                                .goNamed('seleccionarCuenta');

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'LIMITE DE CUENTAS ALCANZADO'),
                                                  content: const Text(
                                                      'Has llegado al límite de cuentas de usuario que permite tu suscripción. Si deseas crear una nueva mejora tu suscripción'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Aceptar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }
                                        }

                                        if (shouldSetState) setState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'td1xy9p5' /* CREAR CUENTA */,
                                      ),
                                      options: FFButtonOptions(
                                        width: valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.68369,
                                          281.0,
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.goNamed('seleccionarCuenta');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'p34tq21i' /* VOLVER ATRÁS */,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height *
                                            0.0260416,
                                        25.0,
                                      ),
                                    ),
                                    options: FFButtonOptions(
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width *
                                            0.68369,
                                        281.0,
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: valueOrDefault<double>(
                                              MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.015625,
                                              15.0,
                                            ),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
