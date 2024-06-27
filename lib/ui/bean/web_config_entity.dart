import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/web_config_entity.g.dart';

export 'package:leisure_games/generated/json/web_config_entity.g.dart';

@JsonSerializable()
class WebConfigEntity {
	@JSONField(name: "domain_pc28")
	WebConfigDomainMGuanfangcai? domainPc28;
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
	WebConfigDomainMGuanfangcai? domainJingdiancai;
	@JSONField(name: "QRCode")
	String? qRCode;
	@JSONField(name: "domain_guanfangcai")
	WebConfigDomainMGuanfangcai? domainGuanfangcai;
	@JSONField(name: "ag_domain")
	WebConfigAgDomain? agDomain;
	@JSONField(name: "front_domain")
	WebConfigAgDomain? frontDomain;
	@JSONField(name: "domain_m_guanfangcai")
	WebConfigDomainMGuanfangcai? domainMGuanfangcai;
	@JSONField(name: "domain_m_pc28")
	WebConfigDomainMGuanfangcai? domainMPc28;
	@JSONField(name: "domain_m_jingdiancai")
	WebConfigDomainMGuanfangcai? domainMJingdiancai;
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
	@JSONField(name: "url_path")
	String? urlPath;

	WebConfigDomainMGuanfangcai();

	factory WebConfigDomainMGuanfangcai.fromJson(Map<String, dynamic> json) => $WebConfigDomainMGuanfangcaiFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigDomainMGuanfangcaiToJson(this);

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

	///1 不填写(不显示)
	///2 选填(显示 不带星号)
	///3 必填(显示 带星号)

	WebConfigRegisterOption();

	factory WebConfigRegisterOption.fromJson(Map<String, dynamic> json) => $WebConfigRegisterOptionFromJson(json);

	Map<String, dynamic> toJson() => $WebConfigRegisterOptionToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}