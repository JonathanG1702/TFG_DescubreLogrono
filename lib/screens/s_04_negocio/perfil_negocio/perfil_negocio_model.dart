import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'dart:async';
import 'perfil_negocio_widget.dart' show PerfilNegocioWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PerfilNegocioModel extends FlutterFlowModel<PerfilNegocioWidget> {
  ///  Local state fields for this page.

  List<String> listadoMarcadores = [];
  void addToListadoMarcadores(String item) => listadoMarcadores.add(item);
  void removeFromListadoMarcadores(String item) =>
      listadoMarcadores.remove(item);
  void removeAtIndexFromListadoMarcadores(int index) =>
      listadoMarcadores.removeAt(index);
  void insertAtIndexInListadoMarcadores(int index, String item) =>
      listadoMarcadores.insert(index, item);
  void updateListadoMarcadoresAtIndex(int index, Function(String) updateFn) =>
      listadoMarcadores[index] = updateFn(listadoMarcadores[index]);

  bool? negocioGuardado = false;

  List<String> listadoLikes = [];
  void addToListadoLikes(String item) => listadoLikes.add(item);
  void removeFromListadoLikes(String item) => listadoLikes.remove(item);
  void removeAtIndexFromListadoLikes(int index) => listadoLikes.removeAt(index);
  void insertAtIndexInListadoLikes(int index, String item) =>
      listadoLikes.insert(index, item);
  void updateListadoLikesAtIndex(int index, Function(String) updateFn) =>
      listadoLikes[index] = updateFn(listadoLikes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in perfil_negocio widget.
  List<CuentasNegociosAppRow>? datosNegocio;
  // Stores action output result for [Backend Call - Query Rows] action in perfil_negocio widget.
  List<ReseasNegociosRow>? resenasNegocio;
  // Stores action output result for [Backend Call - Query Rows] action in perfil_negocio widget.
  List<MarcadoresNegociosUsuarioRow>? negociosMarcadosUsuario;
  Completer<List<MarcadoresNegociosUsuarioRow>>? requestCompleter2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  Completer<List<ReseasNegociosRow>>? requestCompleter1;
  Completer<List<CuentasNegociosAppRow>>? requestCompleter4;
  Completer<List<LikesReseasUsuarioRow>>? requestCompleter3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasUsuariosAppRow>? datosUsuario;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CuentasNegociosAppRow>? datosNegocioResena;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
