function [aeroForces] = paramSpace_1_3_1_1_1_1_3(sailStates,airStates)

	CL = (5.046472)*sailStates.alpha + (0.636264)*sailStates.beta + (-3.540394)*sailStates.p + (49.119846)*sailStates.q + (-3.009186)*sailStates.r + (0.012378)*sailStates.de;
	CD = -1.886360;
	CY = (-0.561847)*sailStates.alpha + (-0.027824)*sailStates.beta + (-1.080280)*sailStates.p + (-1.081940)*sailStates.q + (-0.190380)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.103269)*sailStates.alpha + (0.761201)*sailStates.beta + (-1.904363)*sailStates.p + (17.809793)*sailStates.q + (-2.609338)*sailStates.r + (0.001467)*sailStates.de;
	Cm = (-8.674548)*sailStates.alpha + (-2.479778)*sailStates.beta + (10.244402)*sailStates.p + (-160.704956)*sailStates.q + (10.074968)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.700332)*sailStates.alpha + (0.103346)*sailStates.beta + (2.171489)*sailStates.p + (-7.648959)*sailStates.q + (-0.018460)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end