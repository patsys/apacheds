#!/bin/bash
echo 'export DN_COMP=`echo $DN | sed 's/,.*//'`
export RDN=${DN_COMP/=/: }
export RDN_VAL=`echo $DN_COMP | sed 's/.*=//'`
export CTX_ENTRY=$(base64 -w 0 <<EOF
dn: $DN
objectClass: $OBJECT_CLASS
$RDN
EOF
)' >&3
