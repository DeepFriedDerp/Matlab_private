function [aeroForces] = paramSpace_3_1_1_2_2_3_2(sailStates,airStates)

	CL = (4.525995)*sailStates.alpha + (0.271940)*sailStates.beta + (-2.573828)*sailStates.p + (35.885845)*sailStates.q + (1.327006)*sailStates.r + (0.011160)*sailStates.de;
	CD = -0.454560;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.529595)*sailStates.p + (0.000000)*sailStates.q + (-0.034712)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.457681)*sailStates.alpha + (-0.175855)*sailStates.beta + (-1.256208)*sailStates.p + (10.634115)*sailStates.q + (1.138581)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.110495)*sailStates.alpha + (-0.969489)*sailStates.beta + (8.470729)*sailStates.p + (-136.150452)*sailStates.q + (-4.466995)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.093877)*sailStates.alpha + (0.018260)*sailStates.beta + (-1.135620)*sailStates.p + (5.038293)*sailStates.q + (0.004967)*sailStates.r + (0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end