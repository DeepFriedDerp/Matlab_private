function [aeroForces] = paramSpace_1_2_2_2_3_2_3(sailStates,airStates)

	CL = (3.963593)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.873564)*sailStates.p + (38.646030)*sailStates.q + (-1.215007)*sailStates.r + (0.010944)*sailStates.de;
	CD = 0.033250;
	CY = (0.071511)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.362235)*sailStates.p + (1.027328)*sailStates.q + (-0.063872)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.436568)*sailStates.alpha + (0.140138)*sailStates.beta + (-1.482699)*sailStates.p + (12.982841)*sailStates.q + (-0.878428)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-13.812146)*sailStates.alpha + (0.000000)*sailStates.beta + (9.357505)*sailStates.p + (-145.469635)*sailStates.q + (4.063844)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.190517)*sailStates.alpha + (0.024710)*sailStates.beta + (0.560145)*sailStates.p + (-2.401945)*sailStates.q + (-0.010023)*sailStates.r + (-0.000344)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end