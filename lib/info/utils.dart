import "package:device_info_plus/device_info_plus.dart";
import "package:logger/logger.dart";

class Utils {
  Utils();

  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Logger logger = Logger();

  Future<AndroidDeviceInfo> getAndroidInfo() async {
    final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    logger.d(info);
    return info;
  }
}
