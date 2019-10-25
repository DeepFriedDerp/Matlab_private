function [aeroForces] = paramSpace_4_1_2_1_2_1_3(sailStates,airStates)

	CL = (5.359513)*sailStates.alpha + (-0.281480)*sailStates.beta + (-3.143960)*sailStates.p + (34.321594)*sailStates.q + (-0.935038)*sailStates.r + (0.009386)*sailStates.de;
	CD = -1.930300;
	CY = (-0.341791)*sailStates.alpha + (-0.026825)*sailStates.beta + (-0.714086)*sailStates.p + (-0.662186)*sailStates.q + (0.142064)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.808653)*sailStates.alpha + (0.329882)*sailStates.beta + (-1.847419)*sailStates.p + (15.067066)*sailStates.q + (-1.138295)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-14.930727)*sailStates.alpha + (1.171246)*sailStates.beta + (12.339671)*sailStates.p + (-157.701111)*sailStates.q + (3.002655)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.663967)*sailStates.alpha + (-0.090327)*sailStates.beta + (1.981994)*sailStates.p + (-9.802904)*sailStates.q + (-0.094832)*sailStates.r + (0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end