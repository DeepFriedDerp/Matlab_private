function [aeroForces] = paramSpace_2_2_2_1_2_1_1(sailStates,airStates)

	CL = (5.516657)*sailStates.alpha + (-4.181291)*sailStates.beta + (-3.506055)*sailStates.p + (48.337494)*sailStates.q + (2.401304)*sailStates.r + (0.010527)*sailStates.de;
	CD = -6.697980;
	CY = (1.863353)*sailStates.alpha + (-0.278473)*sailStates.beta + (0.402162)*sailStates.p + (15.856091)*sailStates.q + (-0.041715)*sailStates.r + (0.003021)*sailStates.de;

	Cl = (-6.117692)*sailStates.alpha + (-1.343099)*sailStates.beta + (-1.710424)*sailStates.p + (14.641103)*sailStates.q + (2.656496)*sailStates.r + (0.001282)*sailStates.de;
	Cm = (7.520015)*sailStates.alpha + (19.016985)*sailStates.beta + (10.799582)*sailStates.p + (-152.740479)*sailStates.q + (-8.524764)*sailStates.r + (-0.055431)*sailStates.de;
	Cn = (-1.992876)*sailStates.alpha + (0.398484)*sailStates.beta + (-1.103375)*sailStates.p + (-8.280578)*sailStates.q + (-0.204678)*sailStates.r + (-0.003959)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end