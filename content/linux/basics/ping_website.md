---
title: "Ping Website"
author: "Hampus Sandén"
date: 2019-05-08T00:00:00-07:00
description: "How to ping a website using the Linux command line."
type: technical_note
draft: false
---

Linux makes it easy to ping a website to test connectivity and/or whether the website is live. Once executed, `ping` will ping the website until it is stopped by pressing `ctrl-C`.

## Ping Google.com

{{< highlight markdown >}}
ping google.com
{{< /highlight >}}
```
PING google.com (216.58.211.142) 56(84) bytes of data.
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=1 ttl=56 time=8.90 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=2 ttl=56 time=12.9 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=3 ttl=56 time=9.08 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=4 ttl=56 time=9.78 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=5 ttl=56 time=11.2 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=6 ttl=56 time=11.0 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=7 ttl=56 time=12.2 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=8 ttl=56 time=10.4 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=9 ttl=56 time=9.14 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=10 ttl=56 time=13.2 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=11 ttl=56 time=12.6 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=12 ttl=56 time=11.9 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=13 ttl=56 time=11.9 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=14 ttl=56 time=9.37 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=15 ttl=56 time=15.8 ms
64 bytes from arn09s10-in-f142.1e100.net (216.58.211.142): icmp_seq=16 ttl=56 time=11.1 ms

--- google.com ping statistics ---
21 packets transmitted, 21 received, 0% packet loss, time 20029ms
rtt min/avg/max/mdev = 8.908/11.521/15.839/1.752 ms
```