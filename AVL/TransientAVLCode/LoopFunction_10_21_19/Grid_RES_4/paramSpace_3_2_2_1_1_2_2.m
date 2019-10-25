function [aeroForces] = paramSpace_3_2_2_1_1_2_2(sailStates,airStates)

	CL = (4.261532)*sailStates.alpha + (0.040161)*sailStates.beta + (-2.549737)*sailStates.p + (35.054230)*sailStates.q + (0.771520)*sailStates.r + (0.011053)*sailStates.de;
	CD = -0.043100;
	CY = (-0.215174)*sailStates.alpha + (-0.025520)*sailStates.beta + (0.341927)*sailStates.p + (-1.693497)*sailStates.q + (-0.022351)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.445958)*sailStates.alpha + (-0.085614)*sailStates.beta + (-1.213815)*sailStates.p + (10.017741)*sailStates.q + (0.579137)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.990989)*sailStates.alpha + (-0.131443)*sailStates.beta + (8.563864)*sailStates.p + (-136.398376)*sailStates.q + (-2.581917)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (0.240627)*sailStates.alpha + (0.007316)*sailStates.beta + (-0.651916)*sailStates.p + (4.015800)*sailStates.q + (0.009865)*sailStates.r + (0.000544)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end