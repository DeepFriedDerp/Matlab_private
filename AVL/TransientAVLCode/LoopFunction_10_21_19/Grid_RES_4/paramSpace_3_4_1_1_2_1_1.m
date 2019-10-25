function [aeroForces] = paramSpace_3_4_1_1_2_1_1(sailStates,airStates)

	CL = (5.911256)*sailStates.alpha + (0.496217)*sailStates.beta + (-1.604681)*sailStates.p + (24.851559)*sailStates.q + (-2.018039)*sailStates.r + (0.010003)*sailStates.de;
	CD = -2.265890;
	CY = (0.405272)*sailStates.alpha + (-0.024953)*sailStates.beta + (-1.032774)*sailStates.p + (0.221993)*sailStates.q + (0.067668)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.044363)*sailStates.alpha + (0.637333)*sailStates.beta + (-0.409083)*sailStates.p + (1.698196)*sailStates.q + (-1.984553)*sailStates.r + (-0.000928)*sailStates.de;
	Cm = (-14.805825)*sailStates.alpha + (-2.036664)*sailStates.beta + (6.234312)*sailStates.p + (-111.854546)*sailStates.q + (6.861122)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-2.102177)*sailStates.alpha + (-0.029610)*sailStates.beta + (2.312055)*sailStates.p + (-10.518373)*sailStates.q + (-0.020038)*sailStates.r + (-0.000217)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end