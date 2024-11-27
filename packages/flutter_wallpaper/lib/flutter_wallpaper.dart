library flutter_wallpaper;

import 'package:flutter_wallpaper/flutter_wallpaper.dart';

export 'src/rust/api/wallpaper.dart';
export 'src/rust/frb_generated.dart' show RustLib;

class _SystemWallpaperManager {
  // 单例
  static final _SystemWallpaperManager instance = _SystemWallpaperManager._internal();
  factory _SystemWallpaperManager() => instance;
  _SystemWallpaperManager._internal();

  bool _inited = false;

  Future<void> init() async {
    _inited = true;
    await RustLib.init();
  }

  Future<void> setWallpaperFromPath(String path) async {
    if (!_inited) await init();

    setFromPath(path: path);
  }
}

final wallpaperManager = _SystemWallpaperManager.instance;
