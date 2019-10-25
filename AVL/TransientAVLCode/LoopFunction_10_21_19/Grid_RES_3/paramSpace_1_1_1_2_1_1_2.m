function [aeroForces] = paramSpace_1_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.218577)*sailStates.alpha + (-0.373699)*sailStates.beta + (-2.573949)*sailStates.p + (38.156757)*sailStates.q + (-1.710342)*sailStates.r + (0.011139)*sailStates.de;
	CD = -0.364160;
	CY = (-0.100832)*sailStates.alpha + (-0.022730)*sailStates.beta + (-0.565775)*sailStates.p + (-0.759371)*sailStates.q + (-0.099689)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.232996)*sailStates.alpha + (0.210742)*sailStates.beta + (-1.242925)*sailStates.p + (11.165633)*sailStates.q + (-1.426513)*sailStates.r + (0.000490)*sailStates.de;
	Cm = (-12.069151)*sailStates.alpha + (1.473363)*sailStates.beta + (7.884738)*sailStates.p + (-135.573257)*sailStates.q + (5.750386)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.130204)*sailStates.alpha + (0.053115)*sailStates.beta + (1.106984)*sailStates.p + (-3.605068)*sailStates.q + (-0.018058)*sailStates.r + (0.000135)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end