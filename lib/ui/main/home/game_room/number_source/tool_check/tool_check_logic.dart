import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';

import 'tool_check_state.dart';

class ToolCheckLogic extends GetxController {
  final ToolCheckState state = ToolCheckState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void onValid(){
    if(unEmpty(state.inputHash)){

      List<int> bytes = utf8.encode(state.inputHash); // 将字符串编码为字节序列
      Digest sha256Result = sha256.convert(bytes); // 计算 SHA-256 散列值
      state.sha256.value = sha256Result.toString(); // 将散列值转换为字符串

      if(state.sha256.value.length > 16){

        state.before16.value = state.sha256.value.substring(0,16);

        var cover10 = BigInt.parse(state.before16.value, radix: 16);

        state.convert10.value = "$cover10";

        // 计算 2 的 64 次方，并将其转换为 BigInt 类型
        BigInt divisor = BigInt.from(2).pow(64);

        state.equation2_64.value = "${cover10 / divisor}";

        //截取最终开奖结果
        var dotIndex = state.equation2_64.value.indexOf(".") + 1;
        state.lottery_num.value = state.equation2_64.value.substring(dotIndex,dotIndex+3);

      }

    }
  }


//c42c19575b85ea22577e2433657c8d92b62b19372f2744b1e9d10f03be3eeaab1aacefcc93bfc709fb7f6f46dfbcff582e19b0bdd4d1ad62fa684cb8f273433e8f67f6a0efa533816641dac983e58df3a461eb1fbaa14b98ba1412cf75a87ed1

}
