use std::{ffi::OsStr, net::IpAddr};

use sysinfo::{Networks, System};

use super::entities::{
    CpuEntity, CpuUsageEntity, IpNetworkEntity, IpNetworkType, NetWorkEntity, ProcessEntity,
    ProcessStatusEntity,
};

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn get_networks() -> Vec<NetWorkEntity> {
    let mut sys = System::new_all();
    sys.refresh_all();

    let networks = Networks::new_with_refreshed_list();

    let entities: Vec<NetWorkEntity> = networks
        .iter()
        .map(|(interface_name, data)| NetWorkEntity {
            name: interface_name.clone(),
            total_received: data.total_received(),
            received: data.received(),
            transmitted: data.transmitted(),
            total_transmitted: data.total_transmitted(),
            packets_received: data.packets_received(),
            total_packets_received: data.total_packets_received(),
            packets_transmitted: data.packets_transmitted(),
            total_packets_transmitted: data.total_packets_transmitted(),
            errors_on_received: data.errors_on_received(),
            total_errors_on_received: data.total_errors_on_received(),
            errors_on_transmitted: data.errors_on_transmitted(),
            total_errors_on_transmitted: data.total_errors_on_transmitted(),
            mac_address: data.mac_address().to_string(),
            ip_networks: data
                .ip_networks()
                .iter()
                .map(|ip_network: &sysinfo::IpNetwork| {
                    let ip: IpNetworkType = match ip_network.addr {
                        IpAddr::V4(_) => IpNetworkType::IPV4,
                        IpAddr::V6(_) => IpNetworkType::IPV6,
                    };
                    IpNetworkEntity {
                        ip,
                        prefix: ip_network.prefix,
                    }
                })
                .collect(),
        })
        .collect();

    entities
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_processes() -> Vec<ProcessEntity> {
    let mut sys = System::new_all();
    sys.refresh_all();

    let entities: Vec<ProcessEntity> = sys
        .processes()
        .iter()
        .map(|(pid, process)| ProcessEntity {
            name: process.name().to_str().unwrap().to_string(),
            cmd: process
                .cmd()
                .iter()
                .map(|path: &std::ffi::OsString| path.to_str().unwrap().to_string())
                .collect(),
            pid: pid.as_u32(),
            parent: Some(process.parent().unwrap().as_u32()),
            environ: process
                .environ()
                .iter()
                .map(|str: &std::ffi::OsString| str.to_str().unwrap().to_string())
                .collect(),
            cwd: Some(process.cwd().unwrap().to_str().unwrap().to_string()),
            root: Some(process.root().unwrap().to_str().unwrap().to_string()),
            memory: process.memory(),
            virtual_memory: process.virtual_memory(),
            start_time: process.start_time(),
            run_time: process.run_time(),
            cpu_usage: process.cpu_usage(),
            user_id: match process.user_id() {
                Some(uid) => uid.to_string(),
                None => "".to_string(),
            },
            effective_user_id: match process.effective_user_id() {
                Some(uid) => Some(uid.to_string()),
                None => None,
            },
            group_id: match process.group_id() {
                Some(gid) => Some(gid.to_string()),
                None => None,
            },
            effective_group_id: match process.effective_group_id() {
                Some(gid) => Some(gid.to_string()),
                None => None,
            },
            process_status: match process.status() {
                sysinfo::ProcessStatus::Run => ProcessStatusEntity::Run,
                sysinfo::ProcessStatus::Sleep => ProcessStatusEntity::Sleep,
                sysinfo::ProcessStatus::Idle => ProcessStatusEntity::Idle,
                sysinfo::ProcessStatus::Zombie => ProcessStatusEntity::Zombie,
                sysinfo::ProcessStatus::Stop => ProcessStatusEntity::Stop,
                sysinfo::ProcessStatus::Unknown(u32) => ProcessStatusEntity::Unknown(u32),
                sysinfo::ProcessStatus::Tracing => ProcessStatusEntity::Tracing,
                sysinfo::ProcessStatus::Dead => ProcessStatusEntity::Dead,
                sysinfo::ProcessStatus::Wakekill => ProcessStatusEntity::Wakekill,
                sysinfo::ProcessStatus::Waking => ProcessStatusEntity::Waking,
                sysinfo::ProcessStatus::Parked => ProcessStatusEntity::Parked,
                sysinfo::ProcessStatus::LockBlocked => ProcessStatusEntity::LockBlocked,
                sysinfo::ProcessStatus::UninterruptibleDiskSleep => {
                    ProcessStatusEntity::UninterruptibleDiskSleep
                }
            },
        })
        .collect();

    entities
}

#[flutter_rust_bridge::frb(sync)]
pub fn find_pid(name: String) -> Option<String> {
    let mut sys: System = System::new_all();

    sys.refresh_all();

    let process: Option<(&sysinfo::Pid, &sysinfo::Process)> = sys
        .processes()
        .iter()
        .find(|voc: &(&sysinfo::Pid, &sysinfo::Process)| voc.1.name().eq(OsStr::new(&name)));

    let result: Option<String> = match process {
        Some(p) => {
            println!("current pid: {}", p.0);
            Some(p.0.to_string())
        }
        None => None,
    };
    result
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_cpus() -> Vec<CpuEntity> {
    let mut sys: System = System::new_all();
    sys.refresh_all();

    let result: Vec<CpuEntity> = sys
        .cpus()
        .iter()
        .map(|cpu| CpuEntity {
            name: cpu.name().to_string(),
            vendor_id: cpu.vendor_id().to_string(),
            brand: cpu.brand().to_string(),
            usage: CpuUsageEntity {
                percent: cpu.cpu_usage(),
                frequency: cpu.frequency(),
            },
        })
        .collect();
    result
}
