server = true
bootstrap_expect = 1
ui_config = {
    enabled = true
}
datacenter = "dc0"
data_dir = "/var/lib/consul/"
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"
advertise_addr = "192.168.34.10"
ports {
    http = 8500
    grpc = 8502
    serf_lan = 8301
}
connect = {
    enabled = true
}