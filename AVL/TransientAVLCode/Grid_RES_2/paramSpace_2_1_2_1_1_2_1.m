function [aeroForces] = paramSpace_2_1_2_1_1_2_1(sailStates,airStates)

	CL = (5.795793)*sailStates.alpha + (-1.937720)*sailStates.beta + (-3.670053)*sailStates.p + (50.305355)*sailStates.q + (2.131424)*sailStates.r + (0.012651)*sailStates.de;
	CD = -5.526560;
	CY = (1.925144)*sailStates.alpha + (-0.133159)*sailStates.beta + (0.267028)*sailStates.p + (15.277010)*sailStates.q + (-0.027581)*sailStates.r + (0.003234)*sailStates.de;

	Cl = (-4.780621)*sailStates.alpha + (-1.009527)*sailStates.beta + (-1.858767)*sailStates.p + (16.039343)*sailStates.q + (2.357967)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (2.306135)*sailStates.alpha + (8.722389)*sailStates.beta + (11.551145)*sailStates.p + (-164.266739)*sailStates.q + (-7.550812)*sailStates.r + (-0.068206)*sailStates.de;
	Cn = (-2.137262)*sailStates.alpha + (0.220419)*sailStates.beta + (-0.784466)*sailStates.p + (-9.216044)*sailStates.q + (-0.193473)*sailStates.r + (-0.004240)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end