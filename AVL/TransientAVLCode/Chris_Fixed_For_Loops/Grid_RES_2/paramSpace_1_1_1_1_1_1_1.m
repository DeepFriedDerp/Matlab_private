function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.452097)*sailStates.alpha + (-0.670584)*sailStates.beta + (-1.976047)*sailStates.p + (34.324017)*sailStates.q + (-1.883062)*sailStates.r + (0.011055)*sailStates.de;
	CD = -0.914540;
	CY = (-0.099067)*sailStates.alpha + (-0.015874)*sailStates.beta + (-0.645610)*sailStates.p + (-2.113322)*sailStates.q + (-0.113638)*sailStates.r + (-0.000439)*sailStates.de;

	Cl = (0.704435)*sailStates.alpha + (0.245070)*sailStates.beta + (-0.754243)*sailStates.p + (6.792353)*sailStates.q + (-1.643862)*sailStates.r + (-0.000240)*sailStates.de;
	Cm = (-10.083582)*sailStates.alpha + (2.673315)*sailStates.beta + (5.618247)*sailStates.p + (-117.603867)*sailStates.q + (6.326084)*sailStates.r + (-0.064835)*sailStates.de;
	Cn = (-0.595261)*sailStates.alpha + (0.067285)*sailStates.beta + (1.417726)*sailStates.p + (-4.407985)*sailStates.q + (-0.016993)*sailStates.r + (0.000498)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end