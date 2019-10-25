function [aeroForces] = paramSpace_1_2_1_1_3_2_3(sailStates,airStates)

	CL = (3.907119)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.317325)*sailStates.p + (42.788143)*sailStates.q + (-1.629397)*sailStates.r + (0.011083)*sailStates.de;
	CD = -0.014520;
	CY = (0.084402)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.578746)*sailStates.p + (2.260756)*sailStates.q + (-0.102263)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.666802)*sailStates.alpha + (0.199210)*sailStates.beta + (-1.851685)*sailStates.p + (16.698084)*sailStates.q + (-1.239720)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-13.204373)*sailStates.alpha + (0.000000)*sailStates.beta + (10.592768)*sailStates.p + (-157.393341)*sailStates.q + (5.459352)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (0.533968)*sailStates.alpha + (0.035126)*sailStates.beta + (0.933599)*sailStates.p + (-4.569807)*sailStates.q + (0.003693)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end