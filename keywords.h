#ifndef FILE_KEYWORDS_GUARD
#define FILE_KEYWORDS_GUARD

#define ipt iptables -v
#define nat -t nat
#define add -A
#define flush -F
#define delete -D
#define unchain -X
#define policy -P
#define in --in-interface
#define out --out-interface
#define from --source
#define to --destination
#define udp --protocol udp
#define tcp --protocol tcp
#define icmp --protocol icmp

#define sport --source-port 
#define dport --destination-port 
#define sports -m multiport --source-ports 
#define dports -m multiport --destination-ports 
#define icmptype --icmp-type 
#define uid -m owner --uid-owner 
#define gid -m owner --gid-owner 
#define established -m state --state ESTABLISHED 
#define new -m state --state NEW 
#define jump -j 
#define drop -j DROP 
#define shun -j DROP_LOG 
#define pass -j ACCEPT 
#define return -j RETURN 
#define dnat -j DNAT --to-destination 
#define snat -j SNAT --to-source 

#endif /* !FILE_KEYWORDS_GUARD */
