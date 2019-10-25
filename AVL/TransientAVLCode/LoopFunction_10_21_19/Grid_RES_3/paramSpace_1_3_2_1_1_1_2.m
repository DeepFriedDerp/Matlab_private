function [aeroForces] = paramSpace_1_3_2_1_1_1_2(sailStates,airStates)

	CL = (5.500315)*sailStates.alpha + (0.573192)*sailStates.beta + (-2.681793)*sailStates.p + (41.819317)*sailStates.q + (-2.689796)*sailStates.r + (0.012011)*sailStates.de;
	CD = -1.843790;
	CY = (-0.235489)*sailStates.alpha + (-0.029042)*sailStates.beta + (-0.966551)*sailStates.p + (-1.671349)*sailStates.q + (-0.170429)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.052275)*sailStates.alpha + (0.700394)*sailStates.beta + (-1.199912)*sailStates.p + (11.077345)*sailStates.q + (-2.326756)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-9.967527)*sailStates.alpha + (-2.193155)*sailStates.beta + (7.458854)*sailStates.p + (-136.726761)*sailStates.q + (8.978422)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.031144)*sailStates.alpha + (0.096059)*sailStates.beta + (2.070756)*sailStates.p + (-7.479268)*sailStates.q + (-0.007833)*sailStates.r + (0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end