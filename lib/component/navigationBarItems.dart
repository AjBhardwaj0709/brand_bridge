import 'rive-model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;
  NavItemModel({
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> bottomItems = [
  NavItemModel(
    title: "Home",
    rive: RiveModel(
      src: "lib/assets/animated_icon.riv",
      artboard: "HOME",
      machine: "HOME_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Chat",
    rive: RiveModel(
      src: "lib/assets/animated_icon.riv",
      artboard: "CHAT",
      machine: "CHAT_Interactivity",
    ),
  ),
  NavItemModel(
    title: "User",
    rive: RiveModel(
      src: "lib/assets/animated_icon.riv",
      artboard: "USER",
      machine: "USER_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Settings",
    rive: RiveModel(
      src: "lib/assets/animated_icon.riv",
      artboard: "SETTINGS",
      machine: "SETTINGS_Interactivity",
    ),
  ),
];
