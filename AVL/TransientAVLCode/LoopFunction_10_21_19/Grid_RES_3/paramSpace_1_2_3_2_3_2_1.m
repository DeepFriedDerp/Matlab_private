function [aeroForces] = paramSpace_1_2_3_2_3_2_1(sailStates,airStates)

	CL = (3.998310)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.092532)*sailStates.p + (32.003803)*sailStates.q + (-0.926205)*sailStates.r + (0.010667)*sailStates.de;
	CD = 0.017730;
	CY = (0.107245)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.257424)*sailStates.p + (0.491415)*sailStates.q + (-0.045344)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.058967)*sailStates.alpha + (0.109105)*sailStates.beta + (-0.842109)*sailStates.p + (6.861097)*sailStates.q + (-0.619786)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-14.007592)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.822921)*sailStates.p + (-123.667763)*sailStates.q + (3.077314)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.203011)*sailStates.alpha + (0.019238)*sailStates.beta + (0.466552)*sailStates.p + (-2.245801)*sailStates.q + (-0.001134)*sailStates.r + (-0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end