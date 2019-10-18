function [aeroForces] = paramSpace_1_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.959709)*sailStates.alpha + (-0.050328)*sailStates.beta + (-2.455431)*sailStates.p + (33.116398)*sailStates.q + (-1.297494)*sailStates.r + (0.009768)*sailStates.de;
	CD = -0.874370;
	CY = (1.300646)*sailStates.alpha + (-0.048924)*sailStates.beta + (-0.850378)*sailStates.p + (10.319122)*sailStates.q + (-0.112685)*sailStates.r + (0.002190)*sailStates.de;

	Cl = (2.270478)*sailStates.alpha + (-0.077273)*sailStates.beta + (-1.275385)*sailStates.p + (11.348325)*sailStates.q + (-0.760796)*sailStates.r + (0.000337)*sailStates.de;
	Cm = (-18.108496)*sailStates.alpha + (0.018916)*sailStates.beta + (7.875806)*sailStates.p + (-132.612915)*sailStates.q + (4.247195)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (-1.207212)*sailStates.alpha + (0.025856)*sailStates.beta + (1.439328)*sailStates.p + (-13.518492)*sailStates.q + (0.112464)*sailStates.r + (-0.003010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end