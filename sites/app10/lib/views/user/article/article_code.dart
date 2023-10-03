


enum ArticleType {
  aboutUs,
  useRules,
  sportRules, // 体育规则
  betRules, // 投注规则
  technical,
  game,
  liveRules,
  platform
}


extension ArticleCode on ArticleType {

  String get code {
    switch (this) {
      case ArticleType.aboutUs:
        return '500';
      case ArticleType.useRules:
        return '2000';
      case ArticleType.sportRules:
        return '2200';
      case ArticleType.betRules:
        return '2202';
      case ArticleType.technical:
        return '2300';
      case ArticleType.game:
        return '2301';
      case ArticleType.liveRules:
        return '2302';
      case ArticleType.platform:
        return 'platform';
    }
  }

  String get title {
    switch (this) {

      case ArticleType.aboutUs:
        return '关于我们';
      case ArticleType.useRules:
        return '使用须知';
      case ArticleType.sportRules:
        return '体育规则';
      case ArticleType.betRules:
        return '投注规则';
      case ArticleType.technical:
        return '技术相关';
      case ArticleType.game:
        return '游戏相关';
      case ArticleType.liveRules:
        return '视讯相关';
      case ArticleType.platform:
        return '盘口详情';
    }
  }
}