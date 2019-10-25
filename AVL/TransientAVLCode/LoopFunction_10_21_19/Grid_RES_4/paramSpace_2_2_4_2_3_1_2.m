function [aeroForces] = paramSpace_2_2_4_2_3_1_2(sailStates,airStates)

	CL = (4.843367)*sailStates.alpha + (-0.100285)*sailStates.beta + (-2.585620)*sailStates.p + (36.194290)*sailStates.q + (-1.530454)*sailStates.r + (0.011328)*sailStates.de;
	CD = -0.589640;
	CY = (0.099545)*sailStates.alpha + (-0.025169)*sailStates.beta + (-0.654407)*sailStates.p + (0.769435)*sailStates.q + (-0.042811)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.638238)*sailStates.alpha + (0.262519)*sailStates.beta + (-1.228057)*sailStates.p + (10.319690)*sailStates.q + (-1.302148)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-14.664987)*sailStates.alpha + (0.355893)*sailStates.beta + (8.449064)*sailStates.p + (-136.832825)*sailStates.q + (5.146152)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.249455)*sailStates.alpha + (0.019995)*sailStates.beta + (1.393743)*sailStates.p + (-6.793993)*sailStates.q + (0.010922)*sailStates.r + (-0.000355)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end