function [aeroForces] = paramSpace_1_1_3_2_1_1_2(sailStates,airStates)

	CL = (4.282841)*sailStates.alpha + (-0.323676)*sailStates.beta + (-2.575707)*sailStates.p + (38.041496)*sailStates.q + (-1.687271)*sailStates.r + (0.011347)*sailStates.de;
	CD = -0.359920;
	CY = (-0.100843)*sailStates.alpha + (-0.023105)*sailStates.beta + (-0.527064)*sailStates.p + (-0.759372)*sailStates.q + (-0.093008)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.244650)*sailStates.alpha + (0.193381)*sailStates.beta + (-1.243777)*sailStates.p + (11.160364)*sailStates.q + (-1.363799)*sailStates.r + (0.000490)*sailStates.de;
	Cm = (-12.556166)*sailStates.alpha + (1.157778)*sailStates.beta + (7.907939)*sailStates.p + (-135.573257)*sailStates.q + (5.618810)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.125330)*sailStates.alpha + (0.050290)*sailStates.beta + (1.048902)*sailStates.p + (-3.575186)*sailStates.q + (-0.016937)*sailStates.r + (0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end