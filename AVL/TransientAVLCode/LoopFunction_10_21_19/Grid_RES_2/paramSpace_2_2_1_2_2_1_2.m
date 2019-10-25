function [aeroForces] = paramSpace_2_2_1_2_2_1_2(sailStates,airStates)

	CL = (4.071384)*sailStates.alpha + (0.010511)*sailStates.beta + (-2.718587)*sailStates.p + (35.370014)*sailStates.q + (0.063413)*sailStates.r + (0.010734)*sailStates.de;
	CD = -0.092330;
	CY = (0.021419)*sailStates.alpha + (-0.025289)*sailStates.beta + (-0.165469)*sailStates.p + (0.299436)*sailStates.q + (0.021763)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.298050)*sailStates.alpha + (0.067612)*sailStates.beta + (-1.324643)*sailStates.p + (10.674121)*sailStates.q + (-0.118067)*sailStates.r + (0.000548)*sailStates.de;
	Cm = (-14.825732)*sailStates.alpha + (-0.098487)*sailStates.beta + (9.545457)*sailStates.p + (-142.147675)*sailStates.q + (-0.213635)*sailStates.r + (-0.069412)*sailStates.de;
	Cn = (-0.183205)*sailStates.alpha + (-0.006550)*sailStates.beta + (0.505488)*sailStates.p + (-2.960121)*sailStates.q + (-0.028160)*sailStates.r + (-0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end