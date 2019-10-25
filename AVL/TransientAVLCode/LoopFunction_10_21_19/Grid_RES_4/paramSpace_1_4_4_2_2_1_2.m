function [aeroForces] = paramSpace_1_4_4_2_2_1_2(sailStates,airStates)

	CL = (4.497282)*sailStates.alpha + (0.409975)*sailStates.beta + (-2.539589)*sailStates.p + (38.543533)*sailStates.q + (-1.988729)*sailStates.r + (0.011312)*sailStates.de;
	CD = -0.481420;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.667152)*sailStates.p + (0.000001)*sailStates.q + (-0.132705)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.313737)*sailStates.alpha + (0.457931)*sailStates.beta + (-1.131981)*sailStates.p + (10.185248)*sailStates.q + (-1.576340)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-12.409802)*sailStates.alpha + (-1.445081)*sailStates.beta + (7.455043)*sailStates.p + (-133.820877)*sailStates.q + (6.578105)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.088157)*sailStates.alpha + (0.064008)*sailStates.beta + (1.349492)*sailStates.p + (-5.558610)*sailStates.q + (-0.000581)*sailStates.r + (-0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end