function [aeroForces] = paramSpace_3_2_1_2_1_3_1(sailStates,airStates)

	CL = (4.779268)*sailStates.alpha + (0.097959)*sailStates.beta + (-2.183360)*sailStates.p + (32.935833)*sailStates.q + (1.478618)*sailStates.r + (0.011140)*sailStates.de;
	CD = -0.585390;
	CY = (-0.193009)*sailStates.alpha + (-0.025144)*sailStates.beta + (0.638252)*sailStates.p + (-0.668512)*sailStates.q + (-0.041763)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.403177)*sailStates.alpha + (-0.259924)*sailStates.beta + (-0.899480)*sailStates.p + (7.270813)*sailStates.q + (1.259574)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.432222)*sailStates.alpha + (-0.348237)*sailStates.beta + (7.105992)*sailStates.p + (-125.787453)*sailStates.q + (-4.975353)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.687095)*sailStates.alpha + (0.019757)*sailStates.beta + (-1.382051)*sailStates.p + (6.766960)*sailStates.q + (0.011555)*sailStates.r + (0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end