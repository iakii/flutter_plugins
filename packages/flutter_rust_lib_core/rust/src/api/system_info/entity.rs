use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct NetWorkEntity {
    pub name: String,
    pub total_received: u64,
    pub received: u64,
    pub transmitted: u64,
    pub total_transmitted: u64,
    pub packets_received: u64,
    pub total_packets_received: u64,
    pub packets_transmitted: u64,
    pub total_packets_transmitted: u64,
    pub errors_on_received: u64,
    pub total_errors_on_received: u64,
    pub errors_on_transmitted: u64,
    pub total_errors_on_transmitted: u64,
    pub mac_address: String,
    pub ip_networks: Vec<IpNetworkEntity>,
}
#[derive(Serialize, Deserialize, Debug)]
pub enum IpNetworkType {
    IPV4,
    IPV6,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct IpNetworkEntity {
    pub ip: IpNetworkType,
    pub prefix: u8,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct SystemInfoEntity {
    pub network: Vec<NetWorkEntity>,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct CpuEntity {
    pub name: String,
    pub vendor_id: String,
    pub brand: String,
    pub usage: CpuUsageEntity,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct CpuUsageEntity {
    pub percent: f32,
    // pub data: Arc<CpuDataEntity>,
    // Cannot be frequency for each CPU apparently so we store it in the CPU usage...
    pub frequency: u64,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct ProcessEntity {
    pub name: String,
    pub cmd: Vec<String>,
    pub pid: u32,
    pub parent: Option<u32>,
    pub environ: Vec<String>,
    pub cwd: Option<String>,
    pub root: Option<String>,
    pub memory: u64,
    pub virtual_memory: u64,
    pub start_time: u64,
    pub run_time: u64,
    pub cpu_usage: f32,
    pub user_id: String,
    pub effective_user_id: Option<String>,
    pub group_id: Option<String>,
    pub effective_group_id: Option<String>,
    pub process_status: ProcessStatusEntity,
}

#[derive(Serialize, Deserialize, Debug)]
pub enum ProcessStatusEntity {
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
    Idle,
    /// Running.
    Run,
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
    Sleep,
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
    Stop,
    /// ## Linux/FreeBSD/macOS
    ///
    /// Zombie process. Terminated but not reaped by its parent.
    ///
    /// ## Other OS
    ///
    /// Not available.
    Zombie,
    /// ## Linux
    ///
    /// Tracing stop (Linux 2.6.33 onward). Stopped by debugger during the tracing.
    ///
    /// ## Other OS
    ///
    /// Not available.
    Tracing,
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
    Dead,
    /// ## Linux
    ///
    /// Wakekill (Linux 2.6.33 to 3.13 only).
    ///
    /// ## Other OS
    ///
    /// Not available.
    Wakekill,
    /// ## Linux
    ///
    /// Waking (Linux 2.6.33 to 3.13 only).
    ///
    /// ## Other OS
    ///
    /// Not available.
    Waking,
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
    Parked,
    /// ## FreeBSD
    ///
    /// Blocked on a lock.
    ///
    /// ## Other OS
    ///
    /// Not available.
    LockBlocked,
    /// ## Linux
    ///
    /// Waiting in uninterruptible disk sleep.
    ///
    /// ## Other OS
    ///
    /// Not available.
    UninterruptibleDiskSleep,
    /// Unknown.
    Unknown(u32),
}
