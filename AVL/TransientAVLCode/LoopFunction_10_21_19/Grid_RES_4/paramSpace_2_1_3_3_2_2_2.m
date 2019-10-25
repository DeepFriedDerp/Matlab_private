function [aeroForces] = paramSpace_2_1_3_3_2_2_2(sailStates,airStates)

	CL = (4.002318)*sailStates.alpha + (-0.058393)*sailStates.beta + (-2.547248)*sailStates.p + (34.694649)*sailStates.q + (-0.326645)*sailStates.r + (0.010888)*sailStates.de;
	CD = 0.028630;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.067607)*sailStates.p + (0.000000)*sailStates.q + (-0.004431)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.311290)*sailStates.alpha + (0.011880)*sailStates.beta + (-1.247754)*sailStates.p + (10.316020)*sailStates.q + (-0.218244)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.502230)*sailStates.alpha + (0.182639)*sailStates.beta + (8.691632)*sailStates.p + (-136.150452)*sailStates.q + (1.096656)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.049454)*sailStates.alpha + (0.001812)*sailStates.beta + (0.086839)*sailStates.p + (-0.185110)*sailStates.q + (-0.003284)*sailStates.r + (-0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end