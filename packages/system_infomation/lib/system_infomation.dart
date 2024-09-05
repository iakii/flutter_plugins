library system_infomation;

import 'package:system_infomation/src/rust/api/entities.dart';
import 'package:system_infomation/src/rust/api/system_info.dart' as sysinfo;
import 'package:system_infomation/src/rust/frb_generated.dart';

export 'src/rust/api/entities.dart'
    show
        NetWorkEntity,
        ProcessEntity,
        CpuEntity,
        CpuUsageEntity,
        IpNetworkEntity,
        IpNetworkType,
        ProcessStatusEntity;

class _SystemInfomationManager {
  // 单例
  static final _SystemInfomationManager instance =
      _SystemInfomationManager._internal();
  factory _SystemInfomationManager() => instance;
  _SystemInfomationManager._internal();

  bool inited = false;

  Future<void> init() async {
    inited = true;
    await RustLib.init();
  }

  List<NetWorkEntity> getNetworks() {
    if (!inited)
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    return sysinfo.getNetworks();
  }

  List<ProcessEntity> getProcesses() {
    if (!inited)
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    return sysinfo.getProcesses();
  }

  String? findPid(String name) {
    if (!inited)
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    return sysinfo.findPid(name: name);
  }

  List<CpuEntity> getCpus() {
    if (!inited)
      throw Exception(
          "You must call `await systemInfomationManager.init();` first.");
    return sysinfo.getCpus();
  }
}

final systemInfomationManager = _SystemInfomationManager.instance;
