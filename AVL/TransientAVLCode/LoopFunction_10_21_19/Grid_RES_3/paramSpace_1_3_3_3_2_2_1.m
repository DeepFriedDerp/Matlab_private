function [aeroForces] = paramSpace_1_3_3_3_2_2_1(sailStates,airStates)

	CL = (3.894966)*sailStates.alpha + (0.126611)*sailStates.beta + (-2.233658)*sailStates.p + (32.816509)*sailStates.q + (-0.773745)*sailStates.r + (0.010588)*sailStates.de;
	CD = 0.046560;
	CY = (-0.005112)*sailStates.alpha + (-0.025225)*sailStates.beta + (-0.150069)*sailStates.p + (-0.173375)*sailStates.q + (-0.026478)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.000298)*sailStates.alpha + (0.122525)*sailStates.beta + (-0.917442)*sailStates.p + (7.308554)*sailStates.q + (-0.488331)*sailStates.r + (-0.000113)*sailStates.de;
	Cm = (-13.948454)*sailStates.alpha + (-0.391604)*sailStates.beta + (7.447662)*sailStates.p + (-127.559647)*sailStates.q + (2.583013)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (0.009160)*sailStates.alpha + (0.016019)*sailStates.beta + (0.229668)*sailStates.p + (-0.637875)*sailStates.q + (-0.017288)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end