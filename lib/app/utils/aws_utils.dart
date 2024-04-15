import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:leisure_games/app/logger.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/4/15 15:09
/// Description: 亚马逊存储桶
class AwsUtils{

  AwsUtils._internal();

  static AwsUtils? instance;

  static getInstance() {
    instance ??= AwsUtils._internal();
    return instance;
  }

  factory AwsUtils() => getInstance();

  Future<void> configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      await Amplify.addPlugins([auth, storage]);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(jsonEncode(""));
    } on Exception catch (e) {
      logger('An error occurred configuring Amplify: $e');
    }
  }





}


