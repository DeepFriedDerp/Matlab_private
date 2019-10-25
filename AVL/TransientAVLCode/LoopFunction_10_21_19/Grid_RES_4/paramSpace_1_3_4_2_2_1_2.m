function [aeroForces] = paramSpace_1_3_4_2_2_1_2(sailStates,airStates)

	CL = (4.558084)*sailStates.alpha + (0.137449)*sailStates.beta + (-2.558473)*sailStates.p + (38.811478)*sailStates.q + (-1.996139)*sailStates.r + (0.011481)*sailStates.de;
	CD = -0.481490;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.668674)*sailStates.p + (-0.000001)*sailStates.q + (-0.133008)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.374820)*sailStates.alpha + (0.377068)*sailStates.beta + (-1.172265)*sailStates.p + (10.656079)*sailStates.q + (-1.587435)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.611464)*sailStates.alpha + (-0.484297)*sailStates.beta + (7.517341)*sailStates.p + (-134.847153)*sailStates.q + (6.602770)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.049182)*sailStates.alpha + (0.065930)*sailStates.beta + (1.345339)*sailStates.p + (-5.485002)*sailStates.q + (-0.002023)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end