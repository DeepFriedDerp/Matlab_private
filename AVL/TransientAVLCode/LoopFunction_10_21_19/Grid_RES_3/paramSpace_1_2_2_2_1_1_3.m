function [aeroForces] = paramSpace_1_2_2_2_1_1_3(sailStates,airStates)

	CL = (4.212167)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.982611)*sailStates.p + (41.629765)*sailStates.q + (-1.843941)*sailStates.r + (0.011596)*sailStates.de;
	CD = -0.369940;
	CY = (-0.167338)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.590516)*sailStates.p + (-0.491415)*sailStates.q + (-0.104124)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.301623)*sailStates.alpha + (0.314860)*sailStates.beta + (-1.529455)*sailStates.p + (13.758954)*sailStates.q + (-1.505615)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-12.245928)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.225166)*sailStates.p + (-147.390610)*sailStates.q + (6.167831)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.494628)*sailStates.alpha + (0.055518)*sailStates.beta + (1.119562)*sailStates.p + (-3.758255)*sailStates.q + (-0.020519)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end