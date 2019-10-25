function [aeroForces] = paramSpace_2_1_1_3_3_1_2(sailStates,airStates)

	CL = (4.334965)*sailStates.alpha + (-0.176907)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-0.793759)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.233230;
	CY = (0.061971)*sailStates.alpha + (-0.024956)*sailStates.beta + (-0.409805)*sailStates.p + (0.499211)*sailStates.q + (-0.000047)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.451175)*sailStates.alpha + (0.137100)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-0.748778)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.792442)*sailStates.alpha + (0.749817)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (2.721970)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.177738)*sailStates.alpha + (0.000214)*sailStates.beta + (0.887584)*sailStates.p + (-4.286779)*sailStates.q + (-0.000174)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end