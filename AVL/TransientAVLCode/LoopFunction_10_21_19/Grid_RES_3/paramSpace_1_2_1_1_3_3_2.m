function [aeroForces] = paramSpace_1_2_1_1_3_3_2(sailStates,airStates)

	CL = (5.073253)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.305946)*sailStates.p + (28.485004)*sailStates.q + (0.923643)*sailStates.r + (0.009233)*sailStates.de;
	CD = -1.509580;
	CY = (0.187313)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.551851)*sailStates.p + (1.671348)*sailStates.q + (0.097147)*sailStates.r + (0.000355)*sailStates.de;

	Cl = (1.128855)*sailStates.alpha + (-0.342582)*sailStates.beta + (-1.098770)*sailStates.p + (8.104196)*sailStates.q + (1.097901)*sailStates.r + (0.000236)*sailStates.de;
	Cm = (-15.328263)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.106223)*sailStates.p + (-133.415192)*sailStates.q + (-3.004211)*sailStates.r + (-0.068163)*sailStates.de;
	Cn = (0.299818)*sailStates.alpha + (-0.060406)*sailStates.beta + (-1.488402)*sailStates.p + (6.156587)*sailStates.q + (-0.034581)*sailStates.r + (-0.000332)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end