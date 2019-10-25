function [aeroForces] = paramSpace_4_4_4_2_2_2_3(sailStates,airStates)

	CL = (3.668720)*sailStates.alpha + (-0.256399)*sailStates.beta + (-2.847511)*sailStates.p + (38.389088)*sailStates.q + (1.148218)*sailStates.r + (0.010538)*sailStates.de;
	CD = 0.101100;
	CY = (0.011703)*sailStates.alpha + (-0.023734)*sailStates.beta + (0.289515)*sailStates.p + (-0.301044)*sailStates.q + (-0.057620)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.236670)*sailStates.alpha + (-0.209289)*sailStates.beta + (-1.424511)*sailStates.p + (12.303548)*sailStates.q + (0.825814)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-12.919774)*sailStates.alpha + (1.006280)*sailStates.beta + (9.344873)*sailStates.p + (-144.677322)*sailStates.q + (-3.885635)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.261150)*sailStates.alpha + (0.029607)*sailStates.beta + (-0.384792)*sailStates.p + (0.889200)*sailStates.q + (-0.031589)*sailStates.r + (0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end