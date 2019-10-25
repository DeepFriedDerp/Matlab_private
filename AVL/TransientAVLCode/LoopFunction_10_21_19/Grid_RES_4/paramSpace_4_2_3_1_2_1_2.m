function [aeroForces] = paramSpace_4_2_3_1_2_1_2(sailStates,airStates)

	CL = (5.699482)*sailStates.alpha + (-0.102578)*sailStates.beta + (-2.309831)*sailStates.p + (27.374289)*sailStates.q + (-1.261544)*sailStates.r + (0.009020)*sailStates.de;
	CD = -1.971490;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.803107)*sailStates.p + (0.000000)*sailStates.q + (0.159748)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.671766)*sailStates.alpha + (0.373743)*sailStates.beta + (-1.124902)*sailStates.p + (8.012171)*sailStates.q + (-1.396274)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-16.630625)*sailStates.alpha + (0.397903)*sailStates.beta + (9.639189)*sailStates.p + (-134.847153)*sailStates.q + (4.064479)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.596337)*sailStates.alpha + (-0.084290)*sailStates.beta + (2.031945)*sailStates.p + (-9.881474)*sailStates.q + (-0.081929)*sailStates.r + (-0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end