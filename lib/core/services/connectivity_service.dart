import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    print(initialStatus);
    isConnected.value = initialStatus != ConnectivityResult.none;
    if (isConnected.value == false) {
      // If not connected at initialization, show a snackbar
      log('offline');
      // SnackbarManager.showSnackbar(
      //   "Offline",
      //   "No internet connection.",
      //   icon: Icon(Icons.wifi_off_outlined, color: customColors.primaryText),
      //   backgroundColor: customColors.primaryBackground,
      // );
      _firstCheck = false; // Update first check status
    }

    // Listening for connectivity changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print("Current connectivity status: $result");
      bool previousState = isConnected.value;
      isConnected.value = result != ConnectivityResult.none;

      print("Is connected: ${isConnected.value}");
      if (!_firstCheck && previousState != isConnected.value) {
        if (isConnected.value) {
          // When connectivity returns
          print("We are back online");
          log('online');
          // Optional: Uncomment and adjust SnackbarManager to show a snackbar here
        } else {
          // When connectivity is lost
          print("We are offline");
          log('offline');
          // Optional: Uncomment and adjust SnackbarManager to show a snackbar here
        }
      }
      _firstCheck = false; // Update the first check flag after the first run
    });
  }
}
