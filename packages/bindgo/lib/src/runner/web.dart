import 'package:bindgo/src/utils/platform.dart';

import 'stub.dart';

class WebRunner extends Runner implements Compile {
  WebRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'web';

  Future<void> run(List<String> archs, String workpath, [String? cc]) async {
    for (var arch in archs) {
      await runs(
        main: main,
        name: name,
        workpath: workpath,
        path: path,
        arch: arch,
        platformType: PlatformType.web,
        cc: cc,
      );
    }
  }
}
