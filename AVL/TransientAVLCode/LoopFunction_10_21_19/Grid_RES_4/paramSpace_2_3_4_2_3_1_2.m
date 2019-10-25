function [aeroForces] = paramSpace_2_3_4_2_3_1_2(sailStates,airStates)

	CL = (4.843367)*sailStates.alpha + (0.100285)*sailStates.beta + (-2.585620)*sailStates.p + (36.194290)*sailStates.q + (-1.530454)*sailStates.r + (0.011328)*sailStates.de;
	CD = -0.589640;
	CY = (0.099545)*sailStates.alpha + (-0.024783)*sailStates.beta + (-0.654407)*sailStates.p + (0.769435)*sailStates.q + (-0.042811)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.589373)*sailStates.alpha + (0.329020)*sailStates.beta + (-1.195406)*sailStates.p + (9.915814)*sailStates.q + (-1.300051)*sailStates.r + (0.000283)*sailStates.de;
	Cm = (-14.664987)*sailStates.alpha + (-0.355893)*sailStates.beta + (8.449064)*sailStates.p + (-136.832825)*sailStates.q + (5.146152)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (-0.278601)*sailStates.alpha + (0.018776)*sailStates.beta + (1.395883)*sailStates.p + (-6.820464)*sailStates.q + (0.011059)*sailStates.r + (-0.000355)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end