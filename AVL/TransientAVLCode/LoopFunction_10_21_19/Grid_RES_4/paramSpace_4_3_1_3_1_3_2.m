function [aeroForces] = paramSpace_4_3_1_3_1_3_2(sailStates,airStates)

	CL = (4.376932)*sailStates.alpha + (-0.115299)*sailStates.beta + (-2.516723)*sailStates.p + (37.619122)*sailStates.q + (1.760145)*sailStates.r + (0.011225)*sailStates.de;
	CD = -0.251170;
	CY = (-0.066404)*sailStates.alpha + (-0.024506)*sailStates.beta + (0.580865)*sailStates.p + (-0.489617)*sailStates.q + (-0.115489)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.399987)*sailStates.alpha + (-0.308632)*sailStates.beta + (-1.154643)*sailStates.p + (10.345473)*sailStates.q + (1.355143)*sailStates.r + (0.000256)*sailStates.de;
	Cm = (-13.234295)*sailStates.alpha + (0.396372)*sailStates.beta + (7.585940)*sailStates.p + (-134.148560)*sailStates.q + (-5.819778)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.085386)*sailStates.alpha + (0.053219)*sailStates.beta + (-1.132648)*sailStates.p + (4.909272)*sailStates.q + (0.001084)*sailStates.r + (0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end