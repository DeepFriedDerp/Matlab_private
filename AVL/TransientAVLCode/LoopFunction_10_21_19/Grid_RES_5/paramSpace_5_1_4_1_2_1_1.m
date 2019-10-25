function [aeroForces] = paramSpace_5_1_4_1_2_1_1(sailStates,airStates)

	CL = (5.231969)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.083535)*sailStates.p + (33.416161)*sailStates.q + (-1.952065)*sailStates.r + (0.011305)*sailStates.de;
	CD = -0.975460;
	CY = (0.279175)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.825870)*sailStates.p + (0.768921)*sailStates.q + (-0.086721)*sailStates.r + (0.000164)*sailStates.de;

	Cl = (1.520595)*sailStates.alpha + (0.381956)*sailStates.beta + (-0.793447)*sailStates.p + (6.620225)*sailStates.q + (-1.650095)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-13.829836)*sailStates.alpha + (0.000000)*sailStates.beta + (6.342425)*sailStates.p + (-122.164581)*sailStates.q + (6.547060)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-1.033461)*sailStates.alpha + (0.040145)*sailStates.beta + (1.788739)*sailStates.p + (-8.647122)*sailStates.q + (0.022995)*sailStates.r + (-0.000362)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end