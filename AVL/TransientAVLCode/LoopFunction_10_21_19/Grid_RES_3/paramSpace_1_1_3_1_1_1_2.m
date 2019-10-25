function [aeroForces] = paramSpace_1_1_3_1_1_1_2(sailStates,airStates)

	CL = (5.509164)*sailStates.alpha + (-0.547510)*sailStates.beta + (-2.682725)*sailStates.p + (41.761658)*sailStates.q + (-2.677938)*sailStates.r + (0.012115)*sailStates.de;
	CD = -1.816170;
	CY = (-0.235517)*sailStates.alpha + (-0.021033)*sailStates.beta + (-0.947166)*sailStates.p + (-1.671349)*sailStates.q + (-0.167170)*sailStates.r + (-0.000354)*sailStates.de;

	Cl = (1.167573)*sailStates.alpha + (0.380727)*sailStates.beta + (-1.284979)*sailStates.p + (12.135577)*sailStates.q + (-2.310265)*sailStates.r + (0.000545)*sailStates.de;
	Cm = (-10.217903)*sailStates.alpha + (2.035227)*sailStates.beta + (7.470550)*sailStates.p + (-136.726761)*sailStates.q + (8.912089)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.178905)*sailStates.alpha + (0.094884)*sailStates.beta + (2.026776)*sailStates.p + (-7.277278)*sailStates.q + (-0.009941)*sailStates.r + (0.000279)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end