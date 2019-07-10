#/bin/bash
#nmap -sP --max-retries=1 --host-timeout=1500ms 10.0.0.1


function refresh {
#refresh IP PLACE
	if ping -c 1 -W 5 $1 &> /dev/null
	then
	  sed -i "s/#$2 { background: red; }/#$2 { background: green; }/g" styles.css
	else
	  sed -i "s/#$2 { background: green; }/#$2 { background: red; }/g" styles.css
	fi
}

function refresh.port {
#refresh.port IP PORT PLACE
        if nc -z -w5 $1 $2 &> /dev/null
        then
          sed -i "s/#$3 { background: red; }/#$3 { background: green; }/g" styles.css
        else
          sed -i "s/#$3 { background: green; }/#$3 { background: red; }/g" styles.css
        fi
}

function refresh.web {
#refresh.web IP PLACE
        if wget -q --spider $1 &> /dev/null
        then
          sed -i "s/#$2 { background: red; }/#$2 { background: green; }/g" styles.css
        else
          sed -i "s/#$2 { background: green; }/#$2 { background: red; }/g" styles.css
        fi
}

function refresh.dns {
#refresh.dns IP PLACE
        if dig www.google.com @$1 &> /dev/null
        then
          sed -i "s/#$2 { background: red; }/#$2 { background: green; }/g" styles.css
        else
          sed -i "s/#$2 { background: green; }/#$2 { background: red; }/g" styles.css
        fi
}


refresh 8.8.8.8 A
refresh 10.11.49.34 B
refresh.dns 172.16.16.1 C
refresh 10.11.49.4 D
refresh.port 10.11.49.1 139 E
refresh 10.11.49.35 F
refresh 10.11.49.24 G
refresh.port 10.11.49.8 6222 H
refresh.port 10.11.49.8 25 I
refresh 10.11.49.36 J
refresh 10.11.49.110 K
refresh.web www.salud.rionegro.gov.ar L

