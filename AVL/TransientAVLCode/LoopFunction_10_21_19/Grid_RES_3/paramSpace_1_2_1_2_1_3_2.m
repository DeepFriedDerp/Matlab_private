function [aeroForces] = paramSpace_1_2_1_2_1_3_2(sailStates,airStates)

	CL = (4.313767)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.452919)*sailStates.p + (31.982653)*sailStates.q + (0.323030)*sailStates.r + (0.010010)*sailStates.de;
	CD = -0.399140;
	CY = (-0.087692)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.373970)*sailStates.p + (-0.759372)*sailStates.q + (0.066013)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.399644)*sailStates.alpha + (-0.156700)*sailStates.beta + (-1.164901)*sailStates.p + (9.008969)*sailStates.q + (0.471644)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-15.268063)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.131386)*sailStates.p + (-136.489655)*sailStates.q + (-0.980757)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.427906)*sailStates.alpha + (-0.027630)*sailStates.beta + (-1.018346)*sailStates.p + (5.899282)*sailStates.q + (-0.060462)*sailStates.r + (0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end