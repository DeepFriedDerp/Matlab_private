function [aeroForces] = paramSpace_9_1_4_2_1_1_2(sailStates,airStates)

	CL = (4.107115)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.781836)*sailStates.p + (36.388546)*sailStates.q + (-0.222074)*sailStates.r + (0.011110)*sailStates.de;
	CD = -0.049210;
	CY = (-0.065174)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.120002)*sailStates.p + (-0.438542)*sailStates.q + (0.004144)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.340025)*sailStates.alpha + (0.077752)*sailStates.beta + (-1.384803)*sailStates.p + (11.320780)*sailStates.q + (-0.243750)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.729984)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.572729)*sailStates.p + (-143.320496)*sailStates.q + (0.729312)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (0.000022)*sailStates.alpha + (-0.002715)*sailStates.beta + (0.342861)*sailStates.p + (-1.523646)*sailStates.q + (-0.001960)*sailStates.r + (0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end