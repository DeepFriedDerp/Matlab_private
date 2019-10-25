function [aeroForces] = paramSpace_1_2_3_1_2_1_2(sailStates,airStates)

	CL = (6.543557)*sailStates.alpha + (-0.239879)*sailStates.beta + (-2.650518)*sailStates.p + (43.189888)*sailStates.q + (-3.234101)*sailStates.r + (0.012250)*sailStates.de;
	CD = -2.385640;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-1.246472)*sailStates.p + (-0.000002)*sailStates.q + (-0.247939)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.972755)*sailStates.alpha + (0.552202)*sailStates.beta + (-1.232803)*sailStates.p + (12.198423)*sailStates.q + (-2.757251)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-10.749178)*sailStates.alpha + (0.893065)*sailStates.beta + (6.703820)*sailStates.p + (-134.847153)*sailStates.q + (10.692616)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.105671)*sailStates.alpha + (0.126125)*sailStates.beta + (2.642575)*sailStates.p + (-11.164240)*sailStates.q + (0.025965)*sailStates.r + (-0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end