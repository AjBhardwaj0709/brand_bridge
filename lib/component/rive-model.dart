import 'package:rive/rive.dart';

class RiveModel {
  late final String src, artboard, machine;
  late SMIBool? status;

  RiveModel({
    required this.src,
    required this.artboard,
    required this.machine,
     this.status,
  });

  set setStatus(SMIBool state) {
    status = state;
  }
}
