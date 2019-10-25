function [aeroForces] = paramSpace_4_3_3_1_1_2_1(sailStates,airStates)

	CL = (3.798586)*sailStates.alpha + (-0.076210)*sailStates.beta + (-1.578592)*sailStates.p + (28.315536)*sailStates.q + (1.073111)*sailStates.r + (0.010203)*sailStates.de;
	CD = -0.029370;
	CY = (-0.278664)*sailStates.alpha + (-0.023875)*sailStates.beta + (0.388060)*sailStates.p + (-1.002333)*sailStates.q + (-0.077226)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.737786)*sailStates.alpha + (-0.173540)*sailStates.beta + (-0.417066)*sailStates.p + (3.059157)*sailStates.q + (0.754600)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-12.545850)*sailStates.alpha + (0.281641)*sailStates.beta + (4.845437)*sailStates.p + (-108.591927)*sailStates.q + (-3.569959)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (0.774418)*sailStates.alpha + (0.028662)*sailStates.beta + (-0.799880)*sailStates.p + (4.339874)*sailStates.q + (0.025536)*sailStates.r + (0.000322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end