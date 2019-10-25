function [aeroForces] = paramSpace_1_2_3_3_3_1_1(sailStates,airStates)

	CL = (4.374692)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.282241)*sailStates.p + (35.199780)*sailStates.q + (-1.565298)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.250200;
	CY = (0.101816)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.534034)*sailStates.p + (0.318253)*sailStates.q + (-0.094134)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.287143)*sailStates.alpha + (0.254320)*sailStates.beta + (-0.973756)*sailStates.p + (8.476014)*sailStates.q + (-1.215960)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-13.406663)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.969185)*sailStates.p + (-127.854218)*sailStates.q + (5.197419)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.324474)*sailStates.alpha + (0.044843)*sailStates.beta + (1.078512)*sailStates.p + (-4.767809)*sailStates.q + (0.005791)*sailStates.r + (-0.000185)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end