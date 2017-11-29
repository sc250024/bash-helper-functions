#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __reverse_ipv4
# DESCRIPTION:  Returns the full PTR record for a given ip address (10.1.2.3)
#       USAGE:  __reverse_ipv4 "10.1.2.3"
#     RETURNS:  The full PTR record 3.2.1.10.in-addr.arpa
#----------------------------------------------------------------------------------------------------------------------
__reverse_ipv4() {
    echo "$1" | awk -F. '{OFS="."; print $4,$3,$2,$1,"in-addr.arpa"}'
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __reverse_ipv4_in_zone
# DESCRIPTION:  Returns the partial PTR record for the IP address given in the given zone
#       USAGE:  __reverse_ipv4_in_zone "10.1.2.3" "1.10.in-addr.arpa"
#     RETURNS:  The partial PTR record (3.2)
#----------------------------------------------------------------------------------------------------------------------
__reverse_ipv4_in_zone() {
    __reverse_ipv4 "$1" | sed "s#\.$2##g"
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __reverse_ipv6
# DESCRIPTION:  Returns the full IPv6 PTR record for a given ip address (2600:1f14:502:7e03:f821:ff5c:b4f0:2380)
#       USAGE:  __reverse_ipv6 "2600:1f14:502:7e03:f821:ff5c:b4f0:2380"
#     RETURNS:  The full PTR record (0.8.3.2.0.f.4.b.c.5.f.f.1.2.8.f.3.0.e.7.2.0.5.0.4.1.f.1.0.0.6.2.ip6.arpa)
#----------------------------------------------------------------------------------------------------------------------
__reverse_ipv6() {
    echo "$1" | \
    awk -F: 'BEGIN {OFS=""; }{addCount = 9 - NF; for(i=1; i<=NF;i++){if(length($i) == 0){ for(j=1;j<=addCount;j++){$i = ($i "0000");} } else { $i = substr(("0000" $i), length($i)+5-4);}}; print}' | \
    rev | \
    sed -e "s/./&./g" | \
    awk '{print $1"ip6.arpa"}'
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __reverse_ipv6_in_zone
# DESCRIPTION:  Returns the partial IPv6 PTR record for the address given (BIND style); IPv6 only has one ARPA zone
#       USAGE:  __reverse_ipv6_in_zone "2600:1f14:502:7e03:f821:ff5c:b4f0:2380"
#     RETURNS:  The partial PTR record (0.8.3.2.0.f.4.b.c.5.f.f.1.2.8.f.3.0.e.7.2.0.5.0.4.1.f.1.0.0.6.2)
#----------------------------------------------------------------------------------------------------------------------
__reverse_ipv6_in_zone() {
    __reverse_ipv6 "$1" | sed "s#.ip6.arpa##g"
}
