function [aeroForces] = paramSpace_2_4_1_2_1_3_3(sailStates,airStates)

	CL = (4.479047)*sailStates.alpha + (-0.154601)*sailStates.beta + (-2.930322)*sailStates.p + (36.736202)*sailStates.q + (0.812438)*sailStates.r + (0.010786)*sailStates.de;
	CD = -0.495440;
	CY = (0.001169)*sailStates.alpha + (-0.025711)*sailStates.beta + (0.487431)*sailStates.p + (-0.668510)*sailStates.q + (0.032018)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.546785)*sailStates.alpha + (-0.266512)*sailStates.beta + (-1.474848)*sailStates.p + (11.825542)*sailStates.q + (0.805347)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-14.813126)*sailStates.alpha + (0.536757)*sailStates.beta + (10.339850)*sailStates.p + (-147.557632)*sailStates.q + (-2.711473)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (0.043567)*sailStates.alpha + (-0.010485)*sailStates.beta + (-1.176831)*sailStates.p + (6.278315)*sailStates.q + (-0.018351)*sailStates.r + (0.000317)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end