import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/dialogos/aviso_cargando/aviso_cargando_widget.dart';
import '/flutter_assets/flutter_flow_expanded_image_view.dart';
import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';
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
            alignment:
            AlignmentDirectional(0, 0).resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: AvisoCargandoWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      if (FFAppState().idUsuarioLogado != null &&
          FFAppState().idUsuarioLogado != '') {
        _model.existeUsuario = await DatosUsuariosAppTable().queryRows(
          queryFn: (q) => q.eq(
            'id_usuario',
            FFAppState().idUsuarioLogado,
          ),
        );
        if (_model.existeUsuario != null &&
            (_model.existeUsuario)!.isNotEmpty) {
          if ((FFAppState().idCuentaLogada != null &&
              FFAppState().idCuentaLogada != '') ||
              (FFAppState().idCuentaNegocio != null &&
                  FFAppState().idCuentaNegocio != '')) {
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
                        0,
                        0,
                        0,
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
                          child: Container(
                            width: double.infinity,
                            height: 180,
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
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://www.visitalogrono.com/wp-content/uploads/2021/09/Calle-Laurel-8-Vargas-min-scaled.jpg',
                                        width: 411,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                            Image.asset(
                                              'assets/images/error_image.png',
                                              width: 411,
                                              height: 200,
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
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://www.callelaurel.org/wp-content/uploads/2021/12/slider-2.jpg',
                                        width: 411,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                            Image.asset(
                                              'assets/images/error_image.png',
                                              width: 411,
                                              height: 200,
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
                                viewportFraction: 1,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enlargeFactor: 0,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                                autoPlayInterval:
                                Duration(milliseconds: (800 + 4000)),
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
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      width: 1,
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
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl:
                                'https://www.callelaurel.org/wp-content/themes/lalaurel/assets/images/guia.png',
                                width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width * 0.8783,
                                  361.0,
                                ),
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.48020,
                                  461.0,
                                ),
                                fit: BoxFit.cover,
                                errorWidget: (context, error, stackTrace) =>
                                    Image.asset(
                                      'assets/images/error_image.png',
                                      width: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width * 0.8783,
                                        361.0,
                                      ),
                                      height: valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).height * 0.48020,
                                        461.0,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await launchURL(
                                    'https://www.callelaurel.org/wp-content/uploads/2023/01/guia-pinchos-2023.pdf');
                              },
                              text: FFLocalizations.of(context).getText(
                                'cz3a1u4w' /* VISUALIZAR */,
                              ),
                              icon: Icon(
                                Icons.remove_red_eye,
                                size: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.02601,
                                  25.0,
                                ),
                              ),
                              options: FFButtonOptions(
                                height: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).height * 0.504166,
                                  40.0,
                                ),
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondary,
                                  fontSize: valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).height *
                                        0.015625,
                                    15.0,
                                  ),
                                  letterSpacing: 0,
                                ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ].divide(SizedBox(height: 10)),
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
