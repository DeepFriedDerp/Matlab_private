function [aeroForces] = paramSpace_2_4_3_2_1_3_3(sailStates,airStates)

	CL = (4.541482)*sailStates.alpha + (-0.197557)*sailStates.beta + (-2.930881)*sailStates.p + (36.703072)*sailStates.q + (0.830991)*sailStates.r + (0.010847)*sailStates.de;
	CD = -0.537560;
	CY = (0.006163)*sailStates.alpha + (-0.025429)*sailStates.beta + (0.517376)*sailStates.p + (-0.668511)*sailStates.q + (0.033887)*sailStates.r + (-0.000144)*sailStates.de;

	Cl = (1.556745)*sailStates.alpha + (-0.283467)*sailStates.beta + (-1.475109)*sailStates.p + (11.824049)*sailStates.q + (0.853546)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-14.957779)*sailStates.alpha + (0.811555)*sailStates.beta + (10.346972)*sailStates.p + (-147.557632)*sailStates.q + (-2.820124)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (0.028164)*sailStates.alpha + (-0.012170)*sailStates.beta + (-1.221080)*sailStates.p + (6.301107)*sailStates.q + (-0.017765)*sailStates.r + (0.000292)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end