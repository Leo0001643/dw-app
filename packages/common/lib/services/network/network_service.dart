import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum NetworkState {
  normal,
  checking,
  noConnection,
  noInternet,
}

extension GetString on NetworkState {
  String get text {
    switch (this) {
      case NetworkState.normal:
        return '网络已连接。';
      case NetworkState.checking:
        return '正在检查网络质量。。。';
      case NetworkState.noConnection:
        return '无网络链接，请连接网络以继续。';
      case NetworkState.noInternet:
        return '该连接无法访问网络。';
    }
  }
}

class NetworkService extends GetxService {
  static NetworkService get to => Get.find();

  final Connectivity _connectivity = Connectivity();

  late final StreamController<NetworkState> _streamController;

  StreamSink get _sink => _streamController.sink;

  // 对外暴露stream
  Stream<NetworkState> get stream => _streamController.stream;

  // 内部 subscription
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  // 网络连接类型
  final Rx<ConnectivityResult> _connectivityResult = Rx(
    ConnectivityResult.wifi,
  );

  ConnectivityResult get connectivityResult => _connectivityResult.value;

  set connectivityResult(val) => _connectivityResult.value = val;

  final Rx<NetworkState> _networkState = Rx(NetworkState.normal);

  NetworkState get networkState => _networkState.value;

  set networkState(NetworkState val) => _networkState.value = val;

  bool isInit = false;

  @override
  void onInit() async  {
    super.onInit();
    _streamController = StreamController<NetworkState>.broadcast();
  }

  @override
  void onReady() async {
    super.onReady();
    if (kReleaseMode) {
      _connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectivityResult = result;

    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      if (!isInit) {
        isInit = true;
      } else {
        networkState = NetworkState.checking;
        _sink.add(NetworkState.checking);
      }
      try {
        await Dio().get('https://www.baidu.com/');
        networkState = NetworkState.normal;
        _sink.add(NetworkState.normal);
      } catch (err) {
        _sink.add(NetworkState.noInternet);
        networkState = NetworkState.noInternet;
      }
    } else {
      _sink.add(NetworkState.noConnection);
      networkState = NetworkState.noConnection;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    _streamController.close();

    super.onClose();
  }
}
