use std::ffi::OsStr;

use sysinfo::{ProcessesToUpdate, System};

use super::entity::{ProcessEntity, ProcessStatusEntity};

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
                sysinfo::ProcessStatus::Wakekill => ProcessStatusEntity::WakeKill,
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

pub fn find_pid(name: String) -> Option<String> {
    let mut sys: System = System::new_all();

    sys.refresh_processes(ProcessesToUpdate::All);

    let process = sys.processes_by_exact_name(OsStr::new(&name)).last();

    let result: Option<String> = match process {
        Some(p) => Some(p.pid().to_string()),
        None => None,
    };
    result.into()
}

#[flutter_rust_bridge::frb(sync)]
pub fn kill(name: String) -> bool {
    let mut sys: System = System::new_all();

    sys.refresh_processes(ProcessesToUpdate::All);

    let process = sys.processes_by_exact_name(OsStr::new(&name)).last();

    match process {
        Some(p) => p.kill(),
        None => false,
    }
}
