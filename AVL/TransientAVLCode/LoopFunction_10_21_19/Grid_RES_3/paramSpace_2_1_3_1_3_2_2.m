function [aeroForces] = paramSpace_2_1_3_1_3_2_2(sailStates,airStates)

	CL = (4.163143)*sailStates.alpha + (-0.029155)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-0.432779)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.024960;
	CY = (0.210641)*sailStates.alpha + (-0.024405)*sailStates.beta + (-0.255038)*sailStates.p + (1.697132)*sailStates.q + (0.000159)*sailStates.r + (0.000365)*sailStates.de;

	Cl = (1.421212)*sailStates.alpha + (0.033515)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-0.330927)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.906099)*sailStates.alpha + (0.025103)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (1.422085)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.277210)*sailStates.alpha + (-0.000659)*sailStates.beta + (0.533383)*sailStates.p + (-3.789122)*sailStates.q + (-0.000452)*sailStates.r + (-0.000543)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end