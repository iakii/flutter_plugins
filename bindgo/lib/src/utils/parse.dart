import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

import '../entity/bindgo.dart';

class Parser {
  late final YamlList data;

  List<String> args;
  List<BindGoEntity> list = [];

  Parser(this.args) {
    if (this.args.isNotEmpty && this.args.first == '--config') {
      if (this.args.length == 1) {
        print('BindGo: parameter error, --config xxx.yaml or leave none parameter');
        exit(1);
      }
      final file = File(args.lastOrNull ?? "");
      if (!(file.existsSync())) {
        print('BindGo: cannot find ${args.last} file here');
        exit(1);
      }

      this.data = loadYaml(file.readAsStringSync());
    } else {
      final file = File('pubspec.yaml');
      if (!(file.existsSync())) {
        print('BindGo: cannot find pubspec.yaml file here');
        exit(1);
      }

      final Map yamlMap = loadYaml(file.readAsStringSync());
      if (!(yamlMap['bindgo'] is YamlList)) {
        print('BindGo: config error');
        exit(1);
      }
      this.data = yamlMap['bindgo'];
    }

    List<BindGoEntity> list = [];

    for (var element in data) {
      var json = jsonDecode(jsonEncode(element));
      list.add(BindGoEntity.fromJson(json));
    }
    this.list = list;
  }
}
