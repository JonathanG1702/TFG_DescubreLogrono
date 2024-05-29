import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'inicio_widget.dart' show InicioWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in inicio widget.
  List<DatosUsuariosAppRow>? existeUsuario;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
