function [aeroForces] = paramSpace_2_3_2_2_3_1_2(sailStates,airStates)

	CL = (4.851052)*sailStates.alpha + (0.114849)*sailStates.beta + (-2.585124)*sailStates.p + (36.227436)*sailStates.q + (-1.548023)*sailStates.r + (0.011267)*sailStates.de;
	CD = -0.615190;
	CY = (0.099554)*sailStates.alpha + (-0.024675)*sailStates.beta + (-0.684337)*sailStates.p + (0.769433)*sailStates.q + (-0.044881)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.597778)*sailStates.alpha + (0.344399)*sailStates.beta + (-1.195164)*sailStates.p + (9.917333)*sailStates.q + (-1.347956)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.535645)*sailStates.alpha + (-0.447641)*sailStates.beta + (8.442449)*sailStates.p + (-136.832825)*sailStates.q + (5.247096)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.276324)*sailStates.alpha + (0.019543)*sailStates.beta + (1.440083)*sailStates.p + (-6.843628)*sailStates.q + (0.011168)*sailStates.r + (-0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end