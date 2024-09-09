use sysinfo::System;

use super::entity::{CpuEntity, CpuUsageEntity};

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
