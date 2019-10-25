function [aeroForces] = paramSpace_1_3_3_3_1_2_2(sailStates,airStates)

	CL = (3.852049)*sailStates.alpha + (0.059486)*sailStates.beta + (-2.494960)*sailStates.p + (35.177135)*sailStates.q + (-0.856785)*sailStates.r + (0.010682)*sailStates.de;
	CD = 0.071110;
	CY = (-0.061499)*sailStates.alpha + (-0.025480)*sailStates.beta + (-0.136640)*sailStates.p + (-0.489618)*sailStates.q + (-0.027197)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.145179)*sailStates.alpha + (0.105945)*sailStates.beta + (-1.156481)*sailStates.p + (9.681702)*sailStates.q + (-0.559574)*sailStates.r + (0.000322)*sailStates.de;
	Cm = (-13.814032)*sailStates.alpha + (-0.206211)*sailStates.beta + (8.344056)*sailStates.p + (-135.545776)*sailStates.q + (2.884730)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.190644)*sailStates.alpha + (0.019130)*sailStates.beta + (0.136544)*sailStates.p + (0.399277)*sailStates.q + (-0.038398)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end