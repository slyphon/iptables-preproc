#include "iptparse.h"

#define $TCP_PUBLIC 80,443,6667
#define $DNS_PORT 53
#define $NTP_PORT 123

ipt add PNET_IN pass tcp established
ipt add PNET_IN jump BLACK
ipt add PNET_IN jump BOGON
ipt add PNET_IN drop icmp icmptype echo-request
ipt add PNET_IN drop icmp icmptype redirect
ipt add PNET_IN pass icmp
ipt add PNET_IN pass tcp dports $TCP_PUBLIC new
ipt add PNET_IN drop tcp
ipt add PNET_IN pass udp dport $DNS_PORT
ipt add PNET_IN pass udp from-port $DNS_PORT established
ipt add PNET_IN pass udp from-port $NTP_PORT established
ipt add PNET_IN drop udp



