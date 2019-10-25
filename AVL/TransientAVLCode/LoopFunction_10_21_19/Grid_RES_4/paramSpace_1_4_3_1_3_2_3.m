function [aeroForces] = paramSpace_1_4_3_1_3_2_3(sailStates,airStates)

	CL = (3.893280)*sailStates.alpha + (0.300165)*sailStates.beta + (-3.264841)*sailStates.p + (42.527916)*sailStates.q + (-1.743090)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.033160;
	CY = (0.091237)*sailStates.alpha + (-0.017623)*sailStates.beta + (-0.582461)*sailStates.p + (2.326708)*sailStates.q + (-0.115776)*sailStates.r + (0.000496)*sailStates.de;

	Cl = (1.589811)*sailStates.alpha + (0.317801)*sailStates.beta + (-1.776230)*sailStates.p + (16.060144)*sailStates.q + (-1.281291)*sailStates.r + (0.001220)*sailStates.de;
	Cm = (-13.114246)*sailStates.alpha + (-1.022001)*sailStates.beta + (10.297053)*sailStates.p + (-155.326050)*sailStates.q + (5.776831)*sailStates.r + (-0.068959)*sailStates.de;
	Cn = (0.514203)*sailStates.alpha + (0.036087)*sailStates.beta + (0.942990)*sailStates.p + (-4.749107)*sailStates.q + (0.002825)*sailStates.r + (-0.000758)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end