import 'dart:io';

import 'package:bindgo/src/utils/utils.dart';
import 'package:path/path.dart';

import 'stub.dart';

class LinuxRunner extends Runner implements Compile {
  LinuxRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'linux';

  Future<void> run(List<String> archs, String workpath, [String? cc]) async {
    for (var arch in archs) {
      await runs(
        main: main,
        name: name,
        path: path,
        workpath: workpath,
        arch: arch,
        platformType: PlatformType.linux,
        cc: cc,
      );
    }
    await _fileAppend();
  }

  Future<void> _fileAppend() async {
    final filepath = join(Directory.current.path, path, 'CMakeLists.txt');
    final file = File(filepath);

    final data =
        '''\ninstall(FILES \${PROJECT_SOURCE_DIR}/lib$name.${getSuffix(PlatformType.windows)} DESTINATION "\${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)\n''';

    final content = await file.readAsString();
    final match = content.indexOf(data);
    if (match != -1) return;

    await file.writeAsString(data, mode: FileMode.append, flush: true);
  }
}
