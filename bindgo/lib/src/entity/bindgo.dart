import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();
  static T? Function<T extends Object?>(dynamic value) convert =
      <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

class BindGoEntity {
  BindGoEntity({
    required this.platforms,
    required this.path,
    required this.name,
    required this.main,
  });

  factory BindGoEntity.fromJson(Map<String, dynamic> json) {
    final List<Platforms>? platforms =
        json['platforms'] is List ? <Platforms>[] : null;
    if (platforms != null) {
      for (final dynamic item in json['platforms']!) {
        if (item != null) {
          tryCatch(() {
            platforms.add(Platforms.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return BindGoEntity(
      platforms: platforms!,
      path: asT<String>(json['path'])!,
      name: asT<String>(json['name'])!,
      main: asT<String>(json['main'])!,
    );
  }

  List<Platforms> platforms;
  String path;
  String name;
  String main;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platforms': platforms,
        'path': path,
        'name': name,
        'main': main,
      };

  BindGoEntity copy() {
    return BindGoEntity(
      platforms: platforms.map((Platforms e) => e.copy()).toList(),
      path: path,
      name: name,
      main: main,
    );
  }
}

class Platforms {
  Platforms({
    required this.name,
    required this.arch,
    this.cc,
  });

  factory Platforms.fromJson(Map<String, dynamic> json) {
    final List<String>? arch = json['arch'] is List ? <String>[] : null;
    if (arch != null) {
      for (final dynamic item in json['arch']!) {
        if (item != null) {
          tryCatch(() {
            arch.add(asT<String>(item)!);
          });
        }
      }
    }
    return Platforms(
      name: asT<String>(json['name'])!,
      cc: asT<String?>(json['cc']),
      arch: arch!,
    );
  }

  String? cc;
  String name;
  List<String> arch;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'arch': arch,
      };

  Platforms copy() {
    return Platforms(
      name: name,
      arch: arch.map((String e) => e).toList(),
    );
  }
}
