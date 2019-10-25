function [aeroForces] = paramSpace_3_3_2_2_1_3_2(sailStates,airStates)

	CL = (4.850669)*sailStates.alpha + (-0.107587)*sailStates.beta + (-2.585370)*sailStates.p + (36.210865)*sailStates.q + (1.539258)*sailStates.r + (0.011298)*sailStates.de;
	CD = -0.605910;
	CY = (-0.099550)*sailStates.alpha + (-0.024729)*sailStates.beta + (0.669373)*sailStates.p + (-0.769435)*sailStates.q + (-0.043846)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.593650)*sailStates.alpha + (-0.336710)*sailStates.beta + (-1.195284)*sailStates.p + (9.916574)*sailStates.q + (1.324011)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.600316)*sailStates.alpha + (0.401767)*sailStates.beta + (8.445756)*sailStates.p + (-136.832825)*sailStates.q + (-5.196623)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.277458)*sailStates.alpha + (0.019153)*sailStates.beta + (-1.417975)*sailStates.p + (6.832049)*sailStates.q + (0.011236)*sailStates.r + (0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end