import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'aviso_ejecutando_model.dart';
export 'aviso_ejecutando_model.dart';

class AvisoEjecutandoWidget extends StatefulWidget {
  const AvisoEjecutandoWidget({super.key});

  @override
  State<AvisoEjecutandoWidget> createState() => _AvisoEjecutandoWidgetState();
}

class _AvisoEjecutandoWidgetState extends State<AvisoEjecutandoWidget> {
  late AvisoEjecutandoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvisoEjecutandoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).grisClaro2,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width * 0.0365,
              15.0,
            ),
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.0155,
              15.0,
            ),
            15.0,
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).height * 0.0155,
              15.0,
            )),
        child: Text(
          FFLocalizations.of(context).getText(
            'buq4d15j' /* EJECUTANDO... */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                fontSize: valueOrDefault<double>(
                  MediaQuery.sizeOf(context).height * 0.02,
                  20.0,
                ),
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
