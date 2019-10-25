function [aeroForces] = paramSpace_1_3_1_2_3_1_2(sailStates,airStates)

	CL = (4.769845)*sailStates.alpha + (0.421972)*sailStates.beta + (-2.533918)*sailStates.p + (38.379349)*sailStates.q + (-2.100854)*sailStates.r + (0.011132)*sailStates.de;
	CD = -0.634470;
	CY = (0.104394)*sailStates.alpha + (-0.022730)*sailStates.beta + (-0.808055)*sailStates.p + (0.759372)*sailStates.q + (-0.142554)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.587261)*sailStates.alpha + (0.491250)*sailStates.beta + (-1.133379)*sailStates.p + (10.175205)*sailStates.q + (-1.731740)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-12.641403)*sailStates.alpha + (-1.633601)*sailStates.beta + (7.421989)*sailStates.p + (-133.652283)*sailStates.q + (7.021307)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.227782)*sailStates.alpha + (0.060823)*sailStates.beta + (1.629827)*sailStates.p + (-7.236890)*sailStates.q + (0.017124)*sailStates.r + (-0.000331)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end