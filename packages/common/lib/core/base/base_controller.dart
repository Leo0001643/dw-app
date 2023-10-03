import 'package:aone_common/core/fetch/exception/base_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {

  // 页面状态
  final Rx<PageState> _pageState = PageState.idle.obs;
  PageState get pageState => _pageState.value;
  Rx<PageState> get pageStateObs => _pageState;
  set pageState(PageState val) => _pageState.value = val;

  // 错误
  final Rx<BaseException?> _exception = Rx(null);
  BaseException? get exception => _exception.value;
  set exception(val) => _exception.value = val;

  bool get isPageLoading => pageState == PageState.loading;

  void startLoading() => pageState = PageState.loading;
  void stopLoading() => pageState = PageState.idle;
  void criticalError() => pageState = PageState.error;
  void pageEmpty() => pageState = PageState.empty;

  final List<int> _pendingQueue = [];

  /// [future] providers 方法
  /// 带错误处理的网络请求处理方法
  Future<T?> fetchHandler<T>(
    Future<T> future, {
    Function(BaseException exception)? onError,
    Function(T response)? onSuccess,
    Function()? onStart,
    Function()? onComplete,
    bool loading = false,
  }) async {
    _pendingQueue.add(future.hashCode);
    if (loading) startLoading();
    try {
      if (onStart != null) onStart();
      T response = await future;
      if (onSuccess != null) await onSuccess(response);
      return response;
    } on BaseException catch (error) {
      pageState = PageState.error;
      exception = error;
      if (onError != null) onError(error);
    } catch (_) {
      rethrow;
    } finally {
      _pendingQueue.remove(future.hashCode);
      if (loading && _pendingQueue.isEmpty) stopLoading();
      if (onComplete != null) onComplete();
    }
    return null;
  }
}

enum PageState {
  idle,
  loading,
  error,
  empty,
}
