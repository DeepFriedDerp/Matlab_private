function [aeroForces] = paramSpace_2_3_1_2_1_2_3(sailStates,airStates)

	CL = (3.945713)*sailStates.alpha + (0.027280)*sailStates.beta + (-2.976181)*sailStates.p + (38.210201)*sailStates.q + (-0.199390)*sailStates.r + (0.011197)*sailStates.de;
	CD = 0.041640;
	CY = (-0.081489)*sailStates.alpha + (-0.025285)*sailStates.beta + (0.009839)*sailStates.p + (-0.668511)*sailStates.q + (0.000715)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.344672)*sailStates.alpha + (0.027063)*sailStates.beta + (-1.524892)*sailStates.p + (12.621216)*sailStates.q + (-0.143015)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-14.327305)*sailStates.alpha + (-0.130280)*sailStates.beta + (10.182261)*sailStates.p + (-148.601761)*sailStates.q + (0.718263)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.165972)*sailStates.alpha + (0.002101)*sailStates.beta + (-0.107217)*sailStates.p + (1.438110)*sailStates.q + (-0.010234)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end