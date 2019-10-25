function [aeroForces] = paramSpace_2_2_3_2_2_3_2(sailStates,airStates)

	CL = (4.482581)*sailStates.alpha + (0.058947)*sailStates.beta + (-2.540451)*sailStates.p + (33.753056)*sailStates.q + (0.679970)*sailStates.r + (0.010813)*sailStates.de;
	CD = -0.421130;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.408720)*sailStates.p + (-0.000000)*sailStates.q + (0.026789)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.383272)*sailStates.alpha + (-0.189316)*sailStates.beta + (-1.216094)*sailStates.p + (9.669309)*sailStates.q + (0.726403)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-15.188621)*sailStates.alpha + (-0.246985)*sailStates.beta + (8.982481)*sailStates.p + (-137.194580)*sailStates.q + (-2.315490)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.223434)*sailStates.alpha + (-0.014012)*sailStates.beta + (-0.981053)*sailStates.p + (4.651471)*sailStates.q + (-0.011513)*sailStates.r + (0.000077)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end