function [aeroForces] = paramSpace_1_2_3_2_3_1_3(sailStates,airStates)

	CL = (4.820210)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.943572)*sailStates.p + (41.794090)*sailStates.q + (-2.222188)*sailStates.r + (0.011692)*sailStates.de;
	CD = -0.635210;
	CY = (0.003490)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.813271)*sailStates.p + (1.027328)*sailStates.q + (-0.143304)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.786450)*sailStates.alpha + (0.365647)*sailStates.beta + (-1.504996)*sailStates.p + (13.826760)*sailStates.q + (-1.793925)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-13.195903)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.774687)*sailStates.p + (-145.469635)*sailStates.q + (7.369173)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.362599)*sailStates.alpha + (0.064473)*sailStates.beta + (1.598222)*sailStates.p + (-7.188054)*sailStates.q + (0.011943)*sailStates.r + (-0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end