function [aeroForces] = paramSpace_3_3_3_2_1_2_2(sailStates,airStates)

	CL = (4.106854)*sailStates.alpha + (-0.036201)*sailStates.beta + (-2.558794)*sailStates.p + (35.019791)*sailStates.q + (0.538869)*sailStates.r + (0.011024)*sailStates.de;
	CD = 0.014020;
	CY = (-0.096957)*sailStates.alpha + (-0.024675)*sailStates.beta + (0.207491)*sailStates.p + (-0.769435)*sailStates.q + (-0.013627)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.280177)*sailStates.alpha + (-0.084197)*sailStates.beta + (-1.186834)*sailStates.p + (9.598485)*sailStates.q + (0.403779)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.714495)*sailStates.alpha + (0.139153)*sailStates.beta + (8.666643)*sailStates.p + (-136.832825)*sailStates.q + (-1.826539)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.092487)*sailStates.alpha + (0.004466)*sailStates.beta + (-0.369366)*sailStates.p + (1.978956)*sailStates.q + (0.002853)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end