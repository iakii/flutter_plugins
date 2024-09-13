library system_infomation;

import 'package:flutter_rust_lib_core/flutter_rust_lib_core.dart' as core;

class _SystemInfomationManager {
  // 单例
  static final _SystemInfomationManager instance =
      _SystemInfomationManager._internal();
  factory _SystemInfomationManager() => instance;
  _SystemInfomationManager._internal();

  Future<void> init() async {
    await core.flutterRustLibCore.init();
  }

  List<core.NetWorkEntity> getNetworks() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return core.getNetworks();
  }

  List<core.ProcessEntity> getProcesses() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return core.getProcesses();
  }

  Future<String?> findPid(String name) async {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return await core.findPid(name: name);
  }

  List<core.CpuEntity> getCpus() {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return core.getCpus();
  }

  bool kill(String name) {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return core.kill(name: name);
  }

  Future<(Map<String, BigInt>, Map<String, String?>)> getSystemInfo() async {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    return await core.getSystemInfo();
  }

  Future<void> systemInfoFmt() async {
    if (!core.flutterRustLibCore.isInit) {
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    }
    await core.systemInfoFmt();
  }
}

final systemInfomationManager = _SystemInfomationManager.instance;
