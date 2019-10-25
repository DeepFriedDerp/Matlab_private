function [aeroForces] = paramSpace_3_3_2_2_3_1_3(sailStates,airStates)

	CL = (4.602406)*sailStates.alpha + (0.065870)*sailStates.beta + (-2.950416)*sailStates.p + (36.969135)*sailStates.q + (-0.828487)*sailStates.r + (0.011014)*sailStates.de;
	CD = -0.537260;
	CY = (-0.005440)*sailStates.alpha + (-0.025191)*sailStates.beta + (-0.516858)*sailStates.p + (0.668511)*sailStates.q + (0.033853)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.622107)*sailStates.alpha + (0.248977)*sailStates.beta + (-1.516829)*sailStates.p + (12.300863)*sailStates.q + (-0.849780)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-15.184175)*sailStates.alpha + (-0.270738)*sailStates.beta + (10.413628)*sailStates.p + (-148.601761)*sailStates.q + (2.811714)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (-0.014235)*sailStates.alpha + (-0.014180)*sailStates.beta + (1.222521)*sailStates.p + (-6.325751)*sailStates.q + (-0.017927)*sailStates.r + (-0.000294)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end