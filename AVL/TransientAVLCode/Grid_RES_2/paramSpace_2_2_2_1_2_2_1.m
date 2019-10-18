function [aeroForces] = paramSpace_2_2_2_1_2_2_1(sailStates,airStates)

	CL = (5.512090)*sailStates.alpha + (-4.142552)*sailStates.beta + (-3.511657)*sailStates.p + (48.306522)*sailStates.q + (2.328454)*sailStates.r + (0.010529)*sailStates.de;
	CD = -6.633570;
	CY = (1.870115)*sailStates.alpha + (-0.283033)*sailStates.beta + (0.356994)*sailStates.p + (16.137592)*sailStates.q + (-0.035570)*sailStates.r + (0.003076)*sailStates.de;

	Cl = (-6.122869)*sailStates.alpha + (-1.315113)*sailStates.beta + (-1.713920)*sailStates.p + (14.631279)*sailStates.q + (2.596820)*sailStates.r + (0.001294)*sailStates.de;
	Cm = (7.310673)*sailStates.alpha + (18.887272)*sailStates.beta + (10.863946)*sailStates.p + (-153.006302)*sailStates.q + (-8.285016)*sailStates.r + (-0.055461)*sailStates.de;
	Cn = (-1.970701)*sailStates.alpha + (0.403720)*sailStates.beta + (-1.009646)*sailStates.p + (-8.915821)*sailStates.q + (-0.209403)*sailStates.r + (-0.004038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end