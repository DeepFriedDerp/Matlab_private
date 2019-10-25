function [aeroForces] = paramSpace_1_1_1_1_2_2_2(sailStates,airStates)

	CL = (3.750380)*sailStates.alpha + (-0.234693)*sailStates.beta + (-2.460238)*sailStates.p + (35.085938)*sailStates.q + (-0.991428)*sailStates.r + (0.010344)*sailStates.de;
	CD = 0.092180;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.241527)*sailStates.p + (-0.000000)*sailStates.q + (-0.048043)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.251520)*sailStates.alpha + (0.053437)*sailStates.beta + (-1.200897)*sailStates.p + (10.428667)*sailStates.q + (-0.716567)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-13.183978)*sailStates.alpha + (0.932682)*sailStates.beta + (8.094842)*sailStates.p + (-133.820877)*sailStates.q + (3.361615)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.147025)*sailStates.alpha + (0.020185)*sailStates.beta + (0.329222)*sailStates.p + (-0.574193)*sailStates.q + (-0.029802)*sailStates.r + (-0.000011)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end