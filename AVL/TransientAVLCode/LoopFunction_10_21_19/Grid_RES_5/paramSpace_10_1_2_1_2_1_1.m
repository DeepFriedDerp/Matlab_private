function [aeroForces] = paramSpace_10_1_2_1_2_1_1(sailStates,airStates)

	CL = (5.006277)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.032540)*sailStates.p + (29.170311)*sailStates.q + (-1.256177)*sailStates.r + (0.010509)*sailStates.de;
	CD = -0.910800;
	CY = (0.283825)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.712006)*sailStates.p + (1.113125)*sailStates.q + (0.049749)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (1.402714)*sailStates.alpha + (0.311024)*sailStates.beta + (-0.787064)*sailStates.p + (5.478876)*sailStates.q + (-1.233409)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-15.744100)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.478037)*sailStates.p + (-123.764404)*sailStates.q + (4.248885)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-1.050720)*sailStates.alpha + (-0.021749)*sailStates.beta + (1.602306)*sailStates.p + (-8.163481)*sailStates.q + (-0.021940)*sailStates.r + (-0.000438)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end