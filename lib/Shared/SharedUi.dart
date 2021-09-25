
class SharedData {
  static bool firstUse = true;
  static const int color_greenLight = 0xff88c530;
  static const int color_pinkLight = 0xffff7243;
  static const int color_cyanLight = 0xff4372ff;
  static const int color_BlueLight = 0xff1c9eeb;
  static const int color_BlueDark = 0xff0600b2;
  static const int color_VioletDark = 0xff360266;
  static const int color_VioletLight = 0xff7220bd;

  static final SharedData _sharedData = new SharedData._internal();
  bool connected = false;
  factory SharedData() {
    return _sharedData;
  }
  SharedData._internal();
}
