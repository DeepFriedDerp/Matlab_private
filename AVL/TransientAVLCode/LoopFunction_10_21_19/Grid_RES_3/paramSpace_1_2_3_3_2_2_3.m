function [aeroForces] = paramSpace_1_2_3_3_2_2_3(sailStates,airStates)

	CL = (3.929853)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.756573)*sailStates.p + (37.314339)*sailStates.q + (-0.958544)*sailStates.r + (0.010983)*sailStates.de;
	CD = 0.055070;
	CY = (-0.000808)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.206429)*sailStates.p + (0.173374)*sailStates.q + (-0.036383)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.307818)*sailStates.alpha + (0.096297)*sailStates.beta + (-1.382497)*sailStates.p + (11.865038)*sailStates.q + (-0.646268)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-14.066466)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.151952)*sailStates.p + (-142.582367)*sailStates.q + (3.195314)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.188971)*sailStates.alpha + (0.016980)*sailStates.beta + (0.265438)*sailStates.p + (-0.639723)*sailStates.q + (-0.024426)*sailStates.r + (-0.000093)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end