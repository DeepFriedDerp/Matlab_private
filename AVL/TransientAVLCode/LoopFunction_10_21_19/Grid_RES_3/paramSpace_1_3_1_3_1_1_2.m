function [aeroForces] = paramSpace_1_3_1_3_1_1_2(sailStates,airStates)

	CL = (4.009868)*sailStates.alpha + (0.307623)*sailStates.beta + (-2.542516)*sailStates.p + (37.062866)*sailStates.q + (-1.418826)*sailStates.r + (0.010914)*sailStates.de;
	CD = -0.124450;
	CY = (-0.064109)*sailStates.alpha + (-0.026191)*sailStates.beta + (-0.442175)*sailStates.p + (-0.491626)*sailStates.q + (-0.077921)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.129066)*sailStates.alpha + (0.319541)*sailStates.beta + (-1.146198)*sailStates.p + (9.818014)*sailStates.q + (-1.133115)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-12.635536)*sailStates.alpha + (-1.215252)*sailStates.beta + (8.013516)*sailStates.p + (-135.234604)*sailStates.q + (4.781435)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.047063)*sailStates.alpha + (0.043656)*sailStates.beta + (0.834225)*sailStates.p + (-2.702737)*sailStates.q + (-0.017374)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end