import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      print('Connectivity Check Error: $e');
      return false;
    }
  }

  static Stream<ConnectivityResult> connectivityStream() {
    return _connectivity.onConnectivityChanged;
  }

  static Future<void> showConnectivitySnackBar(BuildContext context) async {
    final isConnected = await checkConnectivity();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isConnected ? 'Internet Connected' : 'No Internet Connection',
        ),
        backgroundColor: isConnected ? Colors.green : Colors.red,
      ),
    );
  }
} 