import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/flutter_assets/flutter_flow_expanded_image_view.dart';
import '/flutter_assets/flutter_flow_pdf_viewer.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'inicio_model.dart';
export 'inicio_model.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  late InicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioModel());

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

      if (FFAppState().idUsuarioLogado != '') {
        _model.existeUsuario = await DatosUsuariosAppTable().queryRows(
          queryFn: (q) => q.eq(
            'id_usuario',
            FFAppState().idUsuarioLogado,
          ),
        );
        if (_model.existeUsuario != null &&
            (_model.existeUsuario)!.isNotEmpty) {
          if ((FFAppState().idCuentaLogada != '') ||
              (FFAppState().idCuentaNegocio != '')) {
            Navigator.pop(context);
            return;
          } else {
            Navigator.pop(context);

            context.goNamedAuth('seleccionarCuenta', context.mounted);

            return;
          }
        } else {
          await Future.wait([
            Future(() async {
              FFAppState().deleteIdUsuarioLogado();
              FFAppState().idUsuarioLogado = '';
            }),
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

          context.goNamedAuth('iniciarSesion_Registrarse', context.mounted);

          return;
        }
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        Navigator.pop(context);

        context.goNamedAuth('iniciarSesion_Registrarse', context.mounted);

        return;
      }
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
          title: 'Inicio',
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
                        0.0,
                        0.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).height * 0.078125,
                          75.0,
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.2083,
                            200.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 180.0,
                            child: CarouselSlider(
                              items: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            'https://www.visitalogrono.com/wp-content/uploads/2021/09/Calle-Laurel-8-Vargas-min-scaled.jpg',
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag1',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag1',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://www.visitalogrono.com/wp-content/uploads/2021/09/Calle-Laurel-8-Vargas-min-scaled.jpg',
                                        width: 411.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: 411.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
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
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            'https://www.callelaurel.org/wp-content/uploads/2021/12/slider-2.jpg',
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag2',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag2',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://www.callelaurel.org/wp-content/uploads/2021/12/slider-2.jpg',
                                        width: 411.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: 411.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: 1,
                                viewportFraction: 1.0,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enlargeFactor: 0.0,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayInterval:
                                    const Duration(milliseconds: (800 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.02433,
                                          10.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.0052083,
                                          5.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width *
                                              0.02433,
                                          10.0,
                                        ),
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).height *
                                              0.0052083,
                                          5.0,
                                        )),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'e9ljxpeu' /* GUIA PINCHOS 2023 */,
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
                                ),
                              ],
                            ),
                            FlutterFlowPdfViewer(
                              networkPath:
                                  'https://www.callelaurel.org/wp-content/uploads/2023/01/guia-pinchos-2023.pdf',
                              height: valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.4166,
                                400.0,
                              ),
                              horizontalScroll: false,
                            ),
                          ].divide(const SizedBox(height: 10.0)),
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
