function [aeroForces] = paramSpace_4_2_2_3_3_2_2(sailStates,airStates)

	CL = (3.852049)*sailStates.alpha + (0.059486)*sailStates.beta + (-2.494960)*sailStates.p + (35.177135)*sailStates.q + (0.856785)*sailStates.r + (0.010682)*sailStates.de;
	CD = 0.071110;
	CY = (0.061499)*sailStates.alpha + (-0.024472)*sailStates.beta + (0.136640)*sailStates.p + (0.489618)*sailStates.q + (-0.027197)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.191994)*sailStates.alpha + (-0.069026)*sailStates.beta + (-1.188024)*sailStates.p + (10.078675)*sailStates.q + (0.565835)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-13.814032)*sailStates.alpha + (-0.206211)*sailStates.beta + (8.344056)*sailStates.p + (-135.545776)*sailStates.q + (-2.884730)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (-0.207916)*sailStates.alpha + (0.015674)*sailStates.beta + (-0.130270)*sailStates.p + (-0.478239)*sailStates.q + (-0.039643)*sailStates.r + (-0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end