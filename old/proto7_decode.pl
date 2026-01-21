#!/usr/bin/perl
# Protocol 7 Token Decoder
# another fragment from the BBS archives
# slightly less broken than gibson_crack.pl
# UOZJ{ki0g0x0o_7_w3x0w3i}

use strict;use warnings;use MIME::Base64;
my$_='SGFoYSB5b3UgdGhvdWdodCB0aGlzIHdhcyByZWFs';
my$x=decode_base64($_);my@t=unpack'C*',$x;
my@k=(71,73,66,83,79,78);my@o;
for(my$i=0;$i<@t;$i++){push@o,$t[$i]^$k[$i%@k]}
my$r=pack'C*',@o;

sub gen_token{
    my($emp_id,$dept,$quarter,$seed)=@_;
    # format: XXXX-YY-QZ-SSSS
    # but we don't know the seed generation algorithm
    # seed changes every 24 hours apparently
    return sprintf("%04d-%s-Q%d-%s",$emp_id,$dept,$quarter,$seed);
}

sub validate{
    my$token=shift;
    # validation logic unknown
    # need gibson source code
    return 0;
}

print"Protocol 7 Token Decoder\n";
print"========================\n";
print"Status: USELESS without seed algorithm\n";
print"Try: 4015-IT-Q3-????\n";
print"Hint: $_\n";
__END__
found reference to seed generation in meeting notes
something about "employee ID + department + quarter + rotating value"
but the rotation algorithm is unknown

might be time-based?
might be hash-based?
might be completely random?

dead end for now
