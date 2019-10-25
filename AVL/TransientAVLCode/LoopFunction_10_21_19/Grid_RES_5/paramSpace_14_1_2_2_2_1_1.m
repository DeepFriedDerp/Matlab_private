function [aeroForces] = paramSpace_14_1_2_2_2_1_1(sailStates,airStates)

	CL = (3.920414)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.233619)*sailStates.p + (31.463758)*sailStates.q + (0.310858)*sailStates.r + (0.010140)*sailStates.de;
	CD = -0.048810;
	CY = (0.078765)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.110663)*sailStates.p + (0.571905)*sailStates.q + (0.023502)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.106916)*sailStates.alpha + (0.032670)*sailStates.beta + (-0.983160)*sailStates.p + (7.740857)*sailStates.q + (0.048744)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-14.579988)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.961884)*sailStates.p + (-129.462372)*sailStates.q + (-1.096421)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (-0.325984)*sailStates.alpha + (-0.006944)*sailStates.beta + (0.403547)*sailStates.p + (-2.777594)*sailStates.q + (-0.051730)*sailStates.r + (-0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end