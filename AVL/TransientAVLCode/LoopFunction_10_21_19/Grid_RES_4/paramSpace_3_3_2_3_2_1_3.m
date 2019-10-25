function [aeroForces] = paramSpace_3_3_2_3_2_1_3(sailStates,airStates)

	CL = (4.192232)*sailStates.alpha + (0.029620)*sailStates.beta + (-2.810003)*sailStates.p + (36.288208)*sailStates.q + (-0.289397)*sailStates.r + (0.011027)*sailStates.de;
	CD = -0.151310;
	CY = (-0.032853)*sailStates.alpha + (-0.024955)*sailStates.beta + (-0.229681)*sailStates.p + (-0.065300)*sailStates.q + (0.015056)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.361207)*sailStates.alpha + (0.123553)*sailStates.beta + (-1.398977)*sailStates.p + (11.350806)*sailStates.q + (-0.367080)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.879155)*sailStates.alpha + (-0.132775)*sailStates.beta + (9.772079)*sailStates.p + (-144.341232)*sailStates.q + (0.993586)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.057100)*sailStates.alpha + (-0.007236)*sailStates.beta + (0.592857)*sailStates.p + (-2.888400)*sailStates.q + (-0.008834)*sailStates.r + (-0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end