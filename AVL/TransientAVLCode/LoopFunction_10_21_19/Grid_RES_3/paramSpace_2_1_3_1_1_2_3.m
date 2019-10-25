function [aeroForces] = paramSpace_2_1_3_1_1_2_3(sailStates,airStates)

	CL = (3.826573)*sailStates.alpha + (0.080913)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (0.457924)*sailStates.r + (0.011424)*sailStates.de;
	CD = -0.027200;
	CY = (-0.102708)*sailStates.alpha + (-0.025257)*sailStates.beta + (0.295219)*sailStates.p + (-1.697132)*sailStates.q + (-0.000159)*sailStates.r + (-0.000370)*sailStates.de;

	Cl = (1.552399)*sailStates.alpha + (-0.050242)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (0.395775)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-13.719087)*sailStates.alpha + (-0.353149)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (-1.568533)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (-0.089737)*sailStates.alpha + (0.000588)*sailStates.beta + (-0.592590)*sailStates.p + (3.819682)*sailStates.q + (0.000007)*sailStates.r + (0.000518)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end