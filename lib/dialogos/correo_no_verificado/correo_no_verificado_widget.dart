import '/flutter_assets/flutter_flow_theme.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'correo_no_verificado_model.dart';
export 'correo_no_verificado_model.dart';

class CorreoNoVerificadoWidget extends StatefulWidget {
  const CorreoNoVerificadoWidget({
    super.key,
    required this.servicio,
    required this.estadoServicio,
  });

  final String? servicio;
  final String? estadoServicio;

  @override
  State<CorreoNoVerificadoWidget> createState() =>
      _CorreoNoVerificadoWidgetState();
}

class _CorreoNoVerificadoWidgetState extends State<CorreoNoVerificadoWidget> {
  late CorreoNoVerificadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CorreoNoVerificadoModel());

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
        width: 311.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          children: [],
        ),
      ),
    );
  }
}
