import 'dart:io';

import 'package:bindgo/src/utils/utils.dart';
import 'package:path/path.dart';
import 'package:process_run/shell_run.dart';

class Cmd {
  Cmd(Map<String, String> env)
      : _shell = Shell(
          environment: env,
          verbose: false,
        );

  final Shell _shell;

  Future<void> run({
    required String main,
    required String name,
    required String workpath,
    required String dest,
    required PlatformType platform,
  }) async {
    final suffix = getSuffix(platform);
    final file = join(Directory.current.path, dest, 'lib$name.$suffix');
    var shell = _shell.pushd(join(Directory.current.path, workpath));
    await shell
        .run("go build -buildmode=c-shared -ldflags '-s -w' -o $file $main");
  }
}
