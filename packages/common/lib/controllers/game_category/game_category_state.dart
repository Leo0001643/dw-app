import 'package:get/get.dart';
import '../../common.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DefaultSubClassItem extends GameSubClassItem {
  int? tag;

  DefaultSubClassItem({
    this.tag,
    int? classId,
    String? name,
  }) : super(classId: classId, name: name);
}

class GameCategoryLogicState {
  RxList<SubChildren> providers = RxList<SubChildren>([]);

  RxList<GameSubClassItem> gameSubClasses = RxList<GameSubClassItem>([
    DefaultSubClassItem(
      tag: null,
      name: 'game.subClass.all'.tr,
    ),
    DefaultSubClassItem(
      tag: 2,
      name: 'game.subClass.hot'.tr,
    ),
    DefaultSubClassItem(
      tag: 4,
      name: 'game.subClass.new'.tr,
    ),
    DefaultSubClassItem(
      tag: 3,
      name: 'game.subClass.feature'.tr,
    ),
  ]);

  // 当前选择二级分类在列表中的index
  final RxInt _activeSubClass = 0.obs;
  int get activeSubClass => _activeSubClass.value;
  set activeSubClass(value) => _activeSubClass.value = value;

   PagingController<int, AllGameItem> pagingController =
      PagingController<int, AllGameItem>(firstPageKey: 1);
// PagingController<int, AllGameItem> get pagingController => _pagingController.value;

  //搜索
  final PagingController<int, AllGameItem> pagingSearchController =
      PagingController<int, AllGameItem>(firstPageKey: 2);
  RxList<AllGameItem>? searchGameList;

  final Rx<AllGameDto> _payload = AllGameDto(
    currentPage: 1,
    currentPageTotal: 20,
    changshang: 2,
    type: 2,
  ).obs;

  AllGameDto get payload => _payload.value;
  set payload(value) => _payload.value = value;
  
  // providers
  final Rx<SubChildren> _selectedProvider = Rx<SubChildren>(SubChildren());
  SubChildren get selectedProvider => _selectedProvider.value;
  set selectedProvider(value) => _selectedProvider.value = value;

  get title => fieldTranslator(_selectedProvider.value);

  get activeProvider => _selectedProvider.value.gameTag;
}
