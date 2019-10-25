function [aeroForces] = paramSpace_3_1_2_1_2_2_3(sailStates,airStates)

	CL = (3.658141)*sailStates.alpha + (0.074124)*sailStates.beta + (-3.431988)*sailStates.p + (41.862335)*sailStates.q + (0.442066)*sailStates.r + (0.011347)*sailStates.de;
	CD = 0.031020;
	CY = (0.010356)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.103380)*sailStates.p + (-0.221995)*sailStates.q + (-0.006768)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.416302)*sailStates.alpha + (-0.010360)*sailStates.beta + (-1.970476)*sailStates.p + (17.022434)*sailStates.q + (0.312679)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-13.297880)*sailStates.alpha + (-0.235452)*sailStates.beta + (11.645330)*sailStates.p + (-160.446365)*sailStates.q + (-1.481105)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-0.176378)*sailStates.alpha + (0.002243)*sailStates.beta + (-0.112907)*sailStates.p + (0.244377)*sailStates.q + (-0.004673)*sailStates.r + (0.000088)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end