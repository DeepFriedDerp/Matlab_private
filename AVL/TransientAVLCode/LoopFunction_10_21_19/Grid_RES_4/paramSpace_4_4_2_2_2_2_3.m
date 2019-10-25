function [aeroForces] = paramSpace_4_4_2_2_2_2_3(sailStates,airStates)

	CL = (3.753466)*sailStates.alpha + (-0.215292)*sailStates.beta + (-2.849120)*sailStates.p + (38.291920)*sailStates.q + (1.130262)*sailStates.r + (0.010713)*sailStates.de;
	CD = 0.070690;
	CY = (0.006706)*sailStates.alpha + (-0.023859)*sailStates.beta + (0.260607)*sailStates.p + (-0.301044)*sailStates.q + (-0.051827)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.239543)*sailStates.alpha + (-0.192895)*sailStates.beta + (-1.425260)*sailStates.p + (12.299167)*sailStates.q + (0.778609)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-13.317308)*sailStates.alpha + (0.740875)*sailStates.beta + (9.365702)*sailStates.p + (-144.677322)*sailStates.q + (-3.780923)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.245831)*sailStates.alpha + (0.026623)*sailStates.beta + (-0.341166)*sailStates.p + (0.867177)*sailStates.q + (-0.030672)*sailStates.r + (0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end