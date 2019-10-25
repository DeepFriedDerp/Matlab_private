function [aeroForces] = paramSpace_1_2_3_3_1_3_1(sailStates,airStates)

	CL = (4.105592)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.218932)*sailStates.p + (30.909048)*sailStates.q + (0.006054)*sailStates.r + (0.010325)*sailStates.de;
	CD = -0.154800;
	CY = (-0.104812)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.231478)*sailStates.p + (-0.665001)*sailStates.q + (0.040753)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.144182)*sailStates.alpha + (-0.089207)*sailStates.beta + (-0.961672)*sailStates.p + (7.335648)*sailStates.q + (0.216724)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-15.152506)*sailStates.alpha + (0.000000)*sailStates.beta + (8.038760)*sailStates.p + (-129.097870)*sailStates.q + (0.007810)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.404785)*sailStates.alpha + (-0.015730)*sailStates.beta + (-0.630794)*sailStates.p + (3.671084)*sailStates.q + (-0.043273)*sailStates.r + (0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end