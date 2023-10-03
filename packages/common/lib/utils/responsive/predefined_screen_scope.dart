part of 'responsive.dart';

const double mobileScreenWidthLimit = 480.0;
const double tabletScreenWidthLimit = 840.0;
const double desktopScreenWidthLimit = 1200.0;

const double smallScreenWidthLimit = 600;
const double smallScreenHeightLimit = 1000.0;

// 一般
const mobileScreenScope = ScreenScope(
  maxWidth: mobileScreenWidthLimit,
);
const tabletScreenScope = ScreenScope(
  minWidth: mobileScreenWidthLimit,
  maxWidth: tabletScreenWidthLimit,
);
const desktopScreenScope = ScreenScope(
  minWidth: tabletScreenWidthLimit,
);

const smallScreenScope = ScreenScope(
  maxWidth: smallScreenWidthLimit,
);
const largeScreenScope = ScreenScope(
  minWidth: smallScreenWidthLimit,
);


// 竖屏
const mobilePortraitScreenScope = ScreenScope(
  maxWidth: mobileScreenWidthLimit,
  orientation: Orientation.portrait,
);
const tabletPortraitScreenScope = ScreenScope(
  minWidth: mobileScreenWidthLimit,
  maxWidth: tabletScreenWidthLimit,
  orientation: Orientation.portrait,
);
const desktopPortraitScreenScope = ScreenScope(
  minWidth: tabletScreenWidthLimit,
  orientation: Orientation.portrait,
);

const smallPortraitScreenScope = ScreenScope(
  maxWidth: smallScreenWidthLimit,
  orientation: Orientation.portrait,
);
const largePortraitScreenScope = ScreenScope(
  minWidth: smallScreenWidthLimit,
  orientation: Orientation.portrait,
);

// 横屏
const mobileLandscapeScreenScope = ScreenScope(
  maxWidth: tabletScreenWidthLimit,
  orientation: Orientation.landscape,
);
const tabletLandscapeScreenScope = ScreenScope(
  minWidth: tabletScreenWidthLimit,
  maxWidth: desktopScreenWidthLimit,
  orientation: Orientation.landscape,
);
const desktopLandscapeScreenScope = ScreenScope(
  minWidth: desktopScreenWidthLimit,
  orientation: Orientation.landscape,
);

const smallLandscapeScreenScope = ScreenScope(
  maxWidth: smallScreenHeightLimit,
  orientation: Orientation.landscape,
);
const largeLandscapeScreenScope = ScreenScope(
  minWidth: smallScreenHeightLimit,
  orientation: Orientation.landscape,
);
