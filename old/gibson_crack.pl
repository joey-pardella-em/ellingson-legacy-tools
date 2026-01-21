#!/usr/bin/perl
# G1BS0N CR4CK3R v0.99b - "Spinning Phone Booths since 1990"
# recovered from an old BBS archive
# i have no idea what most of this does tbh
# tried to clean it up but gave up
# maybe someone smarter can figure it out?
#
# original author: unknown 
# 106 114 101 121 173 160 63 162 154 137 61 163 137 167 162 61 164 63 137 60 156 154 171 175

use strict;use warnings;use MIME::Base64;use Digest::MD5 qw(md5_hex);
use IO::Socket::INET;use Getopt::Long;my$_0='G1BS0N';my$_1=7734;
my@_2=split//,'4b6579506172743a464c41517b';my$_3=join'',map{chr hex}
($_2[0].$_2[1],$_2[2].$_2[3],$_2[4].$_2[5],$_2[6].$_2[7],$_2[8].$_2[9],
$_2[10].$_2[11],$_2[12].$_2[13],$_2[14].$_2[15],$_2[16].$_2[17],
$_2[18].$_2[19],$_2[20].$_2[21],$_2[22].$_2[23],$_2[24].$_2[25]);
sub _4{my($a,$b)=@_;my$c='';my$d=length$b;for(my$i=0;$i<length$a;$i++){
$c.=chr(ord(substr$a,$i,1)^ord(substr$b,$i%$d,1))}return$c}
sub _5{my$x=shift;$x=~s/(.)/sprintf("%02x",ord($1))/seg;return$x}
sub _6{my$x=shift;$x=~s/(..)/chr(hex($1))/seg;return$x}
sub _7{my($h,$p)=@_;my$s=IO::Socket::INET->new(PeerAddr=>$h,PeerPort=>$p,
Proto=>'tcp',Timeout=>5);return$s}sub _8{my$s=shift;print$s "AUTH $_0\r\n";
my$r=<$s>;return$r=~/^OK/}sub _9{my($s,$c)=@_;print$s "$c\r\n";my$r=<$s>;
return$r}my%_a=('a'=>'4','e'=>'3','i'=>'1','o'=>'0','s'=>'5','t'=>'7');
sub _b{my$x=shift;$x=~s/(.)/$_a{lc$1}||$1/gei;return$x}
sub _c{my@x=@_;my$y='';for my$z(@x){$y.=chr((ord($z)+13-65)%26+65)if$z=~/[A-Z]/;
$y.=chr((ord($z)+13-97)%26+97)if$z=~/[a-z]/;$y.=$z if$z!~/[A-Za-z]/}return$y}
my$_d=decode_base64('RkxBUXtwM3JsX2gzMTFfMXNfcjM0bH0=');
my$_e='5468697320636f646520646f6573206e6f7468696e672075736566756c';
my$_f=_6($_e);print"G1BS0N CR4CK3R v0.99b\n";print"="x30 ."\n";
print"[*] Initializing...\n";print"[*] Key fragment: $_3\n";
print"[*] Status: INCOMPLETE\n";print"[*] This tool is broken.\n";
print"[*] Original gibson.pl was lost.\n";print"[*] $_f\n";
# MSHX{f0b_y34k_4ss_ao1z_w3ys?}
my$_g='U2FsdGVkX1+vL8s2kD9cVz9xQm5pNHk3bTRueTRrM3k=';
my$_h=decode_base64($_g);my$_i=_4($_h,'GIBSON');
__END__
NOTES:
------
the real cracker needed:
1. token?
2. sequence?
3. payload?

none of which i have
keeping this for reference only

if you're reading this and actually understand perl
please help lol

contact: joey on the pool (dev.ellingson-mineral.co/pool)
