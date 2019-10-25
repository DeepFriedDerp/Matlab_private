function [aeroForces] = paramSpace_11_1_4_2_2_2_1(sailStates,airStates)

	CL = (4.102512)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.367835)*sailStates.p + (34.355640)*sailStates.q + (0.932624)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.079240;
	CY = (0.034732)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.316106)*sailStates.p + (0.493722)*sailStates.q + (-0.033172)*sailStates.r + (0.000106)*sailStates.de;

	Cl = (1.132725)*sailStates.alpha + (-0.177939)*sailStates.beta + (-1.037410)*sailStates.p + (8.457185)*sailStates.q + (0.780292)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-13.859017)*sailStates.alpha + (0.000000)*sailStates.beta + (7.821337)*sailStates.p + (-131.315216)*sailStates.q + (-3.186586)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (0.076973)*sailStates.alpha + (0.018702)*sailStates.beta + (-0.619705)*sailStates.p + (2.026131)*sailStates.q + (-0.005789)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end