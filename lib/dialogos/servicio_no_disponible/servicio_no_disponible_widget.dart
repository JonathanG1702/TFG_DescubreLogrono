import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import '/flutter_assets/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'servicio_no_disponible_model.dart';
export 'servicio_no_disponible_model.dart';

class ServicioNoDisponibleWidget extends StatefulWidget {
  const ServicioNoDisponibleWidget({
    super.key,
    required this.servicio,
    required this.estadoServicio,
  });

  final String? servicio;
  final String? estadoServicio;

  @override
  State<ServicioNoDisponibleWidget> createState() =>
      _ServicioNoDisponibleWidgetState();
}

class _ServicioNoDisponibleWidgetState
    extends State<ServicioNoDisponibleWidget> {
  late ServicioNoDisponibleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicioNoDisponibleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 341.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'El servicio \"${widget.servicio}\" no se encuentra disponible en estos momentos. Intentalo más tarde',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'pcq5svet' /* Estado: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.estadoServicio,
                      'Desconocido',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'ymewvigl' /* ACEPTAR */,
                ),
                options: FFButtonOptions(
                  height: 30.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 15.0,
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
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
