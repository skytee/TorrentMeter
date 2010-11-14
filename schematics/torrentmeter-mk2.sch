v 20100214 2
C 40000 40000 0 0 0 title-B.sym
C 45600 46700 1 0 0 BC547-1.sym
{
T 46500 47400 5 10 0 0 0 0 1
device=BC547
T 46500 47200 5 10 0 1 0 0 1
refdes=Q?
T 46400 46800 5 10 0 0 0 0 1
footprint=TO92
}
C 45600 46300 1 90 0 resistor-1.sym
{
T 45200 46600 5 10 0 0 90 0 1
device=RESISTOR
T 45900 46800 5 10 1 1 180 0 1
refdes=4k7
}
N 45100 47200 45600 47200 4
N 46200 46300 46200 46700 4
N 45100 49500 46200 49500 4
C 50200 47200 1 0 0 BC547-1.sym
{
T 51100 47900 5 10 0 0 0 0 1
device=BC547
T 51100 47700 5 10 0 1 0 0 1
refdes=Q?
T 51000 47300 5 10 0 0 0 0 1
footprint=TO92
}
C 46300 47700 1 90 0 resistor-1.sym
{
T 45900 48000 5 10 0 0 90 0 1
device=RESISTOR
T 46700 48200 5 10 1 1 180 0 1
refdes=470R
}
C 46000 48600 1 270 1 led-3.sym
{
T 46650 49550 5 10 0 0 270 6 1
device=LED
T 46550 49050 5 10 1 1 270 6 1
refdes=D1
}
C 50000 47800 1 180 0 resistor-1.sym
{
T 49700 47400 5 10 0 0 180 0 1
device=RESISTOR
T 49500 47900 5 10 1 1 0 0 1
refdes=5k7
}
C 50900 48200 1 90 0 resistor-1.sym
{
T 50500 48500 5 10 0 0 90 0 1
device=RESISTOR
T 51300 48700 5 10 1 1 180 0 1
refdes=470R
}
P 45100 49500 44600 49500 1 0 0
{
T 45100 49500 5 10 0 0 0 0 1
pintype=unknown
T 44545 49495 5 10 1 1 0 6 1
pinlabel=Arduino
T 44695 49545 5 10 1 1 0 0 1
pinnumber=5V
T 45100 49500 5 10 0 0 0 0 1
pinseq=0
}
P 45100 47200 44600 47200 1 0 0
{
T 45100 47200 5 10 0 0 0 0 1
pintype=unknown
T 44545 47195 5 10 1 1 0 6 1
pinlabel=Arduino
T 44695 47245 5 10 1 1 0 0 1
pinnumber=9
T 45100 47200 5 10 0 0 0 0 1
pinseq=0
}
P 45100 46300 44600 46300 1 0 0
{
T 45100 46300 5 10 0 0 0 0 1
pintype=unknown
T 44545 46295 5 10 1 1 0 6 1
pinlabel=Arduino
T 44695 46345 5 10 1 1 0 0 1
pinnumber=GND
T 45100 46300 5 10 0 0 0 0 1
pinseq=0
}
C 50900 46300 1 90 0 resistor-1.sym
{
T 50500 46600 5 10 0 0 90 0 1
device=RESISTOR
T 51200 46800 5 10 1 1 180 0 1
refdes=4k7
}
C 50300 46300 1 90 0 resistor-1.sym
{
T 49900 46600 5 10 0 0 90 0 1
device=RESISTOR
T 50600 46800 5 10 1 1 180 0 1
refdes=4k7
}
N 50200 47200 50200 47700 4
N 50200 47700 50000 47700 4
N 51700 47200 50800 47200 4
N 52300 46300 52300 46700 4
P 52300 47900 52800 47900 1 0 0
{
T 52300 47900 5 10 0 0 0 0 1
pintype=unknown
T 52855 47895 5 10 1 1 0 0 1
pinlabel=Meter
T 52705 47945 5 10 1 1 0 6 1
pinnumber=-
T 52300 47900 5 10 0 0 0 0 1
pinseq=0
}
P 52300 48200 52800 48200 1 0 0
{
T 52300 48200 5 10 0 0 0 0 1
pintype=unknown
T 52855 48195 5 10 1 1 0 0 1
pinlabel=Meter
T 52705 48245 5 10 1 1 0 6 1
pinnumber=+
T 52300 48200 5 10 0 0 0 0 1
pinseq=0
}
N 50800 49500 50800 49100 4
N 52300 48200 52300 49500 4
N 52300 47900 52300 47700 4
P 46200 47700 47200 47700 1 0 0
{
T 46200 47700 5 10 0 0 0 0 1
pintype=unknown
T 47255 47695 5 10 1 1 0 0 1
pinlabel=out
T 47105 47745 5 10 0 1 0 6 1
pinnumber=0
T 46200 47700 5 10 0 0 0 0 1
pinseq=0
}
N 45100 46300 46500 46300 4
P 46500 46300 47200 46300 1 0 0
{
T 46500 46300 5 10 0 0 0 0 1
pintype=unknown
T 47255 46295 5 10 1 1 0 0 1
pinlabel=GND
T 47105 46345 5 10 0 1 0 6 1
pinnumber=0
T 46500 46300 5 10 0 0 0 0 1
pinseq=0
}
P 49100 47700 48700 47700 1 0 0
{
T 49100 47700 5 10 0 0 0 0 1
pintype=unknown
T 48645 47695 5 10 1 1 0 6 1
pinlabel=in
T 49100 47700 5 10 0 0 0 0 1
pinseq=0
}
P 49000 46300 48700 46300 1 0 0
{
T 49000 46300 5 10 0 0 0 0 1
pintype=unknown
T 48645 46295 5 10 1 1 0 6 1
pinlabel=GND
T 48795 46345 5 10 0 1 0 0 1
pinnumber=0
T 49000 46300 5 10 0 0 0 0 1
pinseq=0
}
N 49000 46300 52300 46300 4
P 49000 49500 48700 49500 1 0 0
{
T 49000 49500 5 10 0 0 0 0 1
pintype=unknown
T 48645 49495 5 10 1 1 0 6 1
pinlabel=Vcc
T 48795 49545 5 10 0 1 0 0 1
pinnumber=0
T 49000 49500 5 10 0 0 0 0 1
pinseq=0
}
N 49000 49500 52300 49500 4
C 51700 46700 1 0 0 2N2222-1.sym
{
T 52600 47400 5 10 0 0 0 0 1
device=2N2222
T 52600 47200 5 10 0 1 0 0 1
refdes=Q?
}
