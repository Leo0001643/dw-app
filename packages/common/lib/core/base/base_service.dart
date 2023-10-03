import 'package:get/get.dart';

import '../fetch/exception/base_exception.dart';

class BaseService extends GetxService {
  // 错误
  final Rx<BaseException?> _exception = Rx(null);
  BaseException? get exception => _exception.value;
  set exception(BaseException? val) => _exception.value = val;
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
    try {
      if (onStart != null) onStart();
      T response = await future;
      if (onSuccess != null) await onSuccess(response);
      return response;
    } on BaseException catch (error) {
      exception = error;
      if (onError != null) onError(error);
    } catch (_) {
      rethrow;
    } finally {
      if (onComplete != null) onComplete();
    }
    return null;
  }
}
