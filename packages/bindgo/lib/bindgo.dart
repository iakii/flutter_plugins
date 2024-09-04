library bindgo;

import 'package:bindgo/src/runner/runner.dart';
import 'package:bindgo/src/utils/utils.dart';

export 'src/utils/load.dart';

class BindGo {
  List<String> args;
  BindGo(this.args) : _parser = Parser(args);

  final Parser _parser;

  Future<void> run() async {
    final list = _parser.list;

    for (var entity in list) {
      final main = entity.main;
      final name = entity.name;
      final workpath = entity.path;
      // print("\n\n");
      // print(entity.platforms);

      for (var entry in entity.platforms) {
        // print('entry.name==$entry.name');
        late Compile runner;
        switch (entry.name) {
          case 'android':
            runner = AndroidRunner(main: main, name: name);
            break;
          case 'ios':
            runner = IOSRunner(main: main, name: name);
            break;
          case 'windows':
            runner = WindowsRunner(main: main, name: name);
            break;
          case 'macos':
            runner = MacOSRunner(main: main, name: name);
            break;
          case 'linux':
            runner = LinuxRunner(main: main, name: name);
            break;
          case 'web':
            runner = WebRunner(main: main, name: name);
            break;
          default:
            throw 'BindGo: the platform ${entry.name} is not implemented';
        }

        final archs = entry.arch;
        final cc = entry.cc;
        await runner.run(archs, workpath, cc);
      }
    }
  }
}
