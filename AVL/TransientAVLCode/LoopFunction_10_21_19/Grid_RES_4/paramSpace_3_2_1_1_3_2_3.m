function [aeroForces] = paramSpace_3_2_1_1_3_2_3(sailStates,airStates)

	CL = (3.776287)*sailStates.alpha + (-0.002984)*sailStates.beta + (-3.468905)*sailStates.p + (42.018036)*sailStates.q + (-0.008032)*sailStates.r + (0.011554)*sailStates.de;
	CD = -0.005330;
	CY = (0.113661)*sailStates.alpha + (-0.024607)*sailStates.beta + (-0.185126)*sailStates.p + (1.471502)*sailStates.q + (0.011978)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (1.454319)*sailStates.alpha + (0.033395)*sailStates.beta + (-1.957906)*sailStates.p + (16.664253)*sailStates.q + (-0.073948)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-13.733160)*sailStates.alpha + (0.037509)*sailStates.beta + (11.910316)*sailStates.p + (-162.286758)*sailStates.q + (0.046976)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-0.092790)*sailStates.alpha + (-0.002892)*sailStates.beta + (0.468999)*sailStates.p + (-3.541494)*sailStates.q + (-0.017547)*sailStates.r + (-0.000435)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end