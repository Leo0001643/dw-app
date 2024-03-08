
import 'package:audioplayers/audioplayers.dart';
import 'package:leisure_games/app/res/musicx.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/3/8 14:01
/// Description: 音乐播放器
class AudioUtils{
  AudioUtils._internal();

  static AudioUtils? instance;

  static getInstance() {
    instance ??= AudioUtils._internal();
    return instance;
  }

  factory AudioUtils() => getInstance();

  var player = AudioPlayer();


  ///10秒动5种倒计时声音
  void playCountDown(){
    player.play(UrlSource(MusicX.di)).then((value) {});
  }

  ///新一期开始声音
  void playNewKj(){
    player.play(UrlSource(MusicX.newkj)).then((value) {});
  }

  ///开奖结果
  void playOpenResult(){
    player.play(UrlSource(MusicX.openResult)).then((value) {});
  }

  ///点击筹码的声音
  void playBetSelect(){
    player.play(UrlSource(MusicX.bet_select)).then((value) {});
  }

  ///进入房间的声音
  void playRoom(){
    player.play(UrlSource(MusicX.room)).then((value) {});
  }

}




