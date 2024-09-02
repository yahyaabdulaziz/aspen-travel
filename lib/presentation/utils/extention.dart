import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  double percentHeight(double percent) =>
      MediaQuery.of(this).size.height * percent / 100;

  double percentWidth(double percent) =>
      MediaQuery.of(this).size.width * percent / 100;
}

extension NetworkExtensions on Connectivity {
  Future<bool> get isInternetConnected async {
    List<ConnectivityResult> connectivityResult = await checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }
}
