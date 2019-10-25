function [aeroForces] = paramSpace_2_4_3_1_2_2_3(sailStates,airStates)

	CL = (3.658142)*sailStates.alpha + (0.074124)*sailStates.beta + (-3.431988)*sailStates.p + (41.862335)*sailStates.q + (-0.442066)*sailStates.r + (0.011347)*sailStates.de;
	CD = 0.031020;
	CY = (-0.010356)*sailStates.alpha + (-0.024573)*sailStates.beta + (-0.103380)*sailStates.p + (0.221995)*sailStates.q + (-0.006768)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.303277)*sailStates.alpha + (0.073182)*sailStates.beta + (-1.872776)*sailStates.p + (15.813871)*sailStates.q + (-0.306318)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-13.297880)*sailStates.alpha + (-0.235452)*sailStates.beta + (11.645330)*sailStates.p + (-160.446381)*sailStates.q + (1.481105)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (0.157771)*sailStates.alpha + (0.003232)*sailStates.beta + (0.119310)*sailStates.p + (-0.323590)*sailStates.q + (-0.004257)*sailStates.r + (-0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end