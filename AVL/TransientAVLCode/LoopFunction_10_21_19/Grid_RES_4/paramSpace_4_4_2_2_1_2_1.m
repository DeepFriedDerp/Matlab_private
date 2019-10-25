function [aeroForces] = paramSpace_4_4_2_2_1_2_1(sailStates,airStates)

	CL = (3.875432)*sailStates.alpha + (-0.199544)*sailStates.beta + (-2.051818)*sailStates.p + (31.811563)*sailStates.q + (1.012703)*sailStates.r + (0.010332)*sailStates.de;
	CD = 0.025400;
	CY = (-0.107539)*sailStates.alpha + (-0.023385)*sailStates.beta + (0.285218)*sailStates.p + (-0.455227)*sailStates.q + (-0.056717)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (0.960245)*sailStates.alpha + (-0.182729)*sailStates.beta + (-0.775275)*sailStates.p + (6.212976)*sailStates.q + (0.682648)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-13.393852)*sailStates.alpha + (0.686698)*sailStates.beta + (6.603569)*sailStates.p + (-121.885399)*sailStates.q + (-3.373660)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.242621)*sailStates.alpha + (0.023428)*sailStates.beta + (-0.521747)*sailStates.p + (2.430107)*sailStates.q + (-0.001389)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end