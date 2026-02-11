data_dir = "/var/lib/consul/"
server = false
datacenter = "dc0"
bind_addr = "0.0.0.0"
advertise_addr = "{{ GetPrivateInterfaces | include \"network\" \"192.168.34.0/24\" | attr \"address\" }}"
client_addr = "127.0.0.1"
ports {
    grpc = 8502
    serf_lan = 8301
}  
retry_join = ["192.168.34.10"]