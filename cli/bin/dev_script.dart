import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:cli_dialog/cli_dialog.dart';
import 'package:slug/slug.dart';

///
/// 1. install: dart pub global activate --source path ./cli  (working directory in repo root)
/// 2. export $HOME/.pub-cache/bin
/// 3. cli-dev
///

void main() async {
  Directory projectRoot =
      Directory(Platform.script.toFilePath()).parent.parent.parent.parent.parent.parent;
  print(projectRoot);
  Slug slug = Slug(
    slugStyle: SlugStyle.clock,
    hideCursor: true,
  );

  // get running device list
  var progress = slug.progress('正在检测设备');
  final getDevices = await Process.run('flutter', ['devices'],
      workingDirectory: projectRoot.absolute.path,
      runInShell: Platform.isWindows);

  final deviceList = const LineSplitter()
      .convert(getDevices.stdout.toString())
      .where((element) => element.contains('mobile') || element.contains('web'))
      .map((element) {
    var deviceStat = element.replaceAll(' ', '').split('•');
    return {deviceStat[0]: deviceStat[1]};
  }).toList();

  if (deviceList.isEmpty) {
    progress.error(message: '未检测到任何可用设备，请先启动模拟器或连接设备', showTiming: true);
    exit(0);
  }
  progress.finish(message: '检测到${deviceList.length}个可用设备', showTiming: true);

  final dialog = CLI_Dialog(questions: [
    ['请输入站点标识', 'site']
  ], listQuestions: [
    [
      {
        'question': '请选择要运行的平台',
        'options': ['APP', 'WAP(H5)', 'Web']
      },
      'platform'
    ],
    [
      {
        'question': '请选择连接设备',
        'options': deviceList.map((e) => e.keys.first).toList(),
      },
      'device'
    ]
  ]);

  final answer = dialog.ask();
  print(answer);

  // get site's template
  String template;
  Map<String, List<dynamic>> siteList = await File('./bin/site_list.json')
      .readAsString()
      .then((value) => Map<String, List<dynamic>>.from(json.decode(value)));

  final templateResult = siteList.entries
      .where((element) => element.value.contains(answer['site']));

  if (templateResult.isEmpty) {
    stdout.write('请确保已在site_list.json中添加该站点标识');
    exit(0);
  }
  template = templateResult.first.key;

  // rewrite generate file
  final generatePath =
      File(projectRoot.uri.path + '/lib/temp/site_config.g.dart');
  final isExist = await generatePath.exists();

  if (!isExist) {
    await generatePath.create();
  }
  await generatePath.writeAsString(
      "export 'package:aone_flutter/template/$template/site/${answer['site']}/site_config.dart';");

  final selectedDevice = deviceList
      .where((element) => element.keys.first == answer['device'])
      .toList(growable: false);

  Process.start(
          'flutter',
          [
            'run',
            '-d',
            selectedDevice.first.values.first,
            "--target=lib/template/$template/main.dart"
          ],
          runInShell: Platform.isWindows)
      .then((process) {
    process.stdout.pipe(stdout);
    process.stderr.pipe(stderr);
    stdin.echoMode = false;
    stdin.lineMode = false;
    process.stdin.addStream(stdin);
  });
}
