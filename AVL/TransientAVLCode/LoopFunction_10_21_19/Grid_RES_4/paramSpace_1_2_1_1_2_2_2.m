function [aeroForces] = paramSpace_1_2_1_1_2_2_2(sailStates,airStates)

	CL = (3.808124)*sailStates.alpha + (-0.079031)*sailStates.beta + (-2.479105)*sailStates.p + (35.355015)*sailStates.q + (-0.999031)*sailStates.r + (0.010503)*sailStates.de;
	CD = 0.093210;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.243379)*sailStates.p + (-0.000000)*sailStates.q + (-0.048411)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.224121)*sailStates.alpha + (0.099717)*sailStates.beta + (-1.178333)*sailStates.p + (10.108635)*sailStates.q + (-0.715699)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-13.386967)*sailStates.alpha + (0.314075)*sailStates.beta + (8.156919)*sailStates.p + (-134.847153)*sailStates.q + (3.387394)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.128885)*sailStates.alpha + (0.023053)*sailStates.beta + (0.338067)*sailStates.p + (-0.658162)*sailStates.q + (-0.028765)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end