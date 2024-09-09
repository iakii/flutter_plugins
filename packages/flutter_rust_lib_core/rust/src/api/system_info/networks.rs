use std::net::IpAddr;

use sysinfo::{Networks, System};

use super::entity::{IpNetworkEntity, IpNetworkType, NetWorkEntity};

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
