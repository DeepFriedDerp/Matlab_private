function [aeroForces] = paramSpace_1_2_4_2_2_1_2(sailStates,airStates)

	CL = (4.558084)*sailStates.alpha + (-0.137449)*sailStates.beta + (-2.558473)*sailStates.p + (38.811478)*sailStates.q + (-1.996139)*sailStates.r + (0.011481)*sailStates.de;
	CD = -0.481490;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.668674)*sailStates.p + (-0.000001)*sailStates.q + (-0.133008)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.417819)*sailStates.alpha + (0.290588)*sailStates.beta + (-1.203814)*sailStates.p + (11.053047)*sailStates.q + (-1.593668)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-12.611464)*sailStates.alpha + (0.484297)*sailStates.beta + (7.517341)*sailStates.p + (-134.847153)*sailStates.q + (6.602769)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.010307)*sailStates.alpha + (0.066875)*sailStates.beta + (1.339064)*sailStates.p + (-5.406040)*sailStates.q + (-0.003263)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end