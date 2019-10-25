function [aeroForces] = paramSpace_1_3_3_1_1_1_2(sailStates,airStates)

	CL = (5.509164)*sailStates.alpha + (0.547510)*sailStates.beta + (-2.682725)*sailStates.p + (41.761658)*sailStates.q + (-2.677938)*sailStates.r + (0.012115)*sailStates.de;
	CD = -1.816170;
	CY = (-0.235517)*sailStates.alpha + (-0.028629)*sailStates.beta + (-0.947166)*sailStates.p + (-1.671349)*sailStates.q + (-0.167170)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.062320)*sailStates.alpha + (0.690088)*sailStates.beta + (-1.200327)*sailStates.p + (11.074712)*sailStates.q + (-2.295439)*sailStates.r + (0.000317)*sailStates.de;
	Cm = (-10.217903)*sailStates.alpha + (-2.035227)*sailStates.beta + (7.470550)*sailStates.p + (-136.726761)*sailStates.q + (8.912090)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.031003)*sailStates.alpha + (0.093929)*sailStates.beta + (2.041703)*sailStates.p + (-7.464337)*sailStates.q + (-0.007326)*sailStates.r + (0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end