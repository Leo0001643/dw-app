import 'package:aone_common/common.dart';
import 'package:get/get.dart';

import 'article_code.dart';

class ArticleController extends BaseController {
  final RxString _id = ''.obs;
  String get id => _id.value;
  set id(String val) => _id.value = val;

  final List<PlatformArticle> platformArticles = [
    PlatformArticle(id: '22011', title: '独赢'),
    PlatformArticle(id: '22012', title: '让球'),
    PlatformArticle(id: '22013', title: '冠军'),
    PlatformArticle(id: '22014', title: '大小'),
    PlatformArticle(id: '22015', title: '角球'),
    PlatformArticle(id: '22016', title: '波胆'),
    PlatformArticle(id: '22017', title: '单双'),
  ];

  final Rx<Article> _article = Rx(Article());
  Article get article => _article.value;
  set article(Article val) => _article.value = val;

  final SiteConfigProvider provider = SiteConfigProvider();

  // 关于我们文章id 默认为500
  Future<void> getData() async {
    await fetchHandler<ArticleEntity>(
      provider.article(id),
      onSuccess: (res) {
        if (res.info?.isEmpty ?? true) {
          article = Article();
          return;
        } else {
          article = res.info!.first;
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    final code = (Get.arguments as ArticleType).code;
    if (code != 'platform') {
      id = code;
      getData();
    } else {
      id = platformArticles.first.id;
      getData();
      ever(_id, (_) => getData());
    }
  }
}

class PlatformArticle {
  final String id;
  final String title;
  PlatformArticle({required this.id, required this.title});
}
