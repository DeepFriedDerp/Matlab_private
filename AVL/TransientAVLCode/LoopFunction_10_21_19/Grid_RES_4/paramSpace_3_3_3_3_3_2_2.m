function [aeroForces] = paramSpace_3_3_3_3_3_2_2(sailStates,airStates)

	CL = (4.043969)*sailStates.alpha + (-0.020860)*sailStates.beta + (-2.571550)*sailStates.p + (34.949791)*sailStates.q + (0.207787)*sailStates.r + (0.011026)*sailStates.de;
	CD = 0.032410;
	CY = (0.062046)*sailStates.alpha + (-0.025171)*sailStates.beta + (0.002564)*sailStates.p + (0.498142)*sailStates.q + (-0.000151)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.224224)*sailStates.alpha + (-0.025794)*sailStates.beta + (-1.194774)*sailStates.p + (9.576342)*sailStates.q + (0.133312)*sailStates.r + (0.000312)*sailStates.de;
	Cm = (-14.678632)*sailStates.alpha + (0.086823)*sailStates.beta + (8.812156)*sailStates.p + (-137.428818)*sailStates.q + (-0.721337)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.122663)*sailStates.alpha + (0.001786)*sailStates.beta + (0.051462)*sailStates.p + (-0.867280)*sailStates.q + (-0.007034)*sailStates.r + (-0.000152)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end