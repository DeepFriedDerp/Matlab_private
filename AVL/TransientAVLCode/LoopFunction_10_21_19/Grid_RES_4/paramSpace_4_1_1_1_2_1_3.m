function [aeroForces] = paramSpace_4_1_1_1_2_1_3(sailStates,airStates)

	CL = (5.419678)*sailStates.alpha + (-0.302054)*sailStates.beta + (-3.144892)*sailStates.p + (34.272614)*sailStates.q + (-0.944713)*sailStates.r + (0.009476)*sailStates.de;
	CD = -1.963500;
	CY = (-0.347330)*sailStates.alpha + (-0.026687)*sailStates.beta + (-0.728660)*sailStates.p + (-0.662189)*sailStates.q + (0.145011)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.812623)*sailStates.alpha + (0.335242)*sailStates.beta + (-1.847873)*sailStates.p + (15.064897)*sailStates.q + (-1.162483)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-15.129005)*sailStates.alpha + (1.305222)*sailStates.beta + (12.351004)*sailStates.p + (-157.701111)*sailStates.q + (3.059621)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.682252)*sailStates.alpha + (-0.091543)*sailStates.beta + (2.003916)*sailStates.p + (-9.813805)*sailStates.q + (-0.094769)*sailStates.r + (0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end