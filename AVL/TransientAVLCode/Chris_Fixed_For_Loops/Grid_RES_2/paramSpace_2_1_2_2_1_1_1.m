function [aeroForces] = paramSpace_2_1_2_2_1_1_1(sailStates,airStates)

	CL = (5.397162)*sailStates.alpha + (-2.931250)*sailStates.beta + (-6.612750)*sailStates.p + (77.434998)*sailStates.q + (6.002486)*sailStates.r + (0.014583)*sailStates.de;
	CD = -9.857740;
	CY = (4.119527)*sailStates.alpha + (-0.027473)*sailStates.beta + (2.450836)*sailStates.p + (0.465952)*sailStates.q + (-0.322428)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (-2.128103)*sailStates.alpha + (-2.093902)*sailStates.beta + (-4.330988)*sailStates.p + (41.110886)*sailStates.q + (5.471012)*sailStates.r + (0.005488)*sailStates.de;
	Cm = (15.263206)*sailStates.alpha + (12.014101)*sailStates.beta + (19.353815)*sailStates.p + (-241.234497)*sailStates.q + (-20.428139)*sailStates.r + (-0.079666)*sailStates.de;
	Cn = (-15.769953)*sailStates.alpha + (0.160533)*sailStates.beta + (-4.925264)*sailStates.p + (18.895882)*sailStates.q + (-0.005168)*sailStates.r + (0.000381)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end