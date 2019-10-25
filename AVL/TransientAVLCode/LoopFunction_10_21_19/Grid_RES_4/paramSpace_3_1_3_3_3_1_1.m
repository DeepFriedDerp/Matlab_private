function [aeroForces] = paramSpace_3_1_3_3_3_1_1(sailStates,airStates)

	CL = (4.201771)*sailStates.alpha + (-0.095115)*sailStates.beta + (-2.274770)*sailStates.p + (31.794273)*sailStates.q + (-0.481666)*sailStates.r + (0.010582)*sailStates.de;
	CD = -0.193760;
	CY = (0.102626)*sailStates.alpha + (-0.024125)*sailStates.beta + (-0.316990)*sailStates.p + (0.563443)*sailStates.q + (0.020796)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.283718)*sailStates.alpha + (0.102538)*sailStates.beta + (-1.032785)*sailStates.p + (8.129220)*sailStates.q + (-0.502735)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-14.843502)*sailStates.alpha + (0.355770)*sailStates.beta + (8.021826)*sailStates.p + (-129.238037)*sailStates.q + (1.614857)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.368890)*sailStates.alpha + (-0.011018)*sailStates.beta + (0.756691)*sailStates.p + (-4.084815)*sailStates.q + (-0.012257)*sailStates.r + (-0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end