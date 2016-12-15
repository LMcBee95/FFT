import cmath, math

for i in range(256):
	twiddle = cmath.exp(-i*2j*cmath.pi/256)
	#print float.hex(twiddle)
	print twiddle

