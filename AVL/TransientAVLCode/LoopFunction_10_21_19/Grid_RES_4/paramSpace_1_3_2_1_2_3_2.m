function [aeroForces] = paramSpace_1_3_2_1_2_3_2(sailStates,airStates)

	CL = (5.699482)*sailStates.alpha + (-0.102578)*sailStates.beta + (-2.309831)*sailStates.p + (27.374289)*sailStates.q + (1.261544)*sailStates.r + (0.009020)*sailStates.de;
	CD = -1.971490;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.803107)*sailStates.p + (-0.000000)*sailStates.q + (0.159748)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.616248)*sailStates.alpha + (-0.429035)*sailStates.beta + (-1.093365)*sailStates.p + (7.615203)*sailStates.q + (1.402562)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-16.630625)*sailStates.alpha + (0.397903)*sailStates.beta + (9.639190)*sailStates.p + (-134.847153)*sailStates.q + (-4.064481)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.621711)*sailStates.alpha + (-0.075392)*sailStates.beta + (-2.025672)*sailStates.p + (9.802513)*sailStates.q + (-0.080678)*sailStates.r + (0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end