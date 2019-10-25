function [aeroForces] = paramSpace_1_3_2_2_1_1_2(sailStates,airStates)

	CL = (4.256236)*sailStates.alpha + (0.348930)*sailStates.beta + (-2.574812)*sailStates.p + (38.099129)*sailStates.q + (-1.698897)*sailStates.r + (0.011243)*sailStates.de;
	CD = -0.367940;
	CY = (-0.100837)*sailStates.alpha + (-0.026744)*sailStates.beta + (-0.546420)*sailStates.p + (-0.759371)*sailStates.q + (-0.096349)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.122920)*sailStates.alpha + (0.398169)*sailStates.beta + (-1.158709)*sailStates.p + (10.102128)*sailStates.q + (-1.380270)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-12.312658)*sailStates.alpha + (-1.315571)*sailStates.beta + (7.896339)*sailStates.p + (-135.573257)*sailStates.q + (5.684597)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.034734)*sailStates.alpha + (0.054103)*sailStates.beta + (1.092831)*sailStates.p + (-3.777189)*sailStates.q + (-0.014658)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end