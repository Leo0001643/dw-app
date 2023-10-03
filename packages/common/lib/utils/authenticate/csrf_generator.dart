

import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;

/// domain = Env().envConfig.appDomain
/// username = 用户名
String csrfTokenGenerator(String domain, String username) {
  Random random = Random();
  Uri domainUri = Uri.parse(domain);
  String hash =
      "91e64db92d03522456ee118d6eaffethgae1b5bacefd3a3876c42d03ee1122";
  String hash2 = hash + "b0e5793896ced977d6e05b02d91d";
  String hash3 = hash2.substring(
    (random.nextDouble() * 5 + 1).toInt().floor(),
    (random.nextDouble() * 10 + 1).toInt().floor(),
  );
  int hashLength = (random.nextDouble() * hash.length).toInt().floor();

  String r = hash.substring(hashLength, hashLength + 1);

  String domainNUsername = domainUri.host + username;

  String hostNameMd5 = crypto.md5
      .convert(
    utf8.encode(domainNUsername),
  )
      .toString();
  String dateMd5 = crypto.md5
      .convert(
    utf8.encode(
      DateTime.now().millisecondsSinceEpoch.toString(),
    ),
  )
      .toString();

  return r + hostNameMd5 + hash3 + dateMd5;
}
