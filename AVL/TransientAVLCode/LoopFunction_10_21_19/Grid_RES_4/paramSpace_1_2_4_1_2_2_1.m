function [aeroForces] = paramSpace_1_2_4_1_2_2_1(sailStates,airStates)

	CL = (3.646867)*sailStates.alpha + (-0.042732)*sailStates.beta + (-1.628655)*sailStates.p + (27.945663)*sailStates.q + (-0.632635)*sailStates.r + (0.010378)*sailStates.de;
	CD = 0.043360;
	CY = (-0.046621)*sailStates.alpha + (-0.024341)*sailStates.beta + (-0.095091)*sailStates.p + (-0.662188)*sailStates.q + (-0.018986)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.598085)*sailStates.alpha + (0.062881)*sailStates.beta + (-0.479720)*sailStates.p + (3.364863)*sailStates.q + (-0.365611)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-13.110022)*sailStates.alpha + (0.129329)*sailStates.beta + (5.431425)*sailStates.p + (-110.966957)*sailStates.q + (2.113447)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-0.094487)*sailStates.alpha + (0.014052)*sailStates.beta + (0.192760)*sailStates.p + (-0.450843)*sailStates.q + (-0.015577)*sailStates.r + (0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end