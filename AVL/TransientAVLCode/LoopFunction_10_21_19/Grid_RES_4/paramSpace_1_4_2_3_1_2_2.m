function [aeroForces] = paramSpace_1_4_2_3_1_2_2(sailStates,airStates)

	CL = (3.753583)*sailStates.alpha + (0.197063)*sailStates.beta + (-2.475367)*sailStates.p + (34.957054)*sailStates.q + (-0.857782)*sailStates.r + (0.010433)*sailStates.de;
	CD = 0.082500;
	CY = (-0.061023)*sailStates.alpha + (-0.026395)*sailStates.beta + (-0.149376)*sailStates.p + (-0.489619)*sailStates.q + (-0.029695)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.078159)*sailStates.alpha + (0.146784)*sailStates.beta + (-1.115864)*sailStates.p + (9.213066)*sailStates.q + (-0.571561)*sailStates.r + (0.000233)*sailStates.de;
	Cm = (-13.403287)*sailStates.alpha + (-0.743638)*sailStates.beta + (8.272127)*sailStates.p + (-134.519470)*sailStates.q + (2.908454)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (0.171214)*sailStates.alpha + (0.023540)*sailStates.beta + (0.162181)*sailStates.p + (0.314658)*sailStates.q + (-0.037334)*sailStates.r + (0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end