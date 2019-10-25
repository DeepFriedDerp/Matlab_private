function [aeroForces] = paramSpace_9_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.454728)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.041886)*sailStates.p + (30.050556)*sailStates.q + (-0.885393)*sailStates.r + (0.010707)*sailStates.de;
	CD = -0.564950;
	CY = (-0.022202)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.426125)*sailStates.p + (-0.910010)*sailStates.q + (0.014913)*sailStates.r + (-0.000195)*sailStates.de;

	Cl = (0.913154)*sailStates.alpha + (0.249901)*sailStates.beta + (-0.786303)*sailStates.p + (5.711106)*sailStates.q + (-0.908242)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.488661)*sailStates.alpha + (0.000000)*sailStates.beta + (7.196702)*sailStates.p + (-123.255226)*sailStates.q + (3.031410)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (-0.499609)*sailStates.alpha + (-0.008727)*sailStates.beta + (1.000425)*sailStates.p + (-3.892826)*sailStates.q + (-0.002357)*sailStates.r + (0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end