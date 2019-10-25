function [aeroForces] = paramSpace_2_1_3_2_3_3_3(sailStates,airStates)

	CL = (4.206195)*sailStates.alpha + (0.141821)*sailStates.beta + (-2.915393)*sailStates.p + (36.788044)*sailStates.q + (0.429012)*sailStates.r + (0.010844)*sailStates.de;
	CD = -0.318210;
	CY = (0.150859)*sailStates.alpha + (-0.025623)*sailStates.beta + (0.268575)*sailStates.p + (0.870359)*sailStates.q + (0.017634)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.412091)*sailStates.alpha + (-0.141630)*sailStates.beta + (-1.563169)*sailStates.p + (13.059486)*sailStates.q + (0.518819)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.443520)*sailStates.alpha + (-0.621377)*sailStates.beta + (10.170302)*sailStates.p + (-146.834122)*sailStates.q + (-1.478119)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (-0.132037)*sailStates.alpha + (-0.012003)*sailStates.beta + (-0.716567)*sailStates.p + (2.924925)*sailStates.q + (-0.006338)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end