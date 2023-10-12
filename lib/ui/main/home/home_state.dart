import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }


  var images = [
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112813_20221128211908.jpg",
    "http://www.dingdangmao6.cn:8080/renren-fast/upload/005z4Cgply1gma8yrm5xoj_20210104143243.jpg",
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112802_20221128211814.jpg",
    "http://ddm.dingdangmao6.cn/renren-fast/upload/2022112812_20221128211908.jpg",
  ];

  final menuGroup = [
    HomeGameMenuEntity(name:"Jogo",group:'PC房间'),
    HomeGameMenuEntity(name:"Poke",group:'PC房间'),
    HomeGameMenuEntity(name:"Truco",group:'PC房间'),
    HomeGameMenuEntity(name:"3Patt",group:'PC房间'),
    HomeGameMenuEntity(name:"Teen Patti",group:'PC房间'),
    HomeGameMenuEntity(name:"竞速PK10",group:'彩票'),
    HomeGameMenuEntity(name:"竞速秒秒彩",group:'彩票'),
    HomeGameMenuEntity(name:"竞速快3",group:'彩票'),
    HomeGameMenuEntity(name:"竞速ENO",group:'彩票'),
    HomeGameMenuEntity(name:"竞速PK10",group:'真人'),
    HomeGameMenuEntity(name:"竞速秒秒彩",group:'真人'),
    HomeGameMenuEntity(name:"竞速快3",group:'真人'),
    HomeGameMenuEntity(name:"竞速ENO",group:'真人'),
    HomeGameMenuEntity(name:"竞速PK10",group:'体育'),
    HomeGameMenuEntity(name:"竞速秒秒彩",group:'体育'),
    HomeGameMenuEntity(name:"竞速快3",group:'体育'),
    HomeGameMenuEntity(name:"竞速ENO",group:'体育'),
    HomeGameMenuEntity(name:"竞速PK10",group:'捕鱼'),
    HomeGameMenuEntity(name:"竞速秒秒彩",group:'捕鱼'),
    HomeGameMenuEntity(name:"竞速快3",group:'捕鱼'),
    HomeGameMenuEntity(name:"竞速ENO",group:'捕鱼'),
    HomeGameMenuEntity(name:"竞速PK10",group:'电子'),
    HomeGameMenuEntity(name:"竞速秒秒彩",group:'电子'),
    HomeGameMenuEntity(name:"竞速快3",group:'电子'),
    HomeGameMenuEntity(name:"竞速ENO",group:'电子'),
  ];




}
