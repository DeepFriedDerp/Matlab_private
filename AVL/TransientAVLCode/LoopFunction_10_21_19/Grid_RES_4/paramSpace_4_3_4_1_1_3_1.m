function [aeroForces] = paramSpace_4_3_4_1_1_3_1(sailStates,airStates)

	CL = (7.432146)*sailStates.alpha + (-0.257921)*sailStates.beta + (-1.748078)*sailStates.p + (36.295437)*sailStates.q + (3.332499)*sailStates.r + (0.011666)*sailStates.de;
	CD = -3.014870;
	CY = (-0.699130)*sailStates.alpha + (-0.023806)*sailStates.beta + (1.434279)*sailStates.p + (-1.002335)*sailStates.q + (-0.285403)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (2.315887)*sailStates.alpha + (-0.745049)*sailStates.beta + (-0.470590)*sailStates.p + (5.155666)*sailStates.q + (2.865725)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-10.125812)*sailStates.alpha + (0.992760)*sailStates.beta + (3.365015)*sailStates.p + (-108.591927)*sailStates.q + (-11.012542)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (2.687817)*sailStates.alpha + (0.129011)*sailStates.beta + (-3.169485)*sailStates.p + (14.879735)*sailStates.q + (0.078845)*sailStates.r + (0.000477)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end