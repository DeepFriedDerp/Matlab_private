function [aeroForces] = paramSpace_1_1_2_3_1_2_2(sailStates,airStates)

	CL = (3.836168)*sailStates.alpha + (-0.146736)*sailStates.beta + (-2.498755)*sailStates.p + (34.931988)*sailStates.q + (-0.748188)*sailStates.r + (0.010608)*sailStates.de;
	CD = 0.065600;
	CY = (-0.061225)*sailStates.alpha + (-0.023592)*sailStates.beta + (-0.118532)*sailStates.p + (-0.491627)*sailStates.q + (-0.020900)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.233360)*sailStates.alpha + (0.034074)*sailStates.beta + (-1.217123)*sailStates.p + (10.328865)*sailStates.q + (-0.504179)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-13.784887)*sailStates.alpha + (0.533555)*sailStates.beta + (8.409977)*sailStates.p + (-135.234573)*sailStates.q + (2.532996)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.207108)*sailStates.alpha + (0.009683)*sailStates.beta + (0.100050)*sailStates.p + (0.603638)*sailStates.q + (-0.033417)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end