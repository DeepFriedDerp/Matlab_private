function [aeroForces] = paramSpace_2_1_2_1_2_1_1(sailStates,airStates)

	CL = (4.751437)*sailStates.alpha + (-0.129740)*sailStates.beta + (-1.976139)*sailStates.p + (27.696329)*sailStates.q + (-1.003459)*sailStates.r + (0.009929)*sailStates.de;
	CD = -0.820450;
	CY = (0.276145)*sailStates.alpha + (-0.022990)*sailStates.beta + (-0.634487)*sailStates.p + (1.226115)*sailStates.q + (0.083619)*sailStates.r + (0.000260)*sailStates.de;

	Cl = (1.380623)*sailStates.alpha + (0.220724)*sailStates.beta + (-0.798857)*sailStates.p + (5.489377)*sailStates.q + (-1.034399)*sailStates.r + (-0.000190)*sailStates.de;
	Cm = (-15.739267)*sailStates.alpha + (0.474529)*sailStates.beta + (7.636128)*sailStates.p + (-122.915756)*sailStates.q + (3.310297)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (-1.011894)*sailStates.alpha + (-0.040751)*sailStates.beta + (1.490267)*sailStates.p + (-7.977799)*sailStates.q + (-0.046378)*sailStates.r + (-0.000471)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end