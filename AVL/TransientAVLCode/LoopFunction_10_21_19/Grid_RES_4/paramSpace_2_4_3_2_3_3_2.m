function [aeroForces] = paramSpace_2_4_3_2_3_3_2(sailStates,airStates)

	CL = (4.275723)*sailStates.alpha + (-0.148972)*sailStates.beta + (-2.513172)*sailStates.p + (33.529472)*sailStates.q + (0.481485)*sailStates.r + (0.010646)*sailStates.de;
	CD = -0.322630;
	CY = (0.093622)*sailStates.alpha + (-0.024046)*sailStates.beta + (0.284838)*sailStates.p + (0.769435)*sailStates.q + (0.018696)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.140395)*sailStates.alpha + (-0.204292)*sailStates.beta + (-1.136906)*sailStates.p + (8.802055)*sailStates.q + (0.568112)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.731220)*sailStates.alpha + (0.645386)*sailStates.beta + (8.827488)*sailStates.p + (-135.788696)*sailStates.q + (-1.652898)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.117610)*sailStates.alpha + (-0.010429)*sailStates.beta + (-0.722014)*sailStates.p + (2.872656)*sailStates.q + (-0.005290)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end