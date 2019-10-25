function [aeroForces] = paramSpace_2_1_4_2_2_1_3(sailStates,airStates)

	CL = (4.449702)*sailStates.alpha + (-0.278900)*sailStates.beta + (-2.976087)*sailStates.p + (39.144306)*sailStates.q + (-1.378842)*sailStates.r + (0.011362)*sailStates.de;
	CD = -0.457740;
	CY = (-0.078264)*sailStates.alpha + (-0.024862)*sailStates.beta + (-0.545751)*sailStates.p + (0.100923)*sailStates.q + (-0.035760)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.571257)*sailStates.alpha + (0.175632)*sailStates.beta + (-1.584785)*sailStates.p + (13.682998)*sailStates.q + (-1.181156)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-13.868103)*sailStates.alpha + (0.992400)*sailStates.beta + (9.813801)*sailStates.p + (-147.195892)*sailStates.q + (4.637794)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.284592)*sailStates.alpha + (0.018449)*sailStates.beta + (1.147311)*sailStates.p + (-5.065331)*sailStates.q + (0.004333)*sailStates.r + (-0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end