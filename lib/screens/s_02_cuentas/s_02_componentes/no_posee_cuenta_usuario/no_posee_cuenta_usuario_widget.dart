import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_posee_cuenta_usuario_model.dart';
export 'no_posee_cuenta_usuario_model.dart';

class NoPoseeCuentaUsuarioWidget extends StatefulWidget {
  const NoPoseeCuentaUsuarioWidget({super.key});

  @override
  State<NoPoseeCuentaUsuarioWidget> createState() =>
      _NoPoseeCuentaUsuarioWidgetState();
}

class _NoPoseeCuentaUsuarioWidgetState
    extends State<NoPoseeCuentaUsuarioWidget> {
  late NoPoseeCuentaUsuarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoPoseeCuentaUsuarioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
      child: Container(
        width: 311.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'v5lvkr3l' /* Parece que aún no tienes un us... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
