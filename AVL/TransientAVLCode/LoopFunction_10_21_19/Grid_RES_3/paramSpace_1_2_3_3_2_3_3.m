function [aeroForces] = paramSpace_1_2_3_3_2_3_3(sailStates,airStates)

	CL = (4.030632)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.711947)*sailStates.p + (35.241074)*sailStates.q + (-0.299364)*sailStates.r + (0.010569)*sailStates.de;
	CD = -0.094070;
	CY = (0.031934)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.097868)*sailStates.p + (0.173374)*sailStates.q + (0.017273)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.319423)*sailStates.alpha + (-0.055851)*sailStates.beta + (-1.368385)*sailStates.p + (11.317654)*sailStates.q + (-0.033621)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-14.820837)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.536839)*sailStates.p + (-142.582367)*sailStates.q + (1.012504)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.169531)*sailStates.alpha + (-0.009848)*sailStates.beta + (-0.424749)*sailStates.p + (2.464645)*sailStates.q + (-0.038563)*sailStates.r + (-0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end