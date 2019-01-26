#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

EPPOD=${EPPOD:-$SRCDIR/EPPOd}
EPPOCLI=${EPPOCLI:-$SRCDIR/EPPO-cli}
EPPOTX=${EPPOTX:-$SRCDIR/EPPO-tx}
EPPOQT=${EPPOQT:-$SRCDIR/qt/EPPO-qt}

[ ! -x $EPPOD ] && echo "$EPPOD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($EPPOCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for EPPOd if --version-string is not set,
# but has different outcomes for EPPO-qt and EPPO-cli.
echo "[COPYRIGHT]" > footer.h2m
$EPPOD --version | sed -n '1!p' >> footer.h2m

for cmd in $EPPOD $EPPOCLI $EPPOTX $EPPOQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
