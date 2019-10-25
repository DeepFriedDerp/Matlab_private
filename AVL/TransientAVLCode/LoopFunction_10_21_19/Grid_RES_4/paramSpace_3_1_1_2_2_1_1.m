function [aeroForces] = paramSpace_3_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.383024)*sailStates.alpha + (-0.205264)*sailStates.beta + (-2.118900)*sailStates.p + (30.212070)*sailStates.q + (-0.742996)*sailStates.r + (0.010492)*sailStates.de;
	CD = -0.436650;
	CY = (0.085708)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.440252)*sailStates.p + (0.100923)*sailStates.q + (0.028845)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.193103)*sailStates.alpha + (0.165005)*sailStates.beta + (-0.910972)*sailStates.p + (6.947546)*sailStates.q + (-0.792353)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.899900)*sailStates.alpha + (0.899650)*sailStates.beta + (7.576045)*sailStates.p + (-125.105080)*sailStates.q + (2.544917)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.507380)*sailStates.alpha + (-0.015808)*sailStates.beta + (1.017498)*sailStates.p + (-4.718095)*sailStates.q + (-0.011145)*sailStates.r + (-0.000095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end