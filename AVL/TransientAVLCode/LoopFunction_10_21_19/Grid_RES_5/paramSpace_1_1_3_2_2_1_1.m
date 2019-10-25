function [aeroForces] = paramSpace_1_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.147402)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.265336)*sailStates.p + (36.162014)*sailStates.q + (-1.760843)*sailStates.r + (0.010828)*sailStates.de;
	CD = -0.153820;
	CY = (0.078263)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.543186)*sailStates.p + (0.199286)*sailStates.q + (-0.135424)*sailStates.r + (0.000042)*sailStates.de;

	Cl = (1.244232)*sailStates.alpha + (0.263760)*sailStates.beta + (-0.978477)*sailStates.p + (9.006552)*sailStates.q + (-1.330630)*sailStates.r + (0.000027)*sailStates.de;
	Cm = (-12.316324)*sailStates.alpha + (0.000000)*sailStates.beta + (6.583633)*sailStates.p + (-127.104668)*sailStates.q + (5.795775)*sailStates.r + (-0.065753)*sailStates.de;
	Cn = (-0.210191)*sailStates.alpha + (0.065763)*sailStates.beta + (1.051390)*sailStates.p + (-4.208787)*sailStates.q + (-0.008835)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end