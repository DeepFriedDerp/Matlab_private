function [aeroForces] = paramSpace_1_2_2_1_1_2_1(sailStates,airStates)

	CL = (4.839325)*sailStates.alpha + (-0.157380)*sailStates.beta + (-1.976903)*sailStates.p + (27.631294)*sailStates.q + (1.019056)*sailStates.r + (0.010047)*sailStates.de;
	CD = -0.869930;
	CY = (-0.282445)*sailStates.alpha + (-0.026476)*sailStates.beta + (0.663732)*sailStates.p + (-1.226114)*sailStates.q + (0.087295)*sailStates.r + (-0.000260)*sailStates.de;

	Cl = (1.273625)*sailStates.alpha + (-0.328950)*sailStates.beta + (-0.734874)*sailStates.p + (4.684546)*sailStates.q + (1.089463)*sailStates.r + (-0.000361)*sailStates.de;
	Cm = (-16.020338)*sailStates.alpha + (0.653313)*sailStates.beta + (7.648018)*sailStates.p + (-122.915771)*sailStates.q + (-3.400607)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (1.062873)*sailStates.alpha + (-0.032199)*sailStates.beta + (-1.525299)*sailStates.p + (7.895258)*sailStates.q + (-0.044677)*sailStates.r + (0.000458)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end