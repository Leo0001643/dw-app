

import 'package:flutter/material.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/ui/main/ends_drawer_view.dart';

class DrawerScaffold extends Scaffold{
  DrawerScaffold({GlobalKey<ScaffoldState>? scaffoldKey,PreferredSizeWidget? appBar,Color? backgroundColor,Widget? bottomNavigationBar,Widget? body,
    Widget? bottomSheet,Widget? floatingActionButton,}):super(
    key: scaffoldKey,
    endDrawer: EndsDrawerView(scaffoldKey: scaffoldKey,),
    appBar: appBar,
    backgroundColor: backgroundColor,
    bottomNavigationBar: bottomNavigationBar,
    body: body,
    bottomSheet: bottomSheet,
    floatingActionButton: floatingActionButton,
    onDrawerChanged: (b){ logger(b); },
    onEndDrawerChanged: (b){ logger(b); },
  );



}
