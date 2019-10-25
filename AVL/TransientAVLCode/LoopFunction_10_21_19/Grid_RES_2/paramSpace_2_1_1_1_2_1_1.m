function [aeroForces] = paramSpace_2_1_1_1_2_1_1(sailStates,airStates)

	CL = (4.839325)*sailStates.alpha + (-0.157380)*sailStates.beta + (-1.976904)*sailStates.p + (27.631294)*sailStates.q + (-1.019056)*sailStates.r + (0.010047)*sailStates.de;
	CD = -0.869930;
	CY = (0.282445)*sailStates.alpha + (-0.023333)*sailStates.beta + (-0.663732)*sailStates.p + (1.226114)*sailStates.q + (0.087295)*sailStates.r + (0.000260)*sailStates.de;

	Cl = (1.391953)*sailStates.alpha + (0.235170)*sailStates.beta + (-0.799279)*sailStates.p + (5.486346)*sailStates.q + (-1.081040)*sailStates.r + (-0.000190)*sailStates.de;
	Cm = (-16.020336)*sailStates.alpha + (0.653313)*sailStates.beta + (7.648018)*sailStates.p + (-122.915756)*sailStates.q + (3.400606)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (-1.028333)*sailStates.alpha + (-0.042069)*sailStates.beta + (1.533778)*sailStates.p + (-8.000817)*sailStates.q + (-0.045785)*sailStates.r + (-0.000458)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end