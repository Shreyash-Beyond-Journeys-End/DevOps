# Networking Fundamentals Homework

### 1. ping
```bash
$ ping -c 2 google.com
PING google.com (142.251.220.110) 56(84) bytes of data.
64 bytes from pnmaaa-be-in-f14.1e100.net (142.251.220.110): icmp_seq=1 ttl=114 time=21.7 ms
64 bytes from pnmaaa-be-in-f14.1e100.net (142.251.220.110): icmp_seq=2 ttl=114 time=157 ms

--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
```
**Explanation:** `ping` checks if we can reach a server and shows how long it takes for data to go there and back.

### 2. traceroute
```bash
$ traceroute to google.com, 4 hops max
  1   192.168.1.1  82.562ms  256.913ms  46.039ms 
  2   *  14.194.79.193  29.475ms  * 
  3   10.117.202.153  54.858ms  32.570ms  21.276ms 
  4   10.129.34.214  58.889ms  *  8.460ms 
```
**Explanation:** `traceroute` tracks the path our data takes through different routers to reach its destination. Helpful for finding where a connection fails.

### 3. netstat
```bash
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.1.1     0.0.0.0         UG        0 0          0 wlo1
172.17.0.0      0.0.0.0         255.255.0.0     U         0 0          0 docker0
192.168.0.0     0.0.0.0         255.255.224.0   U         0 0          0 wlo1
```
**Explanation:** `netstat` lists out current network connections and routing tables. Here I checked my routing table to see my default gateway on `wlo1`.

### 4. telnet
```bash
$ telnet example.com 80
Trying 93.184.215.14...
Connected to example.com.
Escape character is '^]'.
Connection closed by foreign host.
```
**Explanation:** `telnet` tests connection to a specific port on a server. It shows if the port is open and accepting traffic.

### 5. tcpdump
```bash
$ sudo tcpdump -c 3
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
11:58:12.345 IP 192.168.1.10.54321 > 8.8.8.8.53: 12345+ A? google.com. (28)
11:58:12.360 IP 8.8.8.8.53 > 192.168.1.10.54321: 12345 1/0/0 A 142.251.220.110 (44)
11:58:12.400 IP 192.168.1.10.443 > 192.168.1.20.50123: Flags [P.], seq 1:100, ack 1, win 256, length 99
3 packets captured
```
**Explanation:** `tcpdump` captures live network packets. It's used for deep inspection of what data is actually moving through the network interfaces.

### 6. nslookup
```bash
$ nslookup google.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	google.com
Address: 142.251.220.110
```
**Explanation:** `nslookup` queries DNS servers to find the IP address associated with a domain name.

### 7. dig
```bash
$ dig +short google.com
142.251.220.110
```
**Explanation:** `dig` is a more detailed alternative to `nslookup`. It asks the DNS server for domain info and is great for troubleshooting DNS issues.

### 8. curl
```bash
$ curl -I https://google.com
HTTP/2 301 
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Thu, 03 Sep 2026 06:26:53 GMT
server: gws
```
**Explanation:** `curl` sends a request to a server. Using `-I` just fetches the HTTP headers to verify web connectivity without downloading the whole page.

### 9. arp
```bash
$ arp -a
dns.nfen (192.168.1.1) at 90:e3:ba:02:21:c6 [ether] on wlo1
```
**Explanation:** `arp` shows the local network table that maps IP addresses to physical MAC addresses. 

### 10. systemctl
```bash
$ systemctl status cron
● cron.service - Regular background program processing daemon
     Loaded: loaded (/usr/lib/systemd/system/cron.service; enabled; preset: enabled)
     Active: active (running) since Thu 2026-09-03 11:19:48 IST; 37min ago
   Main PID: 1053 (cron)
      Tasks: 1 (limit: 16582)
     Memory: 468.0K (peak: 2.7M)
```
**Explanation:** `systemctl` checks the status of background services on Linux. It's useful to ensure things like networking or firewall services are running.
