function [aeroForces] = paramSpace_1_1_1_1_1_1_3(sailStates,airStates)

	CL = (5.046472)*sailStates.alpha + (-0.636264)*sailStates.beta + (-3.540394)*sailStates.p + (49.119850)*sailStates.q + (-3.009185)*sailStates.r + (0.012378)*sailStates.de;
	CD = -1.886360;
	CY = (-0.561847)*sailStates.alpha + (-0.021838)*sailStates.beta + (-1.080280)*sailStates.p + (-1.081940)*sailStates.q + (-0.190380)*sailStates.r + (-0.000233)*sailStates.de;

	Cl = (1.174980)*sailStates.alpha + (0.394554)*sailStates.beta + (-1.988981)*sailStates.p + (18.870665)*sailStates.q + (-2.624359)*sailStates.r + (0.001699)*sailStates.de;
	Cm = (-8.674548)*sailStates.alpha + (2.479778)*sailStates.beta + (10.244401)*sailStates.p + (-160.704926)*sailStates.q + (10.074969)*sailStates.r + (-0.070299)*sailStates.de;
	Cn = (1.852619)*sailStates.alpha + (0.100445)*sailStates.beta + (2.156569)*sailStates.p + (-7.461898)*sailStates.q + (-0.021109)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end