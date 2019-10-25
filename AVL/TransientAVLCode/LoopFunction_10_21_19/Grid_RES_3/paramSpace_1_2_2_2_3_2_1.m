function [aeroForces] = paramSpace_1_2_2_2_3_2_1(sailStates,airStates)

	CL = (3.957998)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.091809)*sailStates.p + (32.061352)*sailStates.q + (-0.936826)*sailStates.r + (0.010563)*sailStates.de;
	CD = 0.025540;
	CY = (0.110557)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.276725)*sailStates.p + (0.491415)*sailStates.q + (-0.048794)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.063801)*sailStates.alpha + (0.118760)*sailStates.beta + (-0.841728)*sailStates.p + (6.863775)*sailStates.q + (-0.650836)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-13.771805)*sailStates.alpha + (0.000000)*sailStates.beta + (6.812315)*sailStates.p + (-123.667763)*sailStates.q + (3.137470)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.211003)*sailStates.alpha + (0.020941)*sailStates.beta + (0.495462)*sailStates.p + (-2.260987)*sailStates.q + (-0.001226)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end