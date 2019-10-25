function [aeroForces] = paramSpace_1_1_1_2_3_1_2(sailStates,airStates)

	CL = (4.769845)*sailStates.alpha + (-0.421972)*sailStates.beta + (-2.533918)*sailStates.p + (38.379349)*sailStates.q + (-2.100854)*sailStates.r + (0.011132)*sailStates.de;
	CD = -0.634470;
	CY = (0.104394)*sailStates.alpha + (-0.026932)*sailStates.beta + (-0.808055)*sailStates.p + (0.759372)*sailStates.q + (-0.142554)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.702501)*sailStates.alpha + (0.248245)*sailStates.beta + (-1.217997)*sailStates.p + (11.236077)*sailStates.q + (-1.746761)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-12.641403)*sailStates.alpha + (1.633601)*sailStates.beta + (7.421989)*sailStates.p + (-133.652283)*sailStates.q + (7.021307)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.117986)*sailStates.alpha + (0.069570)*sailStates.beta + (1.614907)*sailStates.p + (-7.049829)*sailStates.q + (0.014476)*sailStates.r + (-0.000331)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end