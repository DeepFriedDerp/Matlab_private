function [aeroForces] = paramSpace_6_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.186755)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.343021)*sailStates.p + (32.572655)*sailStates.q + (0.313601)*sailStates.r + (0.010800)*sailStates.de;
	CD = -0.114110;
	CY = (-0.078694)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.240851)*sailStates.p + (-0.466416)*sailStates.q + (0.016858)*sailStates.r + (-0.000100)*sailStates.de;

	Cl = (1.210350)*sailStates.alpha + (-0.101580)*sailStates.beta + (-1.031597)*sailStates.p + (7.987228)*sailStates.q + (0.358103)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-15.010147)*sailStates.alpha + (0.000000)*sailStates.beta + (8.216698)*sailStates.p + (-131.613632)*sailStates.q + (-1.045387)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (0.298440)*sailStates.alpha + (-0.007103)*sailStates.beta + (-0.592528)*sailStates.p + (3.267907)*sailStates.q + (-0.011394)*sailStates.r + (0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end