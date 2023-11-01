import 'package:leisure_games/app/intl/intr.dart';
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
    HomeGameMenuEntity(name:"Jogo",group: Intr().tab_pcfj),
    HomeGameMenuEntity(name:"Poke",group: Intr().tab_pcfj),
    HomeGameMenuEntity(name:"Truco",group: Intr().tab_pcfj),
    HomeGameMenuEntity(name:"3Patt",group: Intr().tab_pcfj),
    HomeGameMenuEntity(name:"Teen Patti",group: Intr().tab_pcfj),
    HomeGameMenuEntity(name:"竞速PK10",group: Intr().tab_cp),
    HomeGameMenuEntity(name:"竞速秒秒彩",group: Intr().tab_cp),
    HomeGameMenuEntity(name:"竞速快3",group: Intr().tab_cp),
    HomeGameMenuEntity(name:"竞速ENO",group: Intr().tab_cp),
    HomeGameMenuEntity(name:"竞速PK10",group: Intr().tab_zr),
    HomeGameMenuEntity(name:"竞速秒秒彩",group: Intr().tab_zr),
    HomeGameMenuEntity(name:"竞速快3",group: Intr().tab_zr),
    HomeGameMenuEntity(name:"竞速ENO",group: Intr().tab_zr),
    HomeGameMenuEntity(name:"竞速PK10",group: Intr().tab_ty),
    HomeGameMenuEntity(name:"竞速秒秒彩",group: Intr().tab_ty),
    HomeGameMenuEntity(name:"竞速快3",group: Intr().tab_ty),
    HomeGameMenuEntity(name:"竞速ENO",group: Intr().tab_ty),
    HomeGameMenuEntity(name:"竞速PK10",group: Intr().tab_by),
    HomeGameMenuEntity(name:"竞速秒秒彩",group: Intr().tab_by),
    HomeGameMenuEntity(name:"竞速快3",group: Intr().tab_by),
    HomeGameMenuEntity(name:"竞速ENO",group: Intr().tab_by),
    HomeGameMenuEntity(name:"竞速PK10",group: Intr().tab_dz),
    HomeGameMenuEntity(name:"竞速秒秒彩",group: Intr().tab_dz),
    HomeGameMenuEntity(name:"竞速快3",group: Intr().tab_dz),
    HomeGameMenuEntity(name:"竞速ENO",group: Intr().tab_dz),
  ];




}
