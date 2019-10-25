function [aeroForces] = paramSpace_3_4_2_3_1_2_1(sailStates,airStates)

	CL = (4.006745)*sailStates.alpha + (-0.071808)*sailStates.beta + (-2.281988)*sailStates.p + (32.613781)*sailStates.q + (0.422816)*sailStates.r + (0.010766)*sailStates.de;
	CD = 0.019280;
	CY = (-0.068834)*sailStates.alpha + (-0.024370)*sailStates.beta + (0.137624)*sailStates.p + (-0.432842)*sailStates.q + (-0.009005)*sailStates.r + (-0.000092)*sailStates.de;

	Cl = (1.041983)*sailStates.alpha + (-0.076796)*sailStates.beta + (-0.934346)*sailStates.p + (7.143473)*sailStates.q + (0.290399)*sailStates.r + (-0.000140)*sailStates.de;
	Cm = (-14.454967)*sailStates.alpha + (0.228666)*sailStates.beta + (7.765611)*sailStates.p + (-128.769608)*sailStates.q + (-1.417986)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.111439)*sailStates.alpha + (0.002962)*sailStates.beta + (-0.250962)*sailStates.p + (1.365424)*sailStates.q + (0.001375)*sailStates.r + (0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end