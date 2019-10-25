function [aeroForces] = paramSpace_4_3_1_1_2_2_1(sailStates,airStates)

	CL = (3.646868)*sailStates.alpha + (-0.042732)*sailStates.beta + (-1.628655)*sailStates.p + (27.945663)*sailStates.q + (0.632635)*sailStates.r + (0.010378)*sailStates.de;
	CD = 0.043360;
	CY = (0.046621)*sailStates.alpha + (-0.025612)*sailStates.beta + (0.095091)*sailStates.p + (0.662188)*sailStates.q + (-0.018986)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (0.539025)*sailStates.alpha + (-0.084316)*sailStates.beta + (-0.448172)*sailStates.p + (2.967894)*sailStates.q + (0.359379)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-13.110022)*sailStates.alpha + (0.129329)*sailStates.beta + (5.431425)*sailStates.p + (-110.966957)*sailStates.q + (-2.113447)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (0.112933)*sailStates.alpha + (0.015227)*sailStates.beta + (-0.199035)*sailStates.p + (0.529805)*sailStates.q + (-0.014337)*sailStates.r + (-0.000173)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end