// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'entities.freezed.dart';

// These types are ignored because they are not used by any `pub` functions: `SystemInfoEntity`

class CpuEntity {
  final String name;
  final String vendorId;
  final String brand;
  final CpuUsageEntity usage;

  const CpuEntity({
    required this.name,
    required this.vendorId,
    required this.brand,
    required this.usage,
  });

  @override
  int get hashCode =>
      name.hashCode ^ vendorId.hashCode ^ brand.hashCode ^ usage.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CpuEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          vendorId == other.vendorId &&
          brand == other.brand &&
          usage == other.usage;
}

class CpuUsageEntity {
  final double percent;
  final BigInt frequency;

  const CpuUsageEntity({
    required this.percent,
    required this.frequency,
  });

  @override
  int get hashCode => percent.hashCode ^ frequency.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CpuUsageEntity &&
          runtimeType == other.runtimeType &&
          percent == other.percent &&
          frequency == other.frequency;
}

class IpNetworkEntity {
  final IpNetworkType ip;
  final int prefix;

  const IpNetworkEntity({
    required this.ip,
    required this.prefix,
  });

  @override
  int get hashCode => ip.hashCode ^ prefix.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IpNetworkEntity &&
          runtimeType == other.runtimeType &&
          ip == other.ip &&
          prefix == other.prefix;
}

enum IpNetworkType {
  ipv4,
  ipv6,
  ;
}

class NetWorkEntity {
  final String name;
  final BigInt totalReceived;
  final BigInt received;
  final BigInt transmitted;
  final BigInt totalTransmitted;
  final BigInt packetsReceived;
  final BigInt totalPacketsReceived;
  final BigInt packetsTransmitted;
  final BigInt totalPacketsTransmitted;
  final BigInt errorsOnReceived;
  final BigInt totalErrorsOnReceived;
  final BigInt errorsOnTransmitted;
  final BigInt totalErrorsOnTransmitted;
  final String macAddress;
  final List<IpNetworkEntity> ipNetworks;

  const NetWorkEntity({
    required this.name,
    required this.totalReceived,
    required this.received,
    required this.transmitted,
    required this.totalTransmitted,
    required this.packetsReceived,
    required this.totalPacketsReceived,
    required this.packetsTransmitted,
    required this.totalPacketsTransmitted,
    required this.errorsOnReceived,
    required this.totalErrorsOnReceived,
    required this.errorsOnTransmitted,
    required this.totalErrorsOnTransmitted,
    required this.macAddress,
    required this.ipNetworks,
  });

  @override
  int get hashCode =>
      name.hashCode ^
      totalReceived.hashCode ^
      received.hashCode ^
      transmitted.hashCode ^
      totalTransmitted.hashCode ^
      packetsReceived.hashCode ^
      totalPacketsReceived.hashCode ^
      packetsTransmitted.hashCode ^
      totalPacketsTransmitted.hashCode ^
      errorsOnReceived.hashCode ^
      totalErrorsOnReceived.hashCode ^
      errorsOnTransmitted.hashCode ^
      totalErrorsOnTransmitted.hashCode ^
      macAddress.hashCode ^
      ipNetworks.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetWorkEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          totalReceived == other.totalReceived &&
          received == other.received &&
          transmitted == other.transmitted &&
          totalTransmitted == other.totalTransmitted &&
          packetsReceived == other.packetsReceived &&
          totalPacketsReceived == other.totalPacketsReceived &&
          packetsTransmitted == other.packetsTransmitted &&
          totalPacketsTransmitted == other.totalPacketsTransmitted &&
          errorsOnReceived == other.errorsOnReceived &&
          totalErrorsOnReceived == other.totalErrorsOnReceived &&
          errorsOnTransmitted == other.errorsOnTransmitted &&
          totalErrorsOnTransmitted == other.totalErrorsOnTransmitted &&
          macAddress == other.macAddress &&
          ipNetworks == other.ipNetworks;
}

class ProcessEntity {
  final String name;
  final List<String> cmd;
  final int pid;
  final int? parent;
  final List<String> environ;
  final String? cwd;
  final String? root;
  final BigInt memory;
  final BigInt virtualMemory;
  final BigInt startTime;
  final BigInt runTime;
  final double cpuUsage;
  final String userId;
  final String? effectiveUserId;
  final String? groupId;
  final String? effectiveGroupId;
  final ProcessStatusEntity processStatus;

  const ProcessEntity({
    required this.name,
    required this.cmd,
    required this.pid,
    this.parent,
    required this.environ,
    this.cwd,
    this.root,
    required this.memory,
    required this.virtualMemory,
    required this.startTime,
    required this.runTime,
    required this.cpuUsage,
    required this.userId,
    this.effectiveUserId,
    this.groupId,
    this.effectiveGroupId,
    required this.processStatus,
  });

  @override
  int get hashCode =>
      name.hashCode ^
      cmd.hashCode ^
      pid.hashCode ^
      parent.hashCode ^
      environ.hashCode ^
      cwd.hashCode ^
      root.hashCode ^
      memory.hashCode ^
      virtualMemory.hashCode ^
      startTime.hashCode ^
      runTime.hashCode ^
      cpuUsage.hashCode ^
      userId.hashCode ^
      effectiveUserId.hashCode ^
      groupId.hashCode ^
      effectiveGroupId.hashCode ^
      processStatus.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProcessEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          cmd == other.cmd &&
          pid == other.pid &&
          parent == other.parent &&
          environ == other.environ &&
          cwd == other.cwd &&
          root == other.root &&
          memory == other.memory &&
          virtualMemory == other.virtualMemory &&
          startTime == other.startTime &&
          runTime == other.runTime &&
          cpuUsage == other.cpuUsage &&
          userId == other.userId &&
          effectiveUserId == other.effectiveUserId &&
          groupId == other.groupId &&
          effectiveGroupId == other.effectiveGroupId &&
          processStatus == other.processStatus;
}

@freezed
sealed class ProcessStatusEntity with _$ProcessStatusEntity {
  const ProcessStatusEntity._();

  /// ## Linux
  ///
  /// Idle kernel thread.
  ///
  /// ## macOs/FreeBSD
  ///
  /// Process being created by fork.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.idle() = ProcessStatusEntity_Idle;

  /// Running.
  const factory ProcessStatusEntity.run() = ProcessStatusEntity_Run;

  /// ## Linux
  ///
  /// Sleeping in an interruptible waiting.
  ///
  /// ## macOS/FreeBSD
  ///
  /// Sleeping on an address.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.sleep() = ProcessStatusEntity_Sleep;

  /// ## Linux
  ///
  /// Stopped (on a signal) or (before Linux 2.6.33) trace stopped.
  ///
  /// ## macOS/FreeBSD
  ///
  /// Process debugging or suspension.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.stop() = ProcessStatusEntity_Stop;

  /// ## Linux/FreeBSD/macOS
  ///
  /// Zombie process. Terminated but not reaped by its parent.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.zombie() = ProcessStatusEntity_Zombie;

  /// ## Linux
  ///
  /// Tracing stop (Linux 2.6.33 onward). Stopped by debugger during the tracing.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.tracing() = ProcessStatusEntity_Tracing;

  /// ## Linux
  ///
  /// Dead/uninterruptible sleep (usually IO).
  ///
  /// ## FreeBSD
  ///
  /// A process should never end up in this state.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.dead() = ProcessStatusEntity_Dead;

  /// ## Linux
  ///
  /// Wakekill (Linux 2.6.33 to 3.13 only).
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.wakekill() = ProcessStatusEntity_Wakekill;

  /// ## Linux
  ///
  /// Waking (Linux 2.6.33 to 3.13 only).
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.waking() = ProcessStatusEntity_Waking;

  /// ## Linux
  ///
  /// Parked (Linux 3.9 to 3.13 only).
  ///
  /// ## macOS
  ///
  /// Halted at a clean point.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.parked() = ProcessStatusEntity_Parked;

  /// ## FreeBSD
  ///
  /// Blocked on a lock.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.lockBlocked() =
      ProcessStatusEntity_LockBlocked;

  /// ## Linux
  ///
  /// Waiting in uninterruptible disk sleep.
  ///
  /// ## Other OS
  ///
  /// Not available.
  const factory ProcessStatusEntity.uninterruptibleDiskSleep() =
      ProcessStatusEntity_UninterruptibleDiskSleep;

  /// Unknown.
  const factory ProcessStatusEntity.unknown(
    int field0,
  ) = ProcessStatusEntity_Unknown;
}
