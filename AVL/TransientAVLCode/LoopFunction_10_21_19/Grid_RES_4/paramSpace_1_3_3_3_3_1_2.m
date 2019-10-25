function [aeroForces] = paramSpace_1_3_3_3_3_1_2(sailStates,airStates)

	CL = (4.351882)*sailStates.alpha + (0.122401)*sailStates.beta + (-2.515980)*sailStates.p + (37.667713)*sailStates.q + (-1.768790)*sailStates.r + (0.011138)*sailStates.de;
	CD = -0.254220;
	CY = (0.066406)*sailStates.alpha + (-0.024472)*sailStates.beta + (-0.595315)*sailStates.p + (0.489621)*sailStates.q + (-0.118398)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.402062)*sailStates.alpha + (0.316063)*sailStates.beta + (-1.154286)*sailStates.p + (10.347701)*sailStates.q + (-1.378655)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-13.035059)*sailStates.alpha + (-0.440678)*sailStates.beta + (7.576267)*sailStates.p + (-134.148560)*sailStates.q + (5.868412)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (-0.084123)*sailStates.alpha + (0.054594)*sailStates.beta + (1.154384)*sailStates.p + (-4.920470)*sailStates.q + (0.001009)*sailStates.r + (-0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end