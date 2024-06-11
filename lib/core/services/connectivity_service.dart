import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = false.obs; // Observable for connectivity status
  bool _firstCheck = true; // Flag to track the first connectivity check

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
  }

  /// Initializes connectivity monitoring
  Future<ConnectivityService> initConnectivity() async {
    var initialStatus = await Connectivity().checkConnectivity();
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
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      bool previousState = isConnected.value;
      isConnected.value = result != ConnectivityResult.none;

      if (!_firstCheck && previousState != isConnected.value) {
        if (isConnected.value) {
          // When connectivity returns
      log('online');
          // SnackbarManager.showSnackbar(
          //   "Online",
          //   "You are back online.",
          //   icon: Icon(Icons.wifi_outlined, color: customColors.primaryText),
          //   backgroundColor: customColors.primaryBackground,
          // );
        } else {
          // When connectivity is lost
          log('offline');
          // SnackbarManager.showSnackbar(
          //   "Offline",
          //   "No internet connection.",
          //   icon: Icon(Icons.wifi_off_outlined, color: customColors.primaryText),
          //   backgroundColor: customColors.primaryBackground,
          // );
        }
      }
      _firstCheck = false; // Update the first check flag after first run
    });
    return this;
  }
}
