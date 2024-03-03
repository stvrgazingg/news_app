import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivity {
  static isConnected() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (ConnectivityResult.none == connectivityResult) {
      return false;
    } else {
      return true;
    }
  }
}
