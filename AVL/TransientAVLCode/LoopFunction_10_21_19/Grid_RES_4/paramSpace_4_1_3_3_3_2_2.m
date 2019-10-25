function [aeroForces] = paramSpace_4_1_3_3_3_2_2(sailStates,airStates)

	CL = (3.753583)*sailStates.alpha + (0.197063)*sailStates.beta + (-2.475367)*sailStates.p + (34.957058)*sailStates.q + (0.857782)*sailStates.r + (0.010433)*sailStates.de;
	CD = 0.082500;
	CY = (0.061023)*sailStates.alpha + (-0.023177)*sailStates.beta + (0.149376)*sailStates.p + (0.489619)*sailStates.q + (-0.029695)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.216433)*sailStates.alpha + (-0.035975)*sailStates.beta + (-1.210237)*sailStates.p + (10.400949)*sailStates.q + (0.590376)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-13.403287)*sailStates.alpha + (-0.743638)*sailStates.beta + (8.272127)*sailStates.p + (-134.519470)*sailStates.q + (-2.908454)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.224266)*sailStates.alpha + (0.012813)*sailStates.beta + (-0.143409)*sailStates.p + (-0.550942)*sailStates.q + (-0.041076)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end