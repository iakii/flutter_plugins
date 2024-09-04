use std::ffi::OsStr;

use sysinfo::System;

pub fn find_pid(name: String) -> Option<String> {
    let mut sys = System::new_all();

    sys.refresh_all();


    let process = sys.processes().iter().find(|voc| voc.1.name().eq(OsStr::new(&name)));

    let result = match process {
        Some(p) => {
            println!("current pid: {}", p.0);
            Some(p.0.to_string())
        }
        None => None,
    };
    result
}

pub fn local_host() -> Option<String> {
    let mut sys = System::new_all();

    sys.refresh_all();

    println!("System host name:        {:?}", System::host_name());

    println!("total memory: {} bytes", sys.total_memory());
    println!("used memory : {} bytes", sys.used_memory());
    println!("total swap  : {} bytes", sys.total_swap());
    println!("used swap   : {} bytes", sys.used_swap());

    // Display system information:
    println!("System name:             {:?}", System::name());
    println!("System kernel version:   {:?}", System::kernel_version());
    println!("System OS version:       {:?}", System::os_version());
    println!("System host name:        {:?}", System::host_name());

    // Number of CPUs:
    println!("NB CPUs: {}", sys.cpus().len());

    // Display processes ID, name na disk usage:
    for (pid, process) in sys.processes() {
        println!("[{pid}] {:?} {:?}", process.name(), process.disk_usage());
    }
    

    System::host_name()
}
