import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/withdraw_check_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/withdraw_check_entity.g.dart';

@JsonSerializable()
class WithdrawCheckEntity {
	double? allNeedFee;//所有稽核手续费
	double? normalFee;//常态稽核手续费
	double? poromsFee;//优惠稽核手续费
	double? replyFee;//重复出款手续费
	int? replyTime;//重复出款次数
	int? replyHours;//重复出款小时数
	int? timeFeeStatus;//时效稽核状态(1:通过,2:未通过)
	double? timeFeePercent;//时效稽核百分比
	int? timeFeeBetNum;//时效稽核需要打码倍数
	int? timeFeeHours;//时效稽核小时数
	double? totalValidamount;//时效稽核区间总有效打码量
	int? takeMoneyMax;//最大出款金额
	int? takeMoneyMin;//最小出款金额
	String? addTime;//稽核时间

	int? checkType;//稽核类型  1 CNY  5USDT

	WithdrawCheckEntity();

	factory WithdrawCheckEntity.fromJson(Map<String, dynamic> json) => $WithdrawCheckEntityFromJson(json);

	Map<String, dynamic> toJson() => $WithdrawCheckEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	String poromsFeeHint(){
		if(poromsFee.em() > 0){
			return Intr().meiyoutongguoyouhui_([poromsFee.em().toString()]);
		}else {
			 return Intr().tongguoyouhuijihe;
		}
	}

	String normalFeeHint(){
		if(normalFee.em() > 0){
			return Intr().meiyoutongguochangtaixing_([normalFee.em().toString()]);
		}else {
			return Intr().tongguochangtaixing;
		}
	}

	String replyFeeHint(){
		if(replyFee.em() > 0){
			return Intr().yixiaoshineimian_([replyHours.em().toString(),replyTime.em().toString(),
				Intr().xukouchushouxufei_([replyFee.em().toString()])]);
		} else {
			return Intr().yixiaoshineimian_([replyHours.em().toString(),replyTime.em().toString(),
				Intr().mianshoushouxufei]);
		}
	}

	String timeFeeHint(){
		//时效稽核状态(1:通过,2:未通过)
		if(timeFeeStatus == 2){
			return Intr().shixiaokouchu_([timeFeeHours.em().toString(),"${timeFeePercent.em()}%",]);
		} else {
			return Intr().shixiaomianshou_([timeFeeHours.em().toString(),]);
		}
	}




}