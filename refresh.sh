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
refresh IPB B
refresh.dns IPC C
refresh IPD D
refresh.port IPE 139 E
refresh IPF F
refresh IPG G
refresh.port IPH 6222 H
refresh.port IPI 25 I
refresh IPJ J
refresh IPK K
refresh.web url.com L

