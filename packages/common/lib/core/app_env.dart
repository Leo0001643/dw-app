import 'package:flutter/foundation.dart';

// Singleton app env config
class AppEnv {
  AppEnv._internal();

  static final AppEnv _instance = AppEnv._internal();

  factory AppEnv() => _instance;

  static AppEnvConfig get config => _getEnvConfig();

  static AppEnvConfig _debugConfig = AppEnvConfig(
    appName: "Aone02",
    appDomain: "https://pre-qt.a1pre10.com/",
    siteTag: 'a02',
    dShieldJson: "6aecf8a5-58b4-4232-80e7-2ba253bea048.json",
  );

  static AppEnvConfig _releaseConfig = AppEnvConfig(
    appName: "Aone02",
    appDomain: "https://pre-qt.a1pre10.com/",
    siteTag: 'a02',
    dShieldJson: "6aecf8a5-58b4-4232-80e7-2ba253bea048.json",
  );

  static void setup(AppEnvConfig config, {bool? isCoverConfig}) {
    if (!isCoverConfig!) {
      _releaseConfig.siteTag = config.siteTag;
      _debugConfig.siteTag = config.siteTag;
    }
    if (kReleaseMode) {
      _releaseConfig = isCoverConfig == true ? config : _releaseConfig;
    } else {
      _debugConfig = isCoverConfig == true ? config : _debugConfig;
    }
  }

  static AppEnvConfig _getEnvConfig() {
    if (kReleaseMode) {
      return _releaseConfig;
    }
    return _debugConfig;
  }
}

// app env config model
class AppEnvConfig {
  final String appName;
  late final String? dShieldJson;
  late String appDomain;
  late String siteTag;
  final int? isSports;
  final bool hasSportsApi;
  final bool? haveMp3;
  final String? customUrl;

  AppEnvConfig({required this.appName, this.dShieldJson, required this.appDomain, required this.siteTag, this.isSports, this.hasSportsApi=false, this.haveMp3, this.customUrl});

  copyWith({
    String? appName,
    String? dShieldJson,
    String? appDomain,
    String? siteTag,
    int? isSports,
    bool? hasSportsApi,
  }) {
    return AppEnvConfig(
        appName: appName ?? this.appName,
        dShieldJson: dShieldJson ?? this.dShieldJson,
        appDomain: appDomain ?? this.appDomain,
        siteTag: siteTag ?? this.siteTag,
        isSports: isSports ?? this.isSports,
        hasSportsApi: hasSportsApi ?? this.hasSportsApi,
        haveMp3: haveMp3 ?? this.haveMp3);
  }
}

// example for multi target/flavor
class _SitesEnv {
  final Map<String, AppEnvConfig> _siteConfigs = {
    'a02': AppEnvConfig(
      appName: "Aone02",
      appDomain: "https://pre-qt.a1pre10.com/",
      siteTag: 'a02',
      dShieldJson: "6aecf8a5-58b4-4232-80e7-2ba253bea048.json",
    ),
    'a03': AppEnvConfig(
      appName: "Aone03",
      appDomain: "https://pre-qt.a1pre10.com/",
      siteTag: 'a03',
      dShieldJson: "6aecf8a5-58b4-4232-80e7-2ba253bea048.json",
    ),
  };
}
