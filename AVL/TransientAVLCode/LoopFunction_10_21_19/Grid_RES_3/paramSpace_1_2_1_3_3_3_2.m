function [aeroForces] = paramSpace_1_2_1_3_3_3_2(sailStates,airStates)

	CL = (3.927326)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.444319)*sailStates.p + (33.299133)*sailStates.q + (-0.358998)*sailStates.r + (0.010230)*sailStates.de;
	CD = -0.021190;
	CY = (0.060250)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.008091)*sailStates.p + (0.491627)*sailStates.q + (0.001380)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.210396)*sailStates.alpha + (-0.023652)*sailStates.beta + (-1.152082)*sailStates.p + (9.366160)*sailStates.q + (-0.126982)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-14.413776)*sailStates.alpha + (0.000000)*sailStates.beta + (8.539859)*sailStates.p + (-134.907364)*sailStates.q + (1.259114)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.143638)*sailStates.alpha + (-0.004171)*sailStates.beta + (-0.222743)*sailStates.p + (1.365128)*sailStates.q + (-0.025964)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end