function [aeroForces] = paramSpace_1_2_3_3_3_2_2(sailStates,airStates)

	CL = (4.025103)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.490607)*sailStates.p + (35.256466)*sailStates.q + (-0.995579)*sailStates.r + (0.010853)*sailStates.de;
	CD = 0.034160;
	CY = (0.063132)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.257313)*sailStates.p + (0.491627)*sailStates.q + (-0.045324)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.265655)*sailStates.alpha + (0.109042)*sailStates.beta + (-1.167035)*sailStates.p + (9.908234)*sailStates.q + (-0.676639)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-14.210402)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.178063)*sailStates.p + (-134.907364)*sailStates.q + (3.310958)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.019630)*sailStates.alpha + (0.019227)*sailStates.beta + (0.409114)*sailStates.p + (-1.709121)*sailStates.q + (-0.011189)*sailStates.r + (-0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end