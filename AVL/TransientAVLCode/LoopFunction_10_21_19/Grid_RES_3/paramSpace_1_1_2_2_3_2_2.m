function [aeroForces] = paramSpace_1_1_2_2_3_2_2(sailStates,airStates)

	CL = (3.972993)*sailStates.alpha + (-0.186512)*sailStates.beta + (-2.465764)*sailStates.p + (35.115395)*sailStates.q + (-1.069962)*sailStates.r + (0.010602)*sailStates.de;
	CD = 0.028470;
	CY = (0.097493)*sailStates.alpha + (-0.026744)*sailStates.beta + (-0.318139)*sailStates.p + (0.759372)*sailStates.q + (-0.056097)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.349845)*sailStates.alpha + (0.064969)*sailStates.beta + (-1.196589)*sailStates.p + (10.386885)*sailStates.q + (-0.768006)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-13.815580)*sailStates.alpha + (0.665729)*sailStates.beta + (8.028677)*sailStates.p + (-133.652283)*sailStates.q + (3.580610)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (0.000856)*sailStates.alpha + (0.022774)*sailStates.beta + (0.518490)*sailStates.p + (-2.233817)*sailStates.q + (-0.006793)*sailStates.r + (-0.000256)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end