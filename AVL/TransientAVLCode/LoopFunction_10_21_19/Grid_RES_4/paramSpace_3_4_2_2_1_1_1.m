function [aeroForces] = paramSpace_3_4_2_2_1_1_1(sailStates,airStates)

	CL = (4.211304)*sailStates.alpha + (0.156124)*sailStates.beta + (-2.110950)*sailStates.p + (30.270899)*sailStates.q + (-0.533958)*sailStates.r + (0.010462)*sailStates.de;
	CD = -0.326870;
	CY = (-0.030977)*sailStates.alpha + (-0.024143)*sailStates.beta + (-0.301101)*sailStates.p + (-0.668511)*sailStates.q + (0.019759)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.895990)*sailStates.alpha + (0.213018)*sailStates.beta + (-0.808342)*sailStates.p + (5.753184)*sailStates.q + (-0.611045)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.572309)*sailStates.alpha + (-0.669396)*sailStates.beta + (7.484679)*sailStates.p + (-124.743294)*sailStates.q + (1.827675)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.342867)*sailStates.alpha + (-0.010759)*sailStates.beta + (0.733865)*sailStates.p + (-2.899599)*sailStates.q + (-0.004658)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end