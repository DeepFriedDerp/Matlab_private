function [aeroForces] = paramSpace_3_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.911257)*sailStates.alpha + (-0.496217)*sailStates.beta + (-1.604681)*sailStates.p + (24.851559)*sailStates.q + (-2.018039)*sailStates.r + (0.010003)*sailStates.de;
	CD = -2.265890;
	CY = (0.405272)*sailStates.alpha + (-0.024620)*sailStates.beta + (-1.032774)*sailStates.p + (0.221993)*sailStates.q + (0.067668)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.238406)*sailStates.alpha + (0.369718)*sailStates.beta + (-0.506787)*sailStates.p + (2.906757)*sailStates.q + (-1.978278)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-14.805825)*sailStates.alpha + (2.036663)*sailStates.beta + (6.234312)*sailStates.p + (-111.854546)*sailStates.q + (6.861120)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-1.981865)*sailStates.alpha + (-0.036396)*sailStates.beta + (2.318459)*sailStates.p + (-10.597586)*sailStates.q + (-0.020449)*sailStates.r + (-0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end