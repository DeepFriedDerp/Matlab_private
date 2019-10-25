function [aeroForces] = paramSpace_2_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.532159)*sailStates.alpha + (-0.293626)*sailStates.beta + (-2.573580)*sailStates.p + (35.902306)*sailStates.q + (-1.335764)*sailStates.r + (0.011130)*sailStates.de;
	CD = -0.470270;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.544453)*sailStates.p + (-0.000001)*sailStates.q + (-0.035685)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.457958)*sailStates.alpha + (0.182416)*sailStates.beta + (-1.256084)*sailStates.p + (10.634869)*sailStates.q + (-1.162422)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.042656)*sailStates.alpha + (1.105753)*sailStates.beta + (8.467438)*sailStates.p + (-136.150452)*sailStates.q + (4.517213)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.091559)*sailStates.alpha + (0.018829)*sailStates.beta + (1.157554)*sailStates.p + (-5.049786)*sailStates.q + (0.005060)*sailStates.r + (-0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end