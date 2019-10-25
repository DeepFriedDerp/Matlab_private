function [aeroForces] = paramSpace_3_1_4_2_2_3_1(sailStates,airStates)

	CL = (4.466341)*sailStates.alpha + (0.329113)*sailStates.beta + (-2.170946)*sailStates.p + (32.676414)*sailStates.q + (1.299426)*sailStates.r + (0.010883)*sailStates.de;
	CD = -0.477520;
	CY = (-0.080282)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.557692)*sailStates.p + (0.100924)*sailStates.q + (-0.036542)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.235905)*sailStates.alpha + (-0.197171)*sailStates.beta + (-0.927300)*sailStates.p + (7.587519)*sailStates.q + (1.166409)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-13.702797)*sailStates.alpha + (-1.352071)*sailStates.beta + (7.118562)*sailStates.p + (-125.105080)*sailStates.q + (-4.434910)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.477158)*sailStates.alpha + (0.019659)*sailStates.beta + (-1.189301)*sailStates.p + (5.046014)*sailStates.q + (0.005158)*sailStates.r + (0.000049)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end