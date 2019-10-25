function [aeroForces] = paramSpace_3_3_3_2_2_3_3(sailStates,airStates)

	CL = (4.517220)*sailStates.alpha + (-0.107990)*sailStates.beta + (-2.995050)*sailStates.p + (39.443649)*sailStates.q + (1.400159)*sailStates.r + (0.011471)*sailStates.de;
	CD = -0.482670;
	CY = (0.083272)*sailStates.alpha + (-0.024937)*sailStates.beta + (0.576314)*sailStates.p + (-0.100923)*sailStates.q + (-0.037777)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.505999)*sailStates.alpha + (-0.314798)*sailStates.beta + (-1.528534)*sailStates.p + (12.952754)*sailStates.q + (1.227069)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-13.950800)*sailStates.alpha + (0.424267)*sailStates.beta + (9.873324)*sailStates.p + (-148.239990)*sailStates.q + (-4.754982)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.248922)*sailStates.alpha + (0.018209)*sailStates.beta + (-1.196645)*sailStates.p + (5.142784)*sailStates.q + (0.004533)*sailStates.r + (0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end