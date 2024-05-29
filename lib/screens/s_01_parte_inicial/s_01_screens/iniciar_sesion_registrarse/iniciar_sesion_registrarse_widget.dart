import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/dialogos/aviso_ejecutando/aviso_ejecutando_widget.dart';
import '/dialogos/servicio_no_disponible/servicio_no_disponible_widget.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import '/screens/s_01_parte_inicial/s_01_components/cabecera_info_app_01/cabecera_info_app01_widget.dart';
import '/screens/s_01_parte_inicial/s_01_components/parte_inferior_idioma_tema/parte_inferior_idioma_tema_widget.dart';
import 'dart:async';
import '/flutter_assets/random_data_util.dart' as random_data;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'iniciar_sesion_registrarse_model.dart';
export 'iniciar_sesion_registrarse_model.dart';

class IniciarSesionRegistrarseWidget extends StatefulWidget {
  const IniciarSesionRegistrarseWidget({super.key});

  @override
  State<IniciarSesionRegistrarseWidget> createState() =>
      _IniciarSesionRegistrarseWidgetState();
}

class _IniciarSesionRegistrarseWidgetState
    extends State<IniciarSesionRegistrarseWidget>
    with TickerProviderStateMixin {
  late IniciarSesionRegistrarseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IniciarSesionRegistrarseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
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
          FFAppState().deleteIdUsuarioLogado();
          FFAppState().idUsuarioLogado = '';
        }),
        Future(() async {
          _model.infoApp = await InfoAppTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'es_publica',
                  true,
                )
                .order('version'),
          );
          await Future.wait([
            Future(() async {
              setState(() {
                FFAppState().tipoVersion = valueOrDefault<String>(
                  _model.infoApp?.first.estadoVersion,
                  'DESCONOCIDO',
                );
              });
            }),
            Future(() async {
              setState(() {
                FFAppState().version = valueOrDefault<String>(
                  _model.infoApp?.first.version,
                  '1.00.01',
                );
              });
            }),
          ]);
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

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textFieldCorreoLTextController ??= TextEditingController();
    _model.textFieldCorreoLFocusNode ??= FocusNode();

    _model.textFieldContrasenaLTextController ??= TextEditingController();
    _model.textFieldContrasenaLFocusNode ??= FocusNode();

    _model.textFieldCorreoRTextController ??= TextEditingController();
    _model.textFieldCorreoRFocusNode ??= FocusNode();

    _model.textFieldContrasenaRTextController ??= TextEditingController();
    _model.textFieldContrasenaRFocusNode ??= FocusNode();

    _model.textFieldRepetirContrasenaRTextController ??=
        TextEditingController();
    _model.textFieldRepetirContrasenaRFocusNode ??= FocusNode();

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
          title: 'IniciarSesion_Registrarse',
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
                        0.0,
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.026,
                          25.0,
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          wrapWithModel(
                            model: _model.cabeceraInfoApp01Model,
                            updateCallback: () => setState(() {}),
                            child: const CabeceraInfoApp01Widget(),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
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
                                  Container(
                                    width: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width * 0.755,
                                      311.0,
                                    ),
                                    height: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).height * 0.525,
                                      505.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: const Alignment(0.0, 0),
                                          child: TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize:
                                                      valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.0135,
                                                    13.0,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            unselectedLabelStyle: const TextStyle(),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            indicatorWeight: 2.0,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'obcb9clx' /* INICIAR SESION */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dlugnt52' /* REGISTRARSE */,
                                                ),
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [() async {}, () async {}][i]();
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        valueOrDefault<double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.0155,
                                                          0.0,
                                                        ),
                                                        0.0,
                                                        0.0),
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
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02,
                                                                    20.0,
                                                                  )),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'oalsefrl' /* Complete los campos a continua... */,
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _model.formKey1,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.073,
                                                              70.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0,
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textFieldCorreoLTextController,
                                                                focusNode: _model
                                                                    .textFieldCorreoLFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textFieldCorreoLTextController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hb9f9uhc' /* Correo electrónico */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                              0.0155,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                              0.0125,
                                                                          12.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          25.0,
                                                                          0.0),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .email_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.026,
                                                                      25.0,
                                                                    ),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .textFieldCorreoLTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.textFieldCorreoLTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
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
                                                                            0.0155,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .emailAddress,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                validator: _model
                                                                    .textFieldCorreoLTextControllerValidator
                                                                    .asValidator(
                                                                        context),
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
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02,
                                                                      20.0,
                                                                    )),
                                                            child: Container(
                                                              height:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.08855,
                                                                85.0,
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Stack(
                                                                children: [
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
                                                                        0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldContrasenaLTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldContrasenaLFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      obscureText:
                                                                          !_model
                                                                              .textFieldContrasenaLVisibility,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'htm6bcn1' /* Contraseña */,
                                                                        ),
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0156,
                                                                                15.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        errorStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            25.0,
                                                                            0.0),
                                                                        prefixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .lock,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        suffixIcon:
                                                                            InkWell(
                                                                          onTap: () =>
                                                                              setState(
                                                                            () =>
                                                                                _model.textFieldContrasenaLVisibility = !_model.textFieldContrasenaLVisibility,
                                                                          ),
                                                                          focusNode:
                                                                              FocusNode(skipTraversal: true),
                                                                          child:
                                                                              Icon(
                                                                            _model.textFieldContrasenaLVisibility
                                                                                ? Icons.visibility_outlined
                                                                                : Icons.visibility_off_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.0156,
                                                                              15.0,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      validator: _model
                                                                          .textFieldContrasenaLTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0.0,
                                                                        valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.0573,
                                                                          55.0,
                                                                        ),
                                                                        valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.0535,
                                                                          22.0,
                                                                        ),
                                                                        0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(5.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '07ewgq7o' /* La contraseña debe tener:
- Mí... */
                                                                                ,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.0156,
                                                                                      15.0,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              5.0,
                                                                          preferredDirection:
                                                                              AxisDirection.left,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              25.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              const Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              const Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Icon(
                                                                            Icons.info,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.025,
                                                                              25.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.01,
                                                          10.0,
                                                        ))),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0156,
                                                                      15.0,
                                                                    )),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            currentUserLocationValue =
                                                                await getCurrentUserLocation(
                                                                    defaultLocation:
                                                                        const LatLng(
                                                                            0.0,
                                                                            0.0));
                                                            var shouldSetState =
                                                                false;
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

                                                            await Future.wait([
                                                              Future(() async {
                                                                _model.sIniciarSesion =
                                                                    await ServiciosAppTable()
                                                                        .queryRows(
                                                                  queryFn:
                                                                      (q) =>
                                                                          q.eq(
                                                                    'id_servicio',
                                                                    '159215f2-a4d9-409d-9c41-c031dd3c1159',
                                                                  ),
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .SIniciarSesion =
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .sIniciarSesion
                                                                        ?.first
                                                                        .estadoServicio,
                                                                    'Desconocido',
                                                                  );
                                                                });
                                                              }),
                                                              Future(() async {
                                                                _model.numRandom =
                                                                    random_data
                                                                        .randomInteger(
                                                                            0,
                                                                            1000);
                                                                await LogsIniciosSesionTable()
                                                                    .insert({
                                                                  'tipo_accion':
                                                                      'InicioSesion',
                                                                  'estado_accion':
                                                                      'ErrorDesconocido',
                                                                  'ubicacion': isWeb
                                                                      ? 'Desconocida'
                                                                      : currentUserLocationValue
                                                                          ?.toString(),
                                                                  'dispositivo':
                                                                      () {
                                                                    if (isAndroid) {
                                                                      return 'Android';
                                                                    } else if (isiOS) {
                                                                      return 'iOS';
                                                                    } else if (isWeb) {
                                                                      return 'Web';
                                                                    } else {
                                                                      return 'Otro';
                                                                    }
                                                                  }(),
                                                                  'fecha': supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                                  'ref_log': _model
                                                                      .numRandom,
                                                                });
                                                                _model.logBD1 =
                                                                    await LogsIniciosSesionTable()
                                                                        .queryRows(
                                                                  queryFn:
                                                                      (q) =>
                                                                          q.eq(
                                                                    'ref_log',
                                                                    _model
                                                                        .numRandom,
                                                                  ),
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                await LogsIniciosSesionTable()
                                                                    .update(
                                                                  data: {
                                                                    'ref_log':
                                                                        null,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'ref_log',
                                                                    _model
                                                                        .numRandom,
                                                                  ),
                                                                );
                                                                await Future
                                                                    .wait([
                                                                  Future(
                                                                      () async {
                                                                    _model.numRandom =
                                                                        null;
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    _model.numLog = _model
                                                                        .logBD1
                                                                        ?.first
                                                                        .idLog;
                                                                  }),
                                                                ]);
                                                              }),
                                                            ]);
                                                            if (FFAppState()
                                                                    .SIniciarSesion ==
                                                                'Activo') {
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  await LogsIniciosSesionTable()
                                                                      .update(
                                                                    data: {
                                                                      'estado_accion':
                                                                          'FallidaValidacionFormulario',
                                                                      'fecha': supaSerialize<
                                                                              DateTime>(
                                                                          getCurrentTimestamp),
                                                                      'descripcion_log':
                                                                          null,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'id_log',
                                                                      _model
                                                                          .numLog,
                                                                    ),
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (shouldSetState) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  if (_model.formKey1
                                                                              .currentState ==
                                                                          null ||
                                                                      !_model
                                                                          .formKey1
                                                                          .currentState!
                                                                          .validate()) {
                                                                    return;
                                                                  }
                                                                  showDialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              const AvisoEjecutandoWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));

                                                                  _model.datosUsuarioBD1 =
                                                                      await DatosUsuariosAppTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) => q
                                                                            .eq(
                                                                      'correo_electronico',
                                                                      _model
                                                                          .textFieldCorreoLTextController
                                                                          .text,
                                                                    ),
                                                                  );
                                                                  shouldSetState =
                                                                      true;
                                                                  if (_model.datosUsuarioBD1 !=
                                                                          null &&
                                                                      (_model.datosUsuarioBD1)!
                                                                          .isNotEmpty) {
                                                                    if (_model
                                                                            .datosUsuarioBD1
                                                                            ?.first
                                                                            .cuentaHabilitada ==
                                                                        true) {
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          GoRouter.of(context)
                                                                              .prepareAuthEvent();

                                                                          final user =
                                                                              await authManager.signInWithEmail(
                                                                            context,
                                                                            _model.textFieldCorreoLTextController.text,
                                                                            _model.textFieldContrasenaLTextController.text,
                                                                          );
                                                                          if (user ==
                                                                              null) {
                                                                            return;
                                                                          }

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          await LogsIniciosSesionTable()
                                                                              .update(
                                                                            data: {
                                                                              'estado_accion': 'CredencialesNoValidas',
                                                                              'fecha': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'descripcion_log': 'Correo con el que se intenta acceder: ${_model.textFieldCorreoLTextController.text}',
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eq(
                                                                              'id_log',
                                                                              _model.numLog,
                                                                            ),
                                                                          );
                                                                          Navigator.pop(
                                                                              context);
                                                                        }),
                                                                      ]);
                                                                      showDialog(
                                                                        barrierDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: const AvisoEjecutandoWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      if (loggedIn ==
                                                                          true) {
                                                                        await Future
                                                                            .wait([
                                                                          Future(
                                                                              () async {
                                                                            await LogsIniciosSesionTable().update(
                                                                              data: {
                                                                                'estado_accion': 'CredencialesValidas',
                                                                                'fecha': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'id_usuario': _model.datosUsuarioBD1?.first.idUsuario,
                                                                                'descripcion_log': null,
                                                                              },
                                                                              matchingRows: (rows) => rows.eq(
                                                                                'id_log',
                                                                                _model.numLog,
                                                                              ),
                                                                            );
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            await DatosUsuariosAppTable().update(
                                                                              data: {
                                                                                'ultimo_inicio_sesion': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'dispotivo_ultimo_inicio_sesion': () {
                                                                                  if (isAndroid) {
                                                                                    return 'Android';
                                                                                  } else if (isiOS) {
                                                                                    return 'iOS';
                                                                                  } else if (isWeb) {
                                                                                    return 'Web';
                                                                                  } else {
                                                                                    return 'Otro';
                                                                                  }
                                                                                }(),
                                                                              },
                                                                              matchingRows: (rows) => rows.eq(
                                                                                'id_usuario',
                                                                                _model.datosUsuarioBD1?.first.idUsuario,
                                                                              ),
                                                                            );
                                                                            await LogsDatosUsuariosTable().insert({
                                                                              'tipo_accion': 'ActualizacionInicioSesion',
                                                                              'estado_accion': 'Realizado',
                                                                              'dispositivo': () {
                                                                                if (isAndroid) {
                                                                                  return 'Android';
                                                                                } else if (isiOS) {
                                                                                  return 'iOS';
                                                                                } else if (isWeb) {
                                                                                  return 'Web';
                                                                                } else {
                                                                                  return 'Otro';
                                                                                }
                                                                              }(),
                                                                              'ubicacion': isWeb ? 'Desconocida' : currentUserLocationValue?.toString(),
                                                                              'id_usuario': _model.datosUsuarioBD1?.first.idUsuario,
                                                                              'fecha': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            });
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().idUsuarioLogado =
                                                                                _model.datosUsuarioBD1!.first.idUsuario;
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            FFAppState().idCuentaLogada =
                                                                                '';
                                                                            FFAppState().idCuentaNegocio =
                                                                                '';
                                                                          }),
                                                                        ]);
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textFieldContrasenaLTextController
                                                                              ?.clear();
                                                                          _model
                                                                              .textFieldCorreoLTextController
                                                                              ?.clear();
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                        if (_model.datosUsuarioBD1?.first.idTipoSuscripcion !=
                                                                            null) {
                                                                          context.goNamedAuth(
                                                                              'seleccionarCuenta',
                                                                              context.mounted);

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        } else {
                                                                          context.goNamedAuth(
                                                                              'seleccionar_TipoPlan',
                                                                              context.mounted);

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        }
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textFieldContrasenaLTextController
                                                                              ?.clear();
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: const Text('ERROR AL INICIAR SESION'),
                                                                              content: const Text('La contraseña introducida no es correcta. Por favor, inténtelo de nuevo.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: const Text('Aceptar'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      }
                                                                    } else {
                                                                      await LogsIniciosSesionTable()
                                                                          .update(
                                                                        data: {
                                                                          'estado_accion':
                                                                              'CuentaInhabilitada',
                                                                          'fecha':
                                                                              supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          'descripcion_log':
                                                                              'Correo introducido:  ${_model.textFieldCorreoLTextController.text}',
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eq(
                                                                          'id_log',
                                                                          _model
                                                                              .numLog,
                                                                        ),
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldCorreoLTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .textFieldContrasenaLTextController
                                                                            ?.clear();
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('ERROR AL INICIAR SESION'),
                                                                            content:
                                                                                const Text('Su cuenta no se encuentra disponible'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: const Text('Aceptar'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    await LogsIniciosSesionTable()
                                                                        .update(
                                                                      data: {
                                                                        'estado_accion':
                                                                            'NoExisteCorreo',
                                                                        'fecha':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                        'descripcion_log':
                                                                            'Correo introducido:  ${_model.textFieldCorreoLTextController.text}',
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id_log',
                                                                        _model
                                                                            .numLog,
                                                                      ),
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textFieldCorreoLTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .textFieldContrasenaLTextController
                                                                          ?.clear();
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('LA CUENTA NO EXISTE'),
                                                                          content:
                                                                              const Text('No existe una cuenta vinculada a el correo electrónico que has proporcionado'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Aceptar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                }),
                                                              ]);
                                                            } else {
                                                              await LogsIniciosSesionTable()
                                                                  .update(
                                                                data: {
                                                                  'estado_accion':
                                                                      'ServicioNoDisponible',
                                                                  'fecha': supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                                  'descripcion_log':
                                                                      'Servicio: IniciarSesion - Estado: ${FFAppState().SIniciarSesion}',
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id_log',
                                                                  _model.numLog,
                                                                ),
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .textFieldCorreoLTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldContrasenaLTextController
                                                                    ?.clear();
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
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
                                                                            Directionality.of(context)),
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
                                                                          ServicioNoDisponibleWidget(
                                                                        servicio:
                                                                            'Iniciar Sesion',
                                                                        estadoServicio:
                                                                            valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .SIniciarSesion,
                                                                          'Desconocido',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ym6pldhf' /* INICIAR SESION */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.681,
                                                              280.0,
                                                            ),
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.0415,
                                                              40.0,
                                                            ),
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        25.0,
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
                                                                .error,
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.0156,
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
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.026,
                                                                    25.0,
                                                                  )),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'laftcho1' /* CONTINUAR CON GOOGLE */,
                                                        ),
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .google,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0156,
                                                            15.0,
                                                          ),
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.681,
                                                            280.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0415,
                                                            40.0,
                                                          ),
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      25.0,
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
                                                                              .width *
                                                                          0.0156,
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
                                                                      25.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2glmpa98' /* ¿Has olvidado tu contraseña? */,
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
                                                                  0.0156,
                                                              15.0,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
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
                                                        context.pushNamed(
                                                            'restablecerContrasena');
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'nnhbia2s' /* Restablecer contraseña */,
                                                        ),
                                                        style:
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
                                                                        0.0156,
                                                                    15.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
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
                                                                  valueOrDefault<
                                                                      double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.02,
                                                                    20.0,
                                                                  )),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4fga3psf' /* Complete los campos a continua... */,
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
                                                                  fontSize:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.0156,
                                                                    15.0,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _model.formKey2,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.073,
                                                              70.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0,
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textFieldCorreoRTextController,
                                                                focusNode: _model
                                                                    .textFieldCorreoRFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textFieldCorreoRTextController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5u88nob8' /* Correo electronico */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                              0.0156,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                              0.0125,
                                                                          12.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          25.0,
                                                                          0.0),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .email_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.026,
                                                                      25.0,
                                                                    ),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .textFieldCorreoRTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.textFieldCorreoRTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
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
                                                                            0.0156,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .emailAddress,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                validator: _model
                                                                    .textFieldCorreoRTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.073,
                                                              70.0,
                                                            ),
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0,
                                                                      valueOrDefault<
                                                                          double>(
                                                                        MediaQuery.sizeOf(context).width *
                                                                            0.0365,
                                                                        15.0,
                                                                      ),
                                                                      0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textFieldContrasenaRTextController,
                                                                focusNode: _model
                                                                    .textFieldContrasenaRFocusNode,
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done,
                                                                obscureText: !_model
                                                                    .textFieldContrasenaRVisibility,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'wxhgr7e1' /* Contraseña */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                              0.0156,
                                                                          15.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                              0.0125,
                                                                          12.0,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  errorStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          25.0,
                                                                          0.0,
                                                                          25.0,
                                                                          0.0),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons.lock,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  suffixIcon:
                                                                      InkWell(
                                                                    onTap: () =>
                                                                        setState(
                                                                      () => _model
                                                                              .textFieldContrasenaRVisibility =
                                                                          !_model
                                                                              .textFieldContrasenaRVisibility,
                                                                    ),
                                                                    focusNode: FocusNode(
                                                                        skipTraversal:
                                                                            true),
                                                                    child: Icon(
                                                                      _model.textFieldContrasenaRVisibility
                                                                          ? Icons
                                                                              .visibility_outlined
                                                                          : Icons
                                                                              .visibility_off_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
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
                                                                            0.0156,
                                                                        15.0,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .textFieldContrasenaRTextControllerValidator
                                                                    .asValidator(
                                                                        context),
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
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.02,
                                                                      20.0,
                                                                    )),
                                                            child: Container(
                                                              height:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.08855,
                                                                85.0,
                                                              ),
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Stack(
                                                                children: [
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
                                                                        0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .textFieldRepetirContrasenaRTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldRepetirContrasenaRFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      obscureText:
                                                                          !_model
                                                                              .textFieldRepetirContrasenaRVisibility,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'd10qyxst' /* Repetir contraseña */,
                                                                        ),
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0156,
                                                                                15.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        errorStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: valueOrDefault<double>(
                                                                                MediaQuery.sizeOf(context).height * 0.0125,
                                                                                12.0,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            25.0,
                                                                            0.0,
                                                                            25.0,
                                                                            0.0),
                                                                        prefixIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .lock,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        suffixIcon:
                                                                            InkWell(
                                                                          onTap: () =>
                                                                              setState(
                                                                            () =>
                                                                                _model.textFieldRepetirContrasenaRVisibility = !_model.textFieldRepetirContrasenaRVisibility,
                                                                          ),
                                                                          focusNode:
                                                                              FocusNode(skipTraversal: true),
                                                                          child:
                                                                              Icon(
                                                                            _model.textFieldRepetirContrasenaRVisibility
                                                                                ? Icons.visibility_outlined
                                                                                : Icons.visibility_off_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.0156,
                                                                              15.0,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      validator: _model
                                                                          .textFieldRepetirContrasenaRTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0.0,
                                                                        valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.0573,
                                                                          55.0,
                                                                        ),
                                                                        valueOrDefault<double>(
                                                                          MediaQuery.sizeOf(context).width *
                                                                              0.0535,
                                                                          22.0,
                                                                        ),
                                                                        0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(5.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'dmvtlor0' /* La contraseña debe tener:
- Mí... */
                                                                                ,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).height * 0.0156,
                                                                                      15.0,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              5.0,
                                                                          preferredDirection:
                                                                              AxisDirection.left,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              25.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              const Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              const Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Icon(
                                                                            Icons.info,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                valueOrDefault<double>(
                                                                              MediaQuery.sizeOf(context).height * 0.025,
                                                                              25.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.01,
                                                          10.0,
                                                        ))),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.0156,
                                                                      15.0,
                                                                    )),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            currentUserLocationValue =
                                                                await getCurrentUserLocation(
                                                                    defaultLocation:
                                                                        const LatLng(
                                                                            0.0,
                                                                            0.0));
                                                            var shouldSetState =
                                                                false;
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

                                                            await Future.wait([
                                                              Future(() async {
                                                                _model.sRegistrarse =
                                                                    await ServiciosAppTable()
                                                                        .queryRows(
                                                                  queryFn:
                                                                      (q) =>
                                                                          q.eq(
                                                                    'id_servicio',
                                                                    'a5af35f7-0eb7-49ab-9582-c13231df8216',
                                                                  ),
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                        .SRegistrarse =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .sRegistrarse
                                                                      ?.first
                                                                      .estadoServicio,
                                                                  'Desconocido',
                                                                );
                                                              }),
                                                              Future(() async {
                                                                _model.numRandom =
                                                                    random_data
                                                                        .randomInteger(
                                                                            0,
                                                                            1000);
                                                                await LogsRegistrosUsuariosTable()
                                                                    .insert({
                                                                  'tipo_accion':
                                                                      'Registro',
                                                                  'estado_accion':
                                                                      'ErrorDesconocido',
                                                                  'ubicacion': isWeb
                                                                      ? 'Desconocida'
                                                                      : currentUserLocationValue
                                                                          ?.toString(),
                                                                  'dispositivo':
                                                                      () {
                                                                    if (isAndroid) {
                                                                      return 'Android';
                                                                    } else if (isiOS) {
                                                                      return 'iOS';
                                                                    } else if (isWeb) {
                                                                      return 'Web';
                                                                    } else {
                                                                      return 'Otro';
                                                                    }
                                                                  }(),
                                                                  'fecha': supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                                  'ref_log': _model
                                                                      .numRandom,
                                                                });
                                                                _model.logBD2 =
                                                                    await LogsRegistrosUsuariosTable()
                                                                        .queryRows(
                                                                  queryFn:
                                                                      (q) =>
                                                                          q.eq(
                                                                    'ref_log',
                                                                    _model
                                                                        .numRandom,
                                                                  ),
                                                                );
                                                                shouldSetState =
                                                                    true;
                                                                await LogsRegistrosUsuariosTable()
                                                                    .update(
                                                                  data: {
                                                                    'ref_log':
                                                                        null,
                                                                  },
                                                                  matchingRows:
                                                                      (rows) =>
                                                                          rows.eq(
                                                                    'ref_log',
                                                                    _model
                                                                        .numRandom,
                                                                  ),
                                                                );
                                                                await Future
                                                                    .wait([
                                                                  Future(
                                                                      () async {
                                                                    _model.numRandom =
                                                                        null;
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    _model.numLog = _model
                                                                        .logBD2
                                                                        ?.first
                                                                        .idLog;
                                                                  }),
                                                                ]);
                                                              }),
                                                            ]);
                                                            if (FFAppState()
                                                                    .SRegistrarse ==
                                                                'Activo') {
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  await LogsRegistrosUsuariosTable()
                                                                      .update(
                                                                    data: {
                                                                      'estado_accion':
                                                                          'FallidaValidacionFormulario',
                                                                      'fecha': supaSerialize<
                                                                              DateTime>(
                                                                          getCurrentTimestamp),
                                                                      'descripcion_log':
                                                                          null,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'id_log',
                                                                      _model
                                                                          .numLog,
                                                                    ),
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (shouldSetState) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  if (_model.formKey2
                                                                              .currentState ==
                                                                          null ||
                                                                      !_model
                                                                          .formKey2
                                                                          .currentState!
                                                                          .validate()) {
                                                                    return;
                                                                  }
                                                                  showDialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              const AvisoEjecutandoWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));

                                                                  _model.datosUsuarioBD2 =
                                                                      await DatosUsuariosAppTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) => q
                                                                            .eq(
                                                                      'correo_electronico',
                                                                      _model
                                                                          .textFieldCorreoRTextController
                                                                          .text,
                                                                    ),
                                                                  );
                                                                  shouldSetState =
                                                                      true;
                                                                  if (!(_model.datosUsuarioBD2 !=
                                                                          null &&
                                                                      (_model.datosUsuarioBD2)!
                                                                          .isNotEmpty)) {
                                                                    if (_model
                                                                            .textFieldContrasenaRTextController
                                                                            .text ==
                                                                        _model
                                                                            .textFieldRepetirContrasenaRTextController
                                                                            .text) {
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          GoRouter.of(context)
                                                                              .prepareAuthEvent();
                                                                          if (_model.textFieldContrasenaRTextController.text !=
                                                                              _model.textFieldRepetirContrasenaRTextController.text) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              const SnackBar(
                                                                                content: Text(
                                                                                  'Passwords don\'t match!',
                                                                                ),
                                                                              ),
                                                                            );
                                                                            return;
                                                                          }

                                                                          final user =
                                                                              await authManager.createAccountWithEmail(
                                                                            context,
                                                                            _model.textFieldCorreoRTextController.text,
                                                                            _model.textFieldContrasenaRTextController.text,
                                                                          );
                                                                          if (user ==
                                                                              null) {
                                                                            return;
                                                                          }

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          await LogsRegistrosUsuariosTable()
                                                                              .update(
                                                                            data: {
                                                                              'estado_accion': 'CredencialesNoValidas',
                                                                              'fecha': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'descripcion_log': 'Correo con el que se intenta crear una cuenta: ${_model.textFieldCorreoRTextController.text}',
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eq(
                                                                              'id_log',
                                                                              _model.numLog,
                                                                            ),
                                                                          );
                                                                          Navigator.pop(
                                                                              context);
                                                                        }),
                                                                      ]);
                                                                      showDialog(
                                                                        barrierDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: const AvisoEjecutandoWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      await DatosUsuariosAppTable()
                                                                          .insert({
                                                                        'correo_electronico': _model
                                                                            .textFieldCorreoRTextController
                                                                            .text,
                                                                        'dispositivo_registro':
                                                                            () {
                                                                          if (isAndroid) {
                                                                            return 'Android';
                                                                          } else if (isiOS) {
                                                                            return 'iOS';
                                                                          } else if (isWeb) {
                                                                            return 'Web';
                                                                          } else {
                                                                            return 'Otro';
                                                                          }
                                                                        }(),
                                                                        'fecha_registro':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                      });
                                                                      _model.datosUsuarioBD3 =
                                                                          await DatosUsuariosAppTable()
                                                                              .queryRows(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.eq(
                                                                          'correo_electronico',
                                                                          _model
                                                                              .textFieldCorreoRTextController
                                                                              .text,
                                                                        ),
                                                                      );
                                                                      shouldSetState =
                                                                          true;
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          await LogsRegistrosUsuariosTable()
                                                                              .update(
                                                                            data: {
                                                                              'estado_accion': 'CredencialesValidas',
                                                                              'fecha': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'id_usuario': _model.datosUsuarioBD3?.first.idUsuario,
                                                                              'descripcion_log': null,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eq(
                                                                              'id_log',
                                                                              _model.numLog,
                                                                            ),
                                                                          );
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          await LogsDatosUsuariosTable()
                                                                              .insert({
                                                                            'tipo_accion':
                                                                                'CreacionUsuario',
                                                                            'estado_accion':
                                                                                'Realizado',
                                                                            'dispositivo':
                                                                                () {
                                                                              if (isAndroid) {
                                                                                return 'Android';
                                                                              } else if (isiOS) {
                                                                                return 'iOS';
                                                                              } else if (isWeb) {
                                                                                return 'Web';
                                                                              } else {
                                                                                return 'Otro';
                                                                              }
                                                                            }(),
                                                                            'ubicacion': isWeb
                                                                                ? 'Desconocida'
                                                                                : currentUserLocationValue?.toString(),
                                                                            'id_usuario':
                                                                                _model.datosUsuarioBD3?.first.idUsuario,
                                                                            'fecha':
                                                                                supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          });
                                                                        }),
                                                                      ]);
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldCorreoRTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .textFieldContrasenaRTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .textFieldRepetirContrasenaRTextController
                                                                            ?.clear();
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('CUENTA CREADA'),
                                                                            content:
                                                                                const Text('La cuenta se ha creado correctamente. Disfruta de la aplicación.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: const Text('Aceptar'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .tabBarController!
                                                                            .animateTo(
                                                                          0,
                                                                          duration:
                                                                              const Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      });

                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    } else {
                                                                      await LogsRegistrosUsuariosTable()
                                                                          .update(
                                                                        data: {
                                                                          'estado_accion':
                                                                              'NoCoincidenContraseñas',
                                                                          'fecha':
                                                                              supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          'descripcion_log':
                                                                              null,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eq(
                                                                          'id_log',
                                                                          _model
                                                                              .numLog,
                                                                        ),
                                                                      );
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .textFieldContrasenaRTextController
                                                                            ?.clear();
                                                                        _model
                                                                            .textFieldRepetirContrasenaRTextController
                                                                            ?.clear();
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('ERROR AL CREAR LA CUENTA'),
                                                                            content:
                                                                                const Text('No se ha podido crear una cuenta debido a que las contraseñas introducidas no coinciden.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: const Text('Aceptar'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    await LogsRegistrosUsuariosTable()
                                                                        .update(
                                                                      data: {
                                                                        'estado_accion':
                                                                            'ExisteCorreo',
                                                                        'fecha':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                        'descripcion_log':
                                                                            'El correo introducido ya tiene una cuenta asignada. Correo: ${_model.textFieldCorreoRTextController.text}',
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id_log',
                                                                        _model
                                                                            .numLog,
                                                                      ),
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .textFieldCorreoRTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .textFieldContrasenaRTextController
                                                                          ?.clear();
                                                                      _model
                                                                          .textFieldRepetirContrasenaRTextController
                                                                          ?.clear();
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('LA CUENTA YA EXISTE'),
                                                                          content:
                                                                              const Text('Ya existe una cuenta vinculada a el correo electrónico que has proporcionado'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Aceptar'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                }),
                                                              ]);
                                                            } else {
                                                              await LogsRegistrosUsuariosTable()
                                                                  .update(
                                                                data: {
                                                                  'estado_accion':
                                                                      'ServicioNoDisponible',
                                                                  'fecha': supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                                  'descripcion_log':
                                                                      'Servicio: Registrarse - Estado: ${FFAppState().SRegistrarse}',
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id_log',
                                                                  _model.numLog,
                                                                ),
                                                              );
                                                              setState(() {
                                                                _model
                                                                    .textFieldCorreoRTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldContrasenaRTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldRepetirContrasenaRTextController
                                                                    ?.clear();
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
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
                                                                            Directionality.of(context)),
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
                                                                          ServicioNoDisponibleWidget(
                                                                        servicio:
                                                                            'Registrarse',
                                                                        estadoServicio:
                                                                            valueOrDefault<String>(
                                                                          FFAppState()
                                                                              .SRegistrarse,
                                                                          'Desconocido',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              if (shouldSetState) {
                                                                setState(() {});
                                                              }
                                                              return;
                                                            }

                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'bnciyp5f' /* REGISTRASE */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.681,
                                                              280.0,
                                                            ),
                                                            height:
                                                                valueOrDefault<
                                                                    double>(
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.0415,
                                                              40.0,
                                                            ),
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25.0,
                                                                        0.0,
                                                                        25.0,
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
                                                                .error,
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
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.0156,
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
                                                                        25.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          var shouldSetState =
                                                              false;
                                                          _model.estadoServicioRegistrarseGoogle =
                                                              await ServiciosAppTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id_servicio',
                                                              '2',
                                                            ),
                                                          );
                                                          shouldSetState =
                                                              true;
                                                          setState(() {
                                                            FFAppState()
                                                                    .SRegistrarseGoogle =
                                                                valueOrDefault<
                                                                    String>(
                                                              _model
                                                                  .estadoServicioRegistrarseGoogle
                                                                  ?.first
                                                                  .estadoServicio,
                                                              'Desconocido',
                                                            );
                                                          });
                                                          if (FFAppState()
                                                                  .SIniciarSesionGoogle ==
                                                              'Activo') {
                                                            if (shouldSetState) {
                                                              setState(() {});
                                                            }
                                                            return;
                                                          }

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
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      ServicioNoDisponibleWidget(
                                                                    servicio:
                                                                        'Iniciar Sesion con Google',
                                                                    estadoServicio:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      FFAppState()
                                                                          .SIniciarSesionGoogle,
                                                                      'Desconocido',
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gg6i46eu' /* CONTINUAR CON GOOGLE */,
                                                        ),
                                                        icon: const FaIcon(
                                                          FontAwesomeIcons
                                                              .google,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: valueOrDefault<
                                                              double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.681,
                                                            280.0,
                                                          ),
                                                          height:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.0415,
                                                            40.0,
                                                          ),
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      25.0,
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
                                                                        15.0,
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
                                                                      25.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.072916,
                                    70.0,
                                  ),
                                  0.0,
                                  0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!(isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible))
                                    Expanded(
                                      child: wrapWithModel(
                                        model:
                                            _model.parteInferiorIdiomaTemaModel,
                                        updateCallback: () => setState(() {}),
                                        child: const ParteInferiorIdiomaTemaWidget(),
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
              ),
            ),
          )),
    );
  }
}
