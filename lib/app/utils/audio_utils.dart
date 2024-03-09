
import 'package:just_audio/just_audio.dart';
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

  var bgPlayer = AudioPlayer();
  var selectPlayer = AudioPlayer();

  var player = AudioPlayer();


  ///10秒动5种倒计时声音
  void playCountDown(){
    player.setAsset(MusicX.di);
    player.play();
  }

  ///新一期开始声音
  void playNewKj(){
    player.setAsset(MusicX.newkj);
    player.play();
  }

  ///开奖结果
  void playOpenResult(){
    player.setAsset(MusicX.openResult);
    player.play();
  }

  ///点击筹码的声音
  void playBetSelect(){
    selectPlayer.setAsset(MusicX.bet_select);
    selectPlayer.play();
  }

  ///进入房间的声音
  void playRoom(){
    bgPlayer.setAsset(MusicX.room);
    bgPlayer.setLoopMode(LoopMode.one);
    bgPlayer.play();
  }


  void pause(){
    player.pause();
  }

  ///停止
  void stop(){
    player.stop();
    selectPlayer.stop();
  }

  ///停止
  void stopBg(){
    bgPlayer.stop();
  }


  ///实例不再被继续使用
  void dispose(){
    bgPlayer.dispose();
    player.dispose();
    selectPlayer.dispose();
  }


}




