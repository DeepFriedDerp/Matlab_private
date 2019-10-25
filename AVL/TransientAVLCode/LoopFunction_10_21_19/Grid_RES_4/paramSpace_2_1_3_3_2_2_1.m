function [aeroForces] = paramSpace_2_1_3_3_2_2_1(sailStates,airStates)

	CL = (3.980204)*sailStates.alpha + (-0.053766)*sailStates.beta + (-2.287001)*sailStates.p + (32.586269)*sailStates.q + (-0.292693)*sailStates.r + (0.010767)*sailStates.de;
	CD = 0.028080;
	CY = (-0.001935)*sailStates.alpha + (-0.024723)*sailStates.beta + (-0.057085)*sailStates.p + (-0.065300)*sailStates.q + (-0.003744)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.179664)*sailStates.alpha + (0.012327)*sailStates.beta + (-1.035165)*sailStates.p + (8.343330)*sailStates.q + (-0.190466)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.445189)*sailStates.alpha + (0.167104)*sailStates.beta + (7.822798)*sailStates.p + (-129.003830)*sailStates.q + (0.983570)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.022324)*sailStates.alpha + (0.001685)*sailStates.beta + (0.079171)*sailStates.p + (-0.167677)*sailStates.q + (-0.002876)*sailStates.r + (0.000008)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end