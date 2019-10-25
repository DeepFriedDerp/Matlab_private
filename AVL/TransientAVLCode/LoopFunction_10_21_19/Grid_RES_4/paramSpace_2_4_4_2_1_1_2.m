function [aeroForces] = paramSpace_2_4_4_2_1_1_2(sailStates,airStates)

	CL = (4.327950)*sailStates.alpha + (0.244069)*sailStates.beta + (-2.581574)*sailStates.p + (35.843361)*sailStates.q + (-1.125998)*sailStates.r + (0.011161)*sailStates.de;
	CD = -0.343180;
	CY = (-0.097471)*sailStates.alpha + (-0.025363)*sailStates.beta + (-0.405188)*sailStates.p + (-0.769434)*sailStates.q + (-0.026639)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.151790)*sailStates.alpha + (0.304349)*sailStates.beta + (-1.163324)*sailStates.p + (9.412115)*sailStates.q + (-0.968116)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-13.888306)*sailStates.alpha + (-0.874364)*sailStates.beta + (8.559067)*sailStates.p + (-136.512222)*sailStates.q + (3.795863)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.041188)*sailStates.alpha + (0.014819)*sailStates.beta + (0.886554)*sailStates.p + (-3.389815)*sailStates.q + (-0.000464)*sailStates.r + (0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end