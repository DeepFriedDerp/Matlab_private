function [aeroForces] = paramSpace_3_4_2_3_2_3_3(sailStates,airStates)

	CL = (4.202519)*sailStates.alpha + (-0.215122)*sailStates.beta + (-2.824520)*sailStates.p + (37.583893)*sailStates.q + (1.013094)*sailStates.r + (0.011173)*sailStates.de;
	CD = -0.186740;
	CY = (0.033506)*sailStates.alpha + (-0.024723)*sailStates.beta + (0.386459)*sailStates.p + (-0.065298)*sailStates.q + (-0.025328)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.327614)*sailStates.alpha + (-0.255056)*sailStates.beta + (-1.368030)*sailStates.p + (11.286321)*sailStates.q + (0.850168)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-14.090742)*sailStates.alpha + (0.795061)*sailStates.beta + (9.415495)*sailStates.p + (-143.297119)*sailStates.q + (-3.421480)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.069488)*sailStates.alpha + (0.011752)*sailStates.beta + (-0.793237)*sailStates.p + (3.427265)*sailStates.q + (0.002119)*sailStates.r + (0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end