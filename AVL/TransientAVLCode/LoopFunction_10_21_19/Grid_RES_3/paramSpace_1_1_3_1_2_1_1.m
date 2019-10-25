function [aeroForces] = paramSpace_1_1_3_1_2_1_1(sailStates,airStates)

	CL = (6.219586)*sailStates.alpha + (-0.563763)*sailStates.beta + (-1.778542)*sailStates.p + (34.765682)*sailStates.q + (-2.803846)*sailStates.r + (0.011698)*sailStates.de;
	CD = -2.317580;
	CY = (0.337478)*sailStates.alpha + (-0.023492)*sailStates.beta + (-1.120152)*sailStates.p + (-0.589409)*sailStates.q + (-0.197569)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (1.367666)*sailStates.alpha + (0.423140)*sailStates.beta + (-0.552489)*sailStates.p + (5.483175)*sailStates.q + (-2.413514)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-9.928926)*sailStates.alpha + (2.088949)*sailStates.beta + (4.159696)*sailStates.p + (-110.634644)*sailStates.q + (9.305238)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-1.903938)*sailStates.alpha + (0.108584)*sailStates.beta + (2.515221)*sailStates.p + (-10.912829)*sailStates.q + (0.035062)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end