function [aeroForces] = paramSpace_2_4_3_2_3_1_3(sailStates,airStates)

	CL = (4.718799)*sailStates.alpha + (0.328646)*sailStates.beta + (-2.968058)*sailStates.p + (39.203373)*sailStates.q + (-1.589226)*sailStates.r + (0.011330)*sailStates.de;
	CD = -0.609980;
	CY = (-0.002546)*sailStates.alpha + (-0.023949)*sailStates.beta + (-0.685117)*sailStates.p + (0.870360)*sailStates.q + (-0.044874)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.661262)*sailStates.alpha + (0.408894)*sailStates.beta + (-1.482129)*sailStates.p + (12.488622)*sailStates.q + (-1.363176)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.167434)*sailStates.alpha + (-1.224852)*sailStates.beta + (9.721912)*sailStates.p + (-146.834106)*sailStates.q + (5.362991)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.150657)*sailStates.alpha + (0.017841)*sailStates.beta + (1.431267)*sailStates.p + (-6.883645)*sailStates.q + (0.010767)*sailStates.r + (-0.000385)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end