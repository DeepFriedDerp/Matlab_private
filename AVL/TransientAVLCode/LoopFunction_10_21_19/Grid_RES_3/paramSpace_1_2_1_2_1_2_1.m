function [aeroForces] = paramSpace_1_2_1_2_1_2_1(sailStates,airStates)

	CL = (3.791196)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.131145)*sailStates.p + (31.896303)*sailStates.q + (-0.556777)*sailStates.r + (0.010464)*sailStates.de;
	CD = 0.078240;
	CY = (-0.117898)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.053748)*sailStates.p + (-1.027328)*sailStates.q + (-0.009380)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.961474)*sailStates.alpha + (0.067846)*sailStates.beta + (-0.866289)*sailStates.p + (6.796013)*sailStates.q + (-0.361566)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-13.679541)*sailStates.alpha + (0.000000)*sailStates.beta + (7.264455)*sailStates.p + (-125.588745)*sailStates.q + (1.926707)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.176562)*sailStates.alpha + (0.011963)*sailStates.beta + (0.016521)*sailStates.p + (1.168589)*sailStates.q + (-0.034262)*sailStates.r + (0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end