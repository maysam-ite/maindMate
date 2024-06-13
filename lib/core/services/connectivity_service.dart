import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maindmate/core/shared/widgets/snackbar_manager.dart';
import 'package:maindmate/main.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = false.obs; // Observable for connectivity status
  bool _firstCheck = true; // Flag to track the first connectivity check

  @override
  void onInit() async {
    super.onInit();
    await initConnectivity();
  }

  /// Initializes connectivity monitoring
  initConnectivity() async {
    var initialStatus = await Connectivity().checkConnectivity();
    isConnected.value = initialStatus != ConnectivityResult.none;
    if (isConnected.value == false) {
      // If not connected at initialization, show a snackbar
      SnackbarManager.showSnackbar(
        "No internet connection.",
        icon: Icon(Icons.wifi_off_outlined, color: appTheme.primaryText),
        backgroundColor: appTheme.primaryBackground,
      );
      _firstCheck = false; // Update first check status
    }

    // Listening for connectivity changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool previousState = isConnected.value;
      isConnected.value = result != ConnectivityResult.none;

      if (!_firstCheck && previousState != isConnected.value) {
        if (isConnected.value) {
          // When connectivity returns
          SnackbarManager.showSnackbar(
            "internet connected.",
            icon: Icon(Icons.wifi_off_outlined, color: appTheme.primaryText),
            backgroundColor: appTheme.primaryBackground,
          );

          // Optional: Uncomment and adjust SnackbarManager to show a snackbar here
        } else {
          // When connectivity is lost
          SnackbarManager.showSnackbar(
            "No internet connection.",
            icon: Icon(Icons.wifi_off_outlined, color: appTheme.primaryText),
            backgroundColor: appTheme.primaryBackground,
          );

          // Optional: Uncomment and adjust SnackbarManager to show a snackbar here
        }
      }
      _firstCheck = false; // Update the first check flag after the first run
    });
  }
}
