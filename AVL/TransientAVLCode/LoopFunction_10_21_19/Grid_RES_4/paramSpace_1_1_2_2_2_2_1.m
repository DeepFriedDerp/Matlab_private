function [aeroForces] = paramSpace_1_1_2_2_2_2_1(sailStates,airStates)

	CL = (3.746505)*sailStates.alpha + (-0.192970)*sailStates.beta + (-2.073542)*sailStates.p + (31.734884)*sailStates.q + (-0.826905)*sailStates.r + (0.010249)*sailStates.de;
	CD = 0.066630;
	CY = (-0.006723)*sailStates.alpha + (-0.023797)*sailStates.beta + (-0.179285)*sailStates.p + (-0.301044)*sailStates.q + (-0.035651)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.039128)*sailStates.alpha + (0.050173)*sailStates.beta + (-0.883236)*sailStates.p + (7.363680)*sailStates.q + (-0.565461)*sailStates.r + (-0.000051)*sailStates.de;
	Cm = (-13.231192)*sailStates.alpha + (0.728505)*sailStates.beta + (6.853695)*sailStates.p + (-122.964470)*sailStates.q + (2.792924)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (0.011786)*sailStates.alpha + (0.017128)*sailStates.beta + (0.270898)*sailStates.p + (-0.484277)*sailStates.q + (-0.023689)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end