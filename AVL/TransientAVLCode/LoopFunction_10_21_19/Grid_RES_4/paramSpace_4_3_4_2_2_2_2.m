function [aeroForces] = paramSpace_4_3_4_2_2_2_2(sailStates,airStates)

	CL = (3.808124)*sailStates.alpha + (-0.079031)*sailStates.beta + (-2.479105)*sailStates.p + (35.355015)*sailStates.q + (0.999031)*sailStates.r + (0.010503)*sailStates.de;
	CD = 0.093210;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.243379)*sailStates.p + (0.000000)*sailStates.q + (-0.048411)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.177809)*sailStates.alpha + (-0.142967)*sailStates.beta + (-1.146800)*sailStates.p + (9.711667)*sailStates.q + (0.709385)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-13.386967)*sailStates.alpha + (0.314075)*sailStates.beta + (8.156919)*sailStates.p + (-134.847153)*sailStates.q + (-3.387395)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.108636)*sailStates.alpha + (0.025220)*sailStates.beta + (-0.344339)*sailStates.p + (0.737124)*sailStates.q + (-0.027509)*sailStates.r + (0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end