function [aeroForces] = paramSpace_1_1_1_1_2_3_1(sailStates,airStates)

	CL = (1.908299)*sailStates.alpha + (0.076982)*sailStates.beta + (-5.308385)*sailStates.p + (53.053913)*sailStates.q + (0.329012)*sailStates.r + (0.010942)*sailStates.de;
	CD = -1.762380;
	CY = (0.892430)*sailStates.alpha + (-0.027775)*sailStates.beta + (0.509835)*sailStates.p + (2.033276)*sailStates.q + (0.089704)*sailStates.r + (0.000456)*sailStates.de;

	Cl = (-0.094461)*sailStates.alpha + (-0.341911)*sailStates.beta + (-3.576171)*sailStates.p + (31.461866)*sailStates.q + (0.613709)*sailStates.r + (0.004535)*sailStates.de;
	Cm = (-2.124153)*sailStates.alpha + (-0.311335)*sailStates.beta + (19.271877)*sailStates.p + (-218.017242)*sailStates.q + (-0.972040)*sailStates.r + (-0.078902)*sailStates.de;
	Cn = (-3.174364)*sailStates.alpha + (-0.066185)*sailStates.beta + (-1.841901)*sailStates.p + (9.629302)*sailStates.q + (-0.105244)*sailStates.r + (-0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end