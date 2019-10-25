function [aeroForces] = paramSpace_1_2_1_2_1_1_1(sailStates,airStates)

	CL = (4.238171)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.200119)*sailStates.p + (35.102703)*sailStates.q + (-1.576478)*sailStates.r + (0.011099)*sailStates.de;
	CD = -0.360830;
	CY = (-0.046532)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.524357)*sailStates.p + (-1.027327)*sailStates.q + (-0.092361)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.981158)*sailStates.alpha + (0.303150)*sailStates.beta + (-0.888116)*sailStates.p + (7.642568)*sailStates.q + (-1.309039)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-12.069301)*sailStates.alpha + (0.000000)*sailStates.beta + (6.669207)*sailStates.p + (-125.588745)*sailStates.q + (5.302526)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (-0.308813)*sailStates.alpha + (0.053454)*sailStates.beta + (1.083941)*sailStates.p + (-3.632463)*sailStates.q + (-0.012474)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end