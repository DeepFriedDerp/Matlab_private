function [aeroForces] = paramSpace_1_2_3_2_3_2_3(sailStates,airStates)

	CL = (4.004136)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.874554)*sailStates.p + (38.587685)*sailStates.q + (-1.202736)*sailStates.r + (0.011051)*sailStates.de;
	CD = 0.025400;
	CY = (0.074857)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.342662)*sailStates.p + (1.027329)*sailStates.q + (-0.060323)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.433394)*sailStates.alpha + (0.130343)*sailStates.beta + (-1.483171)*sailStates.p + (12.980206)*sailStates.q + (-0.846439)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-14.047102)*sailStates.alpha + (0.000000)*sailStates.beta + (9.369935)*sailStates.p + (-145.469635)*sailStates.q + (3.993354)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.178368)*sailStates.alpha + (0.022983)*sailStates.beta + (0.530815)*sailStates.p + (-2.387003)*sailStates.q + (-0.009921)*sailStates.r + (-0.000361)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end