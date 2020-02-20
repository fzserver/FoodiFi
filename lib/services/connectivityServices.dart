import 'package:connectivity/connectivity.dart';

class ConnectivityServices {
  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true ;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true ;
    }
    return false; 
  }
}

