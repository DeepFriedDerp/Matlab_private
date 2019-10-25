function [aeroForces] = paramSpace_1_3_4_3_1_1_2(sailStates,airStates)

	CL = (4.103609)*sailStates.alpha + (0.103643)*sailStates.beta + (-2.545637)*sailStates.p + (37.457775)*sailStates.q + (-1.509356)*sailStates.r + (0.011231)*sailStates.de;
	CD = -0.127760;
	CY = (-0.064744)*sailStates.alpha + (-0.025446)*sailStates.beta + (-0.425217)*sailStates.p + (-0.489620)*sailStates.q + (-0.084633)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.175850)*sailStates.alpha + (0.264290)*sailStates.beta + (-1.172629)*sailStates.p + (10.294452)*sailStates.q + (-1.149334)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-13.008582)*sailStates.alpha + (-0.357914)*sailStates.beta + (7.921415)*sailStates.p + (-135.545776)*sailStates.q + (5.009493)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.083905)*sailStates.alpha + (0.046782)*sailStates.beta + (0.804305)*sailStates.p + (-2.681229)*sailStates.q + (-0.022420)*sailStates.r + (0.000053)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end