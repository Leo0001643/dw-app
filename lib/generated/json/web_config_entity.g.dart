import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/web_config_entity.dart';

WebConfigEntity $WebConfigEntityFromJson(Map<String, dynamic> json) {
  final WebConfigEntity webConfigEntity = WebConfigEntity();
  final WebConfigDomainPc28? domainPc28 = jsonConvert.convert<
      WebConfigDomainPc28>(json['domain_pc28']);
  if (domainPc28 != null) {
    webConfigEntity.domainPc28 = domainPc28;
  }
  final WebConfigDcHelpDomain? dcHelpDomain = jsonConvert.convert<
      WebConfigDcHelpDomain>(json['dc_help_domain']);
  if (dcHelpDomain != null) {
    webConfigEntity.dcHelpDomain = dcHelpDomain;
  }
  final String? codeTotal = jsonConvert.convert<String>(json['codeTotal']);
  if (codeTotal != null) {
    webConfigEntity.codeTotal = codeTotal;
  }
  final List<String>? otherConfig = (json['other_config'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (otherConfig != null) {
    webConfigEntity.otherConfig = otherConfig;
  }
  final WebConfigPtgamehost? ptgamehost = jsonConvert.convert<
      WebConfigPtgamehost>(json['ptgamehost']);
  if (ptgamehost != null) {
    webConfigEntity.ptgamehost = ptgamehost;
  }
  final WebConfigAppDownload? appDownload = jsonConvert.convert<
      WebConfigAppDownload>(json['appDownload']);
  if (appDownload != null) {
    webConfigEntity.appDownload = appDownload;
  }
  final WebConfigLottoLineUrl? lottoLineUrl = jsonConvert.convert<
      WebConfigLottoLineUrl>(json['lotto_line_url']);
  if (lottoLineUrl != null) {
    webConfigEntity.lottoLineUrl = lottoLineUrl;
  }
  final WebConfigDomainJingdiancai? domainJingdiancai = jsonConvert.convert<
      WebConfigDomainJingdiancai>(json['domain_jingdiancai']);
  if (domainJingdiancai != null) {
    webConfigEntity.domainJingdiancai = domainJingdiancai;
  }
  final String? qRCode = jsonConvert.convert<String>(json['QRCode']);
  if (qRCode != null) {
    webConfigEntity.qRCode = qRCode;
  }
  final WebConfigDomainGuanfangcai? domainGuanfangcai = jsonConvert.convert<
      WebConfigDomainGuanfangcai>(json['domain_guanfangcai']);
  if (domainGuanfangcai != null) {
    webConfigEntity.domainGuanfangcai = domainGuanfangcai;
  }
  final WebConfigAgDomain? agDomain = jsonConvert.convert<WebConfigAgDomain>(
      json['ag_domain']);
  if (agDomain != null) {
    webConfigEntity.agDomain = agDomain;
  }
  final WebConfigDomainMGuanfangcai? domainMGuanfangcai = jsonConvert.convert<
      WebConfigDomainMGuanfangcai>(json['domain_m_guanfangcai']);
  if (domainMGuanfangcai != null) {
    webConfigEntity.domainMGuanfangcai = domainMGuanfangcai;
  }
  final WebConfigDomainMPc28? domainMPc28 = jsonConvert.convert<
      WebConfigDomainMPc28>(json['domain_m_pc28']);
  if (domainMPc28 != null) {
    webConfigEntity.domainMPc28 = domainMPc28;
  }
  final WebConfigDomainMJingdiancai? domainMJingdiancai = jsonConvert.convert<
      WebConfigDomainMJingdiancai>(json['domain_m_jingdiancai']);
  if (domainMJingdiancai != null) {
    webConfigEntity.domainMJingdiancai = domainMJingdiancai;
  }
  final List<
      WebConfigRegisterOption>? registerOption = (json['register_option'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<WebConfigRegisterOption>(
          e) as WebConfigRegisterOption).toList();
  if (registerOption != null) {
    webConfigEntity.registerOption = registerOption;
  }
  return webConfigEntity;
}

Map<String, dynamic> $WebConfigEntityToJson(WebConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['domain_pc28'] = entity.domainPc28?.toJson();
  data['dc_help_domain'] = entity.dcHelpDomain?.toJson();
  data['codeTotal'] = entity.codeTotal;
  data['other_config'] = entity.otherConfig;
  data['ptgamehost'] = entity.ptgamehost?.toJson();
  data['appDownload'] = entity.appDownload?.toJson();
  data['lotto_line_url'] = entity.lottoLineUrl?.toJson();
  data['domain_jingdiancai'] = entity.domainJingdiancai?.toJson();
  data['QRCode'] = entity.qRCode;
  data['domain_guanfangcai'] = entity.domainGuanfangcai?.toJson();
  data['ag_domain'] = entity.agDomain?.toJson();
  data['domain_m_guanfangcai'] = entity.domainMGuanfangcai?.toJson();
  data['domain_m_pc28'] = entity.domainMPc28?.toJson();
  data['domain_m_jingdiancai'] = entity.domainMJingdiancai?.toJson();
  data['register_option'] =
      entity.registerOption?.map((v) => v.toJson()).toList();
  return data;
}

extension WebConfigEntityExtension on WebConfigEntity {
  WebConfigEntity copyWith({
    WebConfigDomainPc28? domainPc28,
    WebConfigDcHelpDomain? dcHelpDomain,
    String? codeTotal,
    List<String>? otherConfig,
    WebConfigPtgamehost? ptgamehost,
    WebConfigAppDownload? appDownload,
    WebConfigLottoLineUrl? lottoLineUrl,
    WebConfigDomainJingdiancai? domainJingdiancai,
    String? qRCode,
    WebConfigDomainGuanfangcai? domainGuanfangcai,
    WebConfigAgDomain? agDomain,
    WebConfigDomainMGuanfangcai? domainMGuanfangcai,
    WebConfigDomainMPc28? domainMPc28,
    WebConfigDomainMJingdiancai? domainMJingdiancai,
    List<WebConfigRegisterOption>? registerOption,
  }) {
    return WebConfigEntity()
      ..domainPc28 = domainPc28 ?? this.domainPc28
      ..dcHelpDomain = dcHelpDomain ?? this.dcHelpDomain
      ..codeTotal = codeTotal ?? this.codeTotal
      ..otherConfig = otherConfig ?? this.otherConfig
      ..ptgamehost = ptgamehost ?? this.ptgamehost
      ..appDownload = appDownload ?? this.appDownload
      ..lottoLineUrl = lottoLineUrl ?? this.lottoLineUrl
      ..domainJingdiancai = domainJingdiancai ?? this.domainJingdiancai
      ..qRCode = qRCode ?? this.qRCode
      ..domainGuanfangcai = domainGuanfangcai ?? this.domainGuanfangcai
      ..agDomain = agDomain ?? this.agDomain
      ..domainMGuanfangcai = domainMGuanfangcai ?? this.domainMGuanfangcai
      ..domainMPc28 = domainMPc28 ?? this.domainMPc28
      ..domainMJingdiancai = domainMJingdiancai ?? this.domainMJingdiancai
      ..registerOption = registerOption ?? this.registerOption;
  }
}

WebConfigDomainPc28 $WebConfigDomainPc28FromJson(Map<String, dynamic> json) {
  final WebConfigDomainPc28 webConfigDomainPc28 = WebConfigDomainPc28();
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainPc28.checkPath = checkPath;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainPc28.list = list;
  }
  final String? urlPath = jsonConvert.convert<String>(json['url_path']);
  if (urlPath != null) {
    webConfigDomainPc28.urlPath = urlPath;
  }
  return webConfigDomainPc28;
}

Map<String, dynamic> $WebConfigDomainPc28ToJson(WebConfigDomainPc28 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['check_path'] = entity.checkPath;
  data['list'] = entity.list;
  data['url_path'] = entity.urlPath;
  return data;
}

extension WebConfigDomainPc28Extension on WebConfigDomainPc28 {
  WebConfigDomainPc28 copyWith({
    String? checkPath,
    List<String>? list,
    String? urlPath,
  }) {
    return WebConfigDomainPc28()
      ..checkPath = checkPath ?? this.checkPath
      ..list = list ?? this.list
      ..urlPath = urlPath ?? this.urlPath;
  }
}

WebConfigDcHelpDomain $WebConfigDcHelpDomainFromJson(
    Map<String, dynamic> json) {
  final WebConfigDcHelpDomain webConfigDcHelpDomain = WebConfigDcHelpDomain();
  final String? urlPayHelp = jsonConvert.convert<String>(json['url_pay_help']);
  if (urlPayHelp != null) {
    webConfigDcHelpDomain.urlPayHelp = urlPayHelp;
  }
  final String? urlDrawHelp = jsonConvert.convert<String>(
      json['url_draw_help']);
  if (urlDrawHelp != null) {
    webConfigDcHelpDomain.urlDrawHelp = urlDrawHelp;
  }
  final String? urlCgpPayHelp = jsonConvert.convert<String>(
      json['url_cgp_pay_help']);
  if (urlCgpPayHelp != null) {
    webConfigDcHelpDomain.urlCgpPayHelp = urlCgpPayHelp;
  }
  final String? urlCgpDrawHelp = jsonConvert.convert<String>(
      json['url_cgp_draw_help']);
  if (urlCgpDrawHelp != null) {
    webConfigDcHelpDomain.urlCgpDrawHelp = urlCgpDrawHelp;
  }
  return webConfigDcHelpDomain;
}

Map<String, dynamic> $WebConfigDcHelpDomainToJson(
    WebConfigDcHelpDomain entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url_pay_help'] = entity.urlPayHelp;
  data['url_draw_help'] = entity.urlDrawHelp;
  data['url_cgp_pay_help'] = entity.urlCgpPayHelp;
  data['url_cgp_draw_help'] = entity.urlCgpDrawHelp;
  return data;
}

extension WebConfigDcHelpDomainExtension on WebConfigDcHelpDomain {
  WebConfigDcHelpDomain copyWith({
    String? urlPayHelp,
    String? urlDrawHelp,
    String? urlCgpPayHelp,
    String? urlCgpDrawHelp,
  }) {
    return WebConfigDcHelpDomain()
      ..urlPayHelp = urlPayHelp ?? this.urlPayHelp
      ..urlDrawHelp = urlDrawHelp ?? this.urlDrawHelp
      ..urlCgpPayHelp = urlCgpPayHelp ?? this.urlCgpPayHelp
      ..urlCgpDrawHelp = urlCgpDrawHelp ?? this.urlCgpDrawHelp;
  }
}

WebConfigPtgamehost $WebConfigPtgamehostFromJson(Map<String, dynamic> json) {
  final WebConfigPtgamehost webConfigPtgamehost = WebConfigPtgamehost();
  final List<String>? h5idvar = (json['h5idvar'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (h5idvar != null) {
    webConfigPtgamehost.h5idvar = h5idvar;
  }
  final List<String>? fldomain = (json['fldomain'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (fldomain != null) {
    webConfigPtgamehost.fldomain = fldomain;
  }
  final List<String>? h5domain = (json['h5domain'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (h5domain != null) {
    webConfigPtgamehost.h5domain = h5domain;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigPtgamehost.list = list;
  }
  return webConfigPtgamehost;
}

Map<String, dynamic> $WebConfigPtgamehostToJson(WebConfigPtgamehost entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['h5idvar'] = entity.h5idvar;
  data['fldomain'] = entity.fldomain;
  data['h5domain'] = entity.h5domain;
  data['list'] = entity.list;
  return data;
}

extension WebConfigPtgamehostExtension on WebConfigPtgamehost {
  WebConfigPtgamehost copyWith({
    List<String>? h5idvar,
    List<String>? fldomain,
    List<String>? h5domain,
    List<String>? list,
  }) {
    return WebConfigPtgamehost()
      ..h5idvar = h5idvar ?? this.h5idvar
      ..fldomain = fldomain ?? this.fldomain
      ..h5domain = h5domain ?? this.h5domain
      ..list = list ?? this.list;
  }
}

WebConfigAppDownload $WebConfigAppDownloadFromJson(Map<String, dynamic> json) {
  final WebConfigAppDownload webConfigAppDownload = WebConfigAppDownload();
  final Map<String, WebConfigAppDownloadIos1?>? android =
  (json['android'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k,
          e == null ? null : jsonConvert.convert<WebConfigAppDownloadIos1>(e)));
  if (android != null) {
    webConfigAppDownload.android = android;
  }
  final Map<String, WebConfigAppDownloadIos1?>? ios =
  (json['ios'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k,
          e == null ? null : jsonConvert.convert<WebConfigAppDownloadIos1>(e)));
  if (ios != null) {
    webConfigAppDownload.ios = ios;
  }
  return webConfigAppDownload;
}

Map<String, dynamic> $WebConfigAppDownloadToJson(WebConfigAppDownload entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['android'] = entity.android;
  data['ios'] = entity.ios;
  return data;
}

extension WebConfigAppDownloadExtension on WebConfigAppDownload {
  WebConfigAppDownload copyWith({
    Map<String, WebConfigAppDownloadIos1?>? android,
    Map<String, WebConfigAppDownloadIos1?>? ios,
  }) {
    return WebConfigAppDownload()
      ..android = android ?? this.android
      ..ios = ios ?? this.ios;
  }
}

WebConfigAppDownloadIos1 $WebConfigAppDownloadIos1FromJson(
    Map<String, dynamic> json) {
  final WebConfigAppDownloadIos1 webConfigAppDownloadIos1 = WebConfigAppDownloadIos1();
  final WebConfigAppDownloadIos1Config? config = jsonConvert.convert<
      WebConfigAppDownloadIos1Config>(json['config']);
  if (config != null) {
    webConfigAppDownloadIos1.config = config;
  }
  return webConfigAppDownloadIos1;
}

Map<String, dynamic> $WebConfigAppDownloadIos1ToJson(
    WebConfigAppDownloadIos1 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['config'] = entity.config?.toJson();
  return data;
}

extension WebConfigAppDownloadIos1Extension on WebConfigAppDownloadIos1 {
  WebConfigAppDownloadIos1 copyWith({
    WebConfigAppDownloadIos1Config? config,
  }) {
    return WebConfigAppDownloadIos1()
      ..config = config ?? this.config;
  }
}

WebConfigAppDownloadIos1Config $WebConfigAppDownloadIos1ConfigFromJson(
    Map<String, dynamic> json) {
  final WebConfigAppDownloadIos1Config webConfigAppDownloadIos1Config = WebConfigAppDownloadIos1Config();
  final String? url3 = jsonConvert.convert<String>(json['url3']);
  if (url3 != null) {
    webConfigAppDownloadIos1Config.url3 = url3;
  }
  final String? url1 = jsonConvert.convert<String>(json['url1']);
  if (url1 != null) {
    webConfigAppDownloadIos1Config.url1 = url1;
  }
  final String? url2 = jsonConvert.convert<String>(json['url2']);
  if (url2 != null) {
    webConfigAppDownloadIos1Config.url2 = url2;
  }
  return webConfigAppDownloadIos1Config;
}

Map<String, dynamic> $WebConfigAppDownloadIos1ConfigToJson(
    WebConfigAppDownloadIos1Config entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url3'] = entity.url3;
  data['url1'] = entity.url1;
  data['url2'] = entity.url2;
  return data;
}

extension WebConfigAppDownloadIos1ConfigExtension on WebConfigAppDownloadIos1Config {
  WebConfigAppDownloadIos1Config copyWith({
    String? url3,
    String? url1,
    String? url2,
  }) {
    return WebConfigAppDownloadIos1Config()
      ..url3 = url3 ?? this.url3
      ..url1 = url1 ?? this.url1
      ..url2 = url2 ?? this.url2;
  }
}

WebConfigLottoLineUrl $WebConfigLottoLineUrlFromJson(
    Map<String, dynamic> json) {
  final WebConfigLottoLineUrl webConfigLottoLineUrl = WebConfigLottoLineUrl();
  final List<String>? ipsPc = (json['ipsPc'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (ipsPc != null) {
    webConfigLottoLineUrl.ipsPc = ipsPc;
  }
  final List<String>? jdcIp = (json['jdcIp'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (jdcIp != null) {
    webConfigLottoLineUrl.jdcIp = jdcIp;
  }
  final List<dynamic>? gfcips = (json['gfcips'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gfcips != null) {
    webConfigLottoLineUrl.gfcips = gfcips;
  }
  final String? stitching = jsonConvert.convert<String>(json['stitching']);
  if (stitching != null) {
    webConfigLottoLineUrl.stitching = stitching;
  }
  final List<String>? ips = (json['ips'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (ips != null) {
    webConfigLottoLineUrl.ips = ips;
  }
  return webConfigLottoLineUrl;
}

Map<String, dynamic> $WebConfigLottoLineUrlToJson(
    WebConfigLottoLineUrl entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ipsPc'] = entity.ipsPc;
  data['jdcIp'] = entity.jdcIp;
  data['gfcips'] = entity.gfcips;
  data['stitching'] = entity.stitching;
  data['ips'] = entity.ips;
  return data;
}

extension WebConfigLottoLineUrlExtension on WebConfigLottoLineUrl {
  WebConfigLottoLineUrl copyWith({
    List<String>? ipsPc,
    List<String>? jdcIp,
    List<dynamic>? gfcips,
    String? stitching,
    List<String>? ips,
  }) {
    return WebConfigLottoLineUrl()
      ..ipsPc = ipsPc ?? this.ipsPc
      ..jdcIp = jdcIp ?? this.jdcIp
      ..gfcips = gfcips ?? this.gfcips
      ..stitching = stitching ?? this.stitching
      ..ips = ips ?? this.ips;
  }
}

WebConfigDomainJingdiancai $WebConfigDomainJingdiancaiFromJson(
    Map<String, dynamic> json) {
  final WebConfigDomainJingdiancai webConfigDomainJingdiancai = WebConfigDomainJingdiancai();
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainJingdiancai.checkPath = checkPath;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainJingdiancai.list = list;
  }
  final String? urlPath = jsonConvert.convert<String>(json['url_path']);
  if (urlPath != null) {
    webConfigDomainJingdiancai.urlPath = urlPath;
  }
  return webConfigDomainJingdiancai;
}

Map<String, dynamic> $WebConfigDomainJingdiancaiToJson(
    WebConfigDomainJingdiancai entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['check_path'] = entity.checkPath;
  data['list'] = entity.list;
  data['url_path'] = entity.urlPath;
  return data;
}

extension WebConfigDomainJingdiancaiExtension on WebConfigDomainJingdiancai {
  WebConfigDomainJingdiancai copyWith({
    String? checkPath,
    List<String>? list,
    String? urlPath,
  }) {
    return WebConfigDomainJingdiancai()
      ..checkPath = checkPath ?? this.checkPath
      ..list = list ?? this.list
      ..urlPath = urlPath ?? this.urlPath;
  }
}

WebConfigDomainGuanfangcai $WebConfigDomainGuanfangcaiFromJson(
    Map<String, dynamic> json) {
  final WebConfigDomainGuanfangcai webConfigDomainGuanfangcai = WebConfigDomainGuanfangcai();
  final List<String>? listTestNew = (json['list_test_new'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (listTestNew != null) {
    webConfigDomainGuanfangcai.listTestNew = listTestNew;
  }
  final List<String>? listNew = (json['list_new'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (listNew != null) {
    webConfigDomainGuanfangcai.listNew = listNew;
  }
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainGuanfangcai.checkPath = checkPath;
  }
  final List<String>? listTest = (json['list_test'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (listTest != null) {
    webConfigDomainGuanfangcai.listTest = listTest;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainGuanfangcai.list = list;
  }
  return webConfigDomainGuanfangcai;
}

Map<String, dynamic> $WebConfigDomainGuanfangcaiToJson(
    WebConfigDomainGuanfangcai entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list_test_new'] = entity.listTestNew;
  data['list_new'] = entity.listNew;
  data['check_path'] = entity.checkPath;
  data['list_test'] = entity.listTest;
  data['list'] = entity.list;
  return data;
}

extension WebConfigDomainGuanfangcaiExtension on WebConfigDomainGuanfangcai {
  WebConfigDomainGuanfangcai copyWith({
    List<String>? listTestNew,
    List<String>? listNew,
    String? checkPath,
    List<String>? listTest,
    List<String>? list,
  }) {
    return WebConfigDomainGuanfangcai()
      ..listTestNew = listTestNew ?? this.listTestNew
      ..listNew = listNew ?? this.listNew
      ..checkPath = checkPath ?? this.checkPath
      ..listTest = listTest ?? this.listTest
      ..list = list ?? this.list;
  }
}

WebConfigAgDomain $WebConfigAgDomainFromJson(Map<String, dynamic> json) {
  final WebConfigAgDomain webConfigAgDomain = WebConfigAgDomain();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    webConfigAgDomain.name = name;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigAgDomain.list = list;
  }
  return webConfigAgDomain;
}

Map<String, dynamic> $WebConfigAgDomainToJson(WebConfigAgDomain entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['list'] = entity.list;
  return data;
}

extension WebConfigAgDomainExtension on WebConfigAgDomain {
  WebConfigAgDomain copyWith({
    String? name,
    List<String>? list,
  }) {
    return WebConfigAgDomain()
      ..name = name ?? this.name
      ..list = list ?? this.list;
  }
}

WebConfigDomainMGuanfangcai $WebConfigDomainMGuanfangcaiFromJson(
    Map<String, dynamic> json) {
  final WebConfigDomainMGuanfangcai webConfigDomainMGuanfangcai = WebConfigDomainMGuanfangcai();
  final List<String>? listTestNew = (json['list_test_new'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (listTestNew != null) {
    webConfigDomainMGuanfangcai.listTestNew = listTestNew;
  }
  final List<String>? listNew = (json['list_new'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (listNew != null) {
    webConfigDomainMGuanfangcai.listNew = listNew;
  }
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainMGuanfangcai.checkPath = checkPath;
  }
  final List<String>? listTest = (json['list_test'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (listTest != null) {
    webConfigDomainMGuanfangcai.listTest = listTest;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainMGuanfangcai.list = list;
  }
  return webConfigDomainMGuanfangcai;
}

Map<String, dynamic> $WebConfigDomainMGuanfangcaiToJson(
    WebConfigDomainMGuanfangcai entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list_test_new'] = entity.listTestNew;
  data['list_new'] = entity.listNew;
  data['check_path'] = entity.checkPath;
  data['list_test'] = entity.listTest;
  data['list'] = entity.list;
  return data;
}

extension WebConfigDomainMGuanfangcaiExtension on WebConfigDomainMGuanfangcai {
  WebConfigDomainMGuanfangcai copyWith({
    List<String>? listTestNew,
    List<String>? listNew,
    String? checkPath,
    List<String>? listTest,
    List<String>? list,
  }) {
    return WebConfigDomainMGuanfangcai()
      ..listTestNew = listTestNew ?? this.listTestNew
      ..listNew = listNew ?? this.listNew
      ..checkPath = checkPath ?? this.checkPath
      ..listTest = listTest ?? this.listTest
      ..list = list ?? this.list;
  }
}

WebConfigDomainMPc28 $WebConfigDomainMPc28FromJson(Map<String, dynamic> json) {
  final WebConfigDomainMPc28 webConfigDomainMPc28 = WebConfigDomainMPc28();
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainMPc28.checkPath = checkPath;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainMPc28.list = list;
  }
  final String? urlPath = jsonConvert.convert<String>(json['url_path']);
  if (urlPath != null) {
    webConfigDomainMPc28.urlPath = urlPath;
  }
  return webConfigDomainMPc28;
}

Map<String, dynamic> $WebConfigDomainMPc28ToJson(WebConfigDomainMPc28 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['check_path'] = entity.checkPath;
  data['list'] = entity.list;
  data['url_path'] = entity.urlPath;
  return data;
}

extension WebConfigDomainMPc28Extension on WebConfigDomainMPc28 {
  WebConfigDomainMPc28 copyWith({
    String? checkPath,
    List<String>? list,
    String? urlPath,
  }) {
    return WebConfigDomainMPc28()
      ..checkPath = checkPath ?? this.checkPath
      ..list = list ?? this.list
      ..urlPath = urlPath ?? this.urlPath;
  }
}

WebConfigDomainMJingdiancai $WebConfigDomainMJingdiancaiFromJson(
    Map<String, dynamic> json) {
  final WebConfigDomainMJingdiancai webConfigDomainMJingdiancai = WebConfigDomainMJingdiancai();
  final String? checkPath = jsonConvert.convert<String>(json['check_path']);
  if (checkPath != null) {
    webConfigDomainMJingdiancai.checkPath = checkPath;
  }
  final List<String>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (list != null) {
    webConfigDomainMJingdiancai.list = list;
  }
  final String? urlPath = jsonConvert.convert<String>(json['url_path']);
  if (urlPath != null) {
    webConfigDomainMJingdiancai.urlPath = urlPath;
  }
  return webConfigDomainMJingdiancai;
}

Map<String, dynamic> $WebConfigDomainMJingdiancaiToJson(
    WebConfigDomainMJingdiancai entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['check_path'] = entity.checkPath;
  data['list'] = entity.list;
  data['url_path'] = entity.urlPath;
  return data;
}

extension WebConfigDomainMJingdiancaiExtension on WebConfigDomainMJingdiancai {
  WebConfigDomainMJingdiancai copyWith({
    String? checkPath,
    List<String>? list,
    String? urlPath,
  }) {
    return WebConfigDomainMJingdiancai()
      ..checkPath = checkPath ?? this.checkPath
      ..list = list ?? this.list
      ..urlPath = urlPath ?? this.urlPath;
  }
}

WebConfigRegisterOption $WebConfigRegisterOptionFromJson(
    Map<String, dynamic> json) {
  final WebConfigRegisterOption webConfigRegisterOption = WebConfigRegisterOption();
  final String? emailRegisterOption = jsonConvert.convert<String>(
      json['email_register_option']);
  if (emailRegisterOption != null) {
    webConfigRegisterOption.emailRegisterOption = emailRegisterOption;
  }
  final String? agentRegisterOption = jsonConvert.convert<String>(
      json['agent_register_option']);
  if (agentRegisterOption != null) {
    webConfigRegisterOption.agentRegisterOption = agentRegisterOption;
  }
  final String? weixinRegisterOption = jsonConvert.convert<String>(
      json['weixin_register_option']);
  if (weixinRegisterOption != null) {
    webConfigRegisterOption.weixinRegisterOption = weixinRegisterOption;
  }
  final String? mobileRegisterOption = jsonConvert.convert<String>(
      json['mobile_register_option']);
  if (mobileRegisterOption != null) {
    webConfigRegisterOption.mobileRegisterOption = mobileRegisterOption;
  }
  final String? qqRegisterOption = jsonConvert.convert<String>(
      json['qq_register_option']);
  if (qqRegisterOption != null) {
    webConfigRegisterOption.qqRegisterOption = qqRegisterOption;
  }
  return webConfigRegisterOption;
}

Map<String, dynamic> $WebConfigRegisterOptionToJson(
    WebConfigRegisterOption entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email_register_option'] = entity.emailRegisterOption;
  data['agent_register_option'] = entity.agentRegisterOption;
  data['weixin_register_option'] = entity.weixinRegisterOption;
  data['mobile_register_option'] = entity.mobileRegisterOption;
  data['qq_register_option'] = entity.qqRegisterOption;
  return data;
}

extension WebConfigRegisterOptionExtension on WebConfigRegisterOption {
  WebConfigRegisterOption copyWith({
    String? emailRegisterOption,
    String? agentRegisterOption,
    String? weixinRegisterOption,
    String? mobileRegisterOption,
    String? qqRegisterOption,
  }) {
    return WebConfigRegisterOption()
      ..emailRegisterOption = emailRegisterOption ?? this.emailRegisterOption
      ..agentRegisterOption = agentRegisterOption ?? this.agentRegisterOption
      ..weixinRegisterOption = weixinRegisterOption ?? this.weixinRegisterOption
      ..mobileRegisterOption = mobileRegisterOption ?? this.mobileRegisterOption
      ..qqRegisterOption = qqRegisterOption ?? this.qqRegisterOption;
  }
}