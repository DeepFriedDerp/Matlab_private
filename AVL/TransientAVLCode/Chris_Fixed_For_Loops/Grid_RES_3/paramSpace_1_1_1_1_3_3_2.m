function [aeroForces] = paramSpace_1_1_1_1_3_3_2(sailStates,airStates)

	CL = (-1.863162)*sailStates.alpha + (0.189547)*sailStates.beta + (-7.376460)*sailStates.p + (66.470924)*sailStates.q + (1.044953)*sailStates.r + (0.011630)*sailStates.de;
	CD = -5.396860;
	CY = (2.551328)*sailStates.alpha + (-0.030553)*sailStates.beta + (0.941312)*sailStates.p + (4.037805)*sailStates.q + (0.165595)*sailStates.r + (0.000940)*sailStates.de;

	Cl = (-4.553309)*sailStates.alpha + (-0.628000)*sailStates.beta + (-5.330256)*sailStates.p + (47.291698)*sailStates.q + (1.381185)*sailStates.r + (0.007846)*sailStates.de;
	Cm = (24.221962)*sailStates.alpha + (-0.769020)*sailStates.beta + (27.202566)*sailStates.p + (-278.521088)*sailStates.q + (-3.320193)*sailStates.r + (-0.089906)*sailStates.de;
	Cn = (-10.929807)*sailStates.alpha + (-0.121468)*sailStates.beta + (-3.197344)*sailStates.p + (15.769160)*sailStates.q + (-0.154058)*sailStates.r + (-0.000643)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end