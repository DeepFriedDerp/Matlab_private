function [aeroForces] = paramSpace_2_2_2_3_3_2_3(sailStates,airStates)

	CL = (4.049082)*sailStates.alpha + (-0.034505)*sailStates.beta + (-2.821745)*sailStates.p + (37.113255)*sailStates.q + (-0.502370)*sailStates.r + (0.011153)*sailStates.de;
	CD = 0.023620;
	CY = (0.052039)*sailStates.alpha + (-0.025197)*sailStates.beta + (-0.174224)*sailStates.p + (0.563442)*sailStates.q + (-0.011439)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.399503)*sailStates.alpha + (0.052916)*sailStates.beta + (-1.433761)*sailStates.p + (11.970307)*sailStates.q + (-0.376056)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.563554)*sailStates.alpha + (0.133383)*sailStates.beta + (9.566448)*sailStates.p + (-144.107025)*sailStates.q + (1.705658)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.028794)*sailStates.alpha + (0.004334)*sailStates.beta + (0.284929)*sailStates.p + (-1.360692)*sailStates.q + (0.000186)*sailStates.r + (-0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end