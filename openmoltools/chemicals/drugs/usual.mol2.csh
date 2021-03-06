#!/bin/csh -f
# usual.mol2.csh from http://zinc.docking.org
# Run this script to download ZINC
# Requires curl (default) or wget, http://wget.docking.org
#
# Thus, to run this script
#         using curl, do:     csh usual.mol2.csh
#         using wget, do:     csh usual.mol2.csh wget
#
setenv base http://zinc.docking.org/db/special/96
setenv fn .zinc.$$
cat <<+ > $fn
96_p0.0.mol2.gz
96_p1.0.mol2.gz
+
if ($#argv>0) then
     wget --base=$base -i < $fn
else
     foreach i (`cat $fn`)
          curl --url $base/$i -o $i
     end
endif
rm -f $fn
# File created on  Sat Feb 23 17:15:51 PST 2013
# This is the end of the csh script.

# JDC: Uncompress and combine files.
gunzip -f 96_p*.mol2.gz
cat 96_p0.0.mol2 96_p1.0.mol2 > Zdd.mol2
rm -f 96_p*.mol2
gzip -f Zdd.mol2
