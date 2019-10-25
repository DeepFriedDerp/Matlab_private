function [aeroForces] = paramSpace_2_1_3_2_1_3_2(sailStates,airStates)

	CL = (4.751767)*sailStates.alpha + (0.259556)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (1.220970)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.591280;
	CY = (-0.095723)*sailStates.alpha + (-0.025025)*sailStates.beta + (0.622732)*sailStates.p + (-0.771084)*sailStates.q + (-0.000072)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.637773)*sailStates.alpha + (-0.207108)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (1.140379)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.992692)*sailStates.alpha + (-1.070662)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (-4.171985)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (0.276283)*sailStates.alpha + (0.000347)*sailStates.beta + (-1.356317)*sailStates.p + (6.619109)*sailStates.q + (-0.000150)*sailStates.r + (0.000318)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end