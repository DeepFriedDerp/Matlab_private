function [aeroForces] = paramSpace_1_1_3_2_2_2_2(sailStates,airStates)

	CL = (3.793349)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.567540)*sailStates.p + (34.952011)*sailStates.q + (-0.868013)*sailStates.r + (0.010097)*sailStates.de;
	CD = 0.035040;
	CY = (0.063771)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.112213)*sailStates.p + (0.596614)*sailStates.q + (-0.027956)*sailStates.r + (0.000126)*sailStates.de;

	Cl = (1.246744)*sailStates.alpha + (0.032656)*sailStates.beta + (-1.278364)*sailStates.p + (11.020429)*sailStates.q + (-0.486053)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-13.983634)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.739240)*sailStates.p + (-138.535995)*sailStates.q + (2.931273)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (0.191283)*sailStates.alpha + (0.008142)*sailStates.beta + (-0.031608)*sailStates.p + (0.721606)*sailStates.q + (-0.049677)*sailStates.r + (-0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end