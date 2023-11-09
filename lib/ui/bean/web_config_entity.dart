import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/web_config_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/web_config_entity.g.dart';

@JsonSerializable()
class WebConfigEntity {
	@JSONField(name: "domain_pc28")
	WebConfigDomainPc28? domainPc28;
	@JSONField(name: "dc_help_domain")
	WebConfigDcHelpDomain? dcHelpDomain;
	String? codeTotal;
	@JSONField(name: "other_config")
	List<String>? otherConfig;
	WebConfigPtgamehost? ptgamehost;
	WebConfigAppDownload? appDownload;
	@JSONField(name: "lotto_line_url")
	WebConfigLottoLineUrl? lottoLineUrl;
	@JSONField(name: "domain_jingdiancai")
	WebConfigDomainJingdiancai? domainJingdiancai;
	@JSONField(name: "QRCode")
	String? qRCode;
	@JSONField(name: "domain_guanfangcai")
	WebConfigDomainGuanfangcai? domainGuanfangcai;
	@JSONField(name: "ag_domain")
	WebConfigAgDomain? agDomain;
	@JSONField(name: "domain_m_guanfangcai")
	WebConfigDomainMGuanfangcai? domainMGuanfangcai;
	@JSONField(name: "domain_m_pc28")
	WebConfigDomainMPc28? domainMPc28;
	@JSONField(name: "domain_m_jingdiancai")
	WebConfigDomainMJingdiancai? domainMJingdiancai;
	@JSONField(name: "register_option")
	List<WebConfigRegisterOption>? registerOption;

	WebConfigEntity();

	factory WebConfigEntity.fromJson(Map<String, dynamic> json) => $WebConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainPc28 {
	@JSONField(name: "check_path")
	String? checkPath;
	List<String>? list;
	@JSONField(name: "url_path")
	String? urlPath;

	WebConfigDomainPc28();

	factory WebConfigDomainPc28.fromJson(Map<String, dynamic> json) => $WebConfigDomainPc28FromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainPc28ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDcHelpDomain {
	@JSONField(name: "url_pay_help")
	String? urlPayHelp;
	@JSONField(name: "url_draw_help")
	String? urlDrawHelp;
	@JSONField(name: "url_cgp_pay_help")
	String? urlCgpPayHelp;
	@JSONField(name: "url_cgp_draw_help")
	String? urlCgpDrawHelp;

	WebConfigDcHelpDomain();

	factory WebConfigDcHelpDomain.fromJson(Map<String, dynamic> json) => $WebConfigDcHelpDomainFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDcHelpDomainToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigPtgamehost {
	List<String>? h5idvar;
	List<String>? fldomain;
	List<String>? h5domain;
	List<String>? list;

	WebConfigPtgamehost();

	factory WebConfigPtgamehost.fromJson(Map<String, dynamic> json) => $WebConfigPtgamehostFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigPtgamehostToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigAppDownload {
	Map<String,WebConfigAppDownloadIos1?>? android;
	Map<String,WebConfigAppDownloadIos1?>? ios;

	WebConfigAppDownload();

	factory WebConfigAppDownload.fromJson(Map<String, dynamic> json) => $WebConfigAppDownloadFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigAppDownloadToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


// @JsonSerializable()
// class WebConfigAppDownloadIos {
// 	WebConfigAppDownloadIos1? 1;
//
// 	WebConfigAppDownloadIos();
//
// 	factory WebConfigAppDownloadIos.fromJson(Map<String, dynamic> json) => $WebConfigAppDownloadIosFromJson(json);
//
// 	Map<String, dynamic> toJson() => $WebConfigAppDownloadIosToJson(this);
//
// 	@override
// 	String toString() {
// 		return jsonEncode(this);
// 	}
// }

@JsonSerializable()
class WebConfigAppDownloadIos1 {
	WebConfigAppDownloadIos1Config? config;

	WebConfigAppDownloadIos1();

	factory WebConfigAppDownloadIos1.fromJson(Map<String, dynamic> json) => $WebConfigAppDownloadIos1FromJson(json);

	Map<String, dynamic> toJson() => $WebConfigAppDownloadIos1ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigAppDownloadIos1Config {
	String? url3;
	String? url1;
	String? url2;

	WebConfigAppDownloadIos1Config();

	factory WebConfigAppDownloadIos1Config.fromJson(Map<String, dynamic> json) => $WebConfigAppDownloadIos1ConfigFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigAppDownloadIos1ConfigToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigLottoLineUrl {
	List<String>? ipsPc;
	List<String>? jdcIp;
	List<dynamic>? gfcips;
	String? stitching;
	List<String>? ips;

	WebConfigLottoLineUrl();

	factory WebConfigLottoLineUrl.fromJson(Map<String, dynamic> json) => $WebConfigLottoLineUrlFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigLottoLineUrlToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainJingdiancai {
	@JSONField(name: "check_path")
	String? checkPath;
	List<String>? list;
	@JSONField(name: "url_path")
	String? urlPath;

	WebConfigDomainJingdiancai();

	factory WebConfigDomainJingdiancai.fromJson(Map<String, dynamic> json) => $WebConfigDomainJingdiancaiFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainJingdiancaiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainGuanfangcai {
	@JSONField(name: "list_test_new")
	List<String>? listTestNew;
	@JSONField(name: "list_new")
	List<String>? listNew;
	@JSONField(name: "check_path")
	String? checkPath;
	@JSONField(name: "list_test")
	List<String>? listTest;
	List<String>? list;

	WebConfigDomainGuanfangcai();

	factory WebConfigDomainGuanfangcai.fromJson(Map<String, dynamic> json) => $WebConfigDomainGuanfangcaiFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainGuanfangcaiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigAgDomain {
	String? name;
	List<String>? list;

	WebConfigAgDomain();

	factory WebConfigAgDomain.fromJson(Map<String, dynamic> json) => $WebConfigAgDomainFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigAgDomainToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainMGuanfangcai {
	@JSONField(name: "list_test_new")
	List<String>? listTestNew;
	@JSONField(name: "list_new")
	List<String>? listNew;
	@JSONField(name: "check_path")
	String? checkPath;
	@JSONField(name: "list_test")
	List<String>? listTest;
	List<String>? list;

	WebConfigDomainMGuanfangcai();

	factory WebConfigDomainMGuanfangcai.fromJson(Map<String, dynamic> json) => $WebConfigDomainMGuanfangcaiFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainMGuanfangcaiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainMPc28 {
	@JSONField(name: "check_path")
	String? checkPath;
	List<String>? list;
	@JSONField(name: "url_path")
	String? urlPath;

	WebConfigDomainMPc28();

	factory WebConfigDomainMPc28.fromJson(Map<String, dynamic> json) => $WebConfigDomainMPc28FromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainMPc28ToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigDomainMJingdiancai {
	@JSONField(name: "check_path")
	String? checkPath;
	List<String>? list;
	@JSONField(name: "url_path")
	String? urlPath;

	WebConfigDomainMJingdiancai();

	factory WebConfigDomainMJingdiancai.fromJson(Map<String, dynamic> json) => $WebConfigDomainMJingdiancaiFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainMJingdiancaiToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WebConfigRegisterOption {
	@JSONField(name: "email_register_option")
	String? emailRegisterOption;
	@JSONField(name: "agent_register_option")
	String? agentRegisterOption;
	@JSONField(name: "weixin_register_option")
	String? weixinRegisterOption;
	@JSONField(name: "mobile_register_option")
	String? mobileRegisterOption;
	@JSONField(name: "qq_register_option")
	String? qqRegisterOption;

	WebConfigRegisterOption();

	factory WebConfigRegisterOption.fromJson(Map<String, dynamic> json) => $WebConfigRegisterOptionFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigRegisterOptionToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}