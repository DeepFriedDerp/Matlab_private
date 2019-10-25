function [aeroForces] = paramSpace_2_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.792892)*sailStates.alpha + (-1.946833)*sailStates.beta + (-3.667506)*sailStates.p + (50.319439)*sailStates.q + (2.164532)*sailStates.r + (0.012650)*sailStates.de;
	CD = -5.551250;
	CY = (1.919808)*sailStates.alpha + (-0.132246)*sailStates.beta + (0.287553)*sailStates.p + (15.149135)*sailStates.q + (-0.030346)*sailStates.r + (0.003206)*sailStates.de;

	Cl = (-4.783085)*sailStates.alpha + (-1.018767)*sailStates.beta + (-1.857178)*sailStates.p + (16.043812)*sailStates.q + (2.385080)*sailStates.r + (0.001590)*sailStates.de;
	Cm = (2.406756)*sailStates.alpha + (8.752960)*sailStates.beta + (11.521887)*sailStates.p + (-164.145981)*sailStates.q + (-7.659843)*sailStates.r + (-0.068191)*sailStates.de;
	Cn = (-2.144006)*sailStates.alpha + (0.219778)*sailStates.beta + (-0.827053)*sailStates.p + (-8.927484)*sailStates.q + (-0.191368)*sailStates.r + (-0.004200)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end