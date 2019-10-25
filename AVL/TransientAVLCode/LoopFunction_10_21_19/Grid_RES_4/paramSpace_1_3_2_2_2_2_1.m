function [aeroForces] = paramSpace_1_3_2_2_2_2_1(sailStates,airStates)

	CL = (3.805067)*sailStates.alpha + (0.065037)*sailStates.beta + (-2.092415)*sailStates.p + (32.003586)*sailStates.q + (-0.834445)*sailStates.r + (0.010408)*sailStates.de;
	CD = 0.067320;
	CY = (-0.006714)*sailStates.alpha + (-0.025307)*sailStates.beta + (-0.181027)*sailStates.p + (-0.301044)*sailStates.q + (-0.035998)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (0.952758)*sailStates.alpha + (0.118563)*sailStates.beta + (-0.829131)*sailStates.p + (6.646661)*sailStates.q + (-0.558155)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-13.437672)*sailStates.alpha + (-0.245506)*sailStates.beta + (6.915846)*sailStates.p + (-123.990753)*sailStates.q + (2.818332)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.026561)*sailStates.alpha + (0.021170)*sailStates.beta + (0.285852)*sailStates.p + (-0.647125)*sailStates.q + (-0.021402)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end