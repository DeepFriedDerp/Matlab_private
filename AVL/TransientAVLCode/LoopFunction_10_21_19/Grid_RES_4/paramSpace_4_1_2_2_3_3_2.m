function [aeroForces] = paramSpace_4_1_2_2_3_3_2(sailStates,airStates)

	CL = (4.221460)*sailStates.alpha + (0.404254)*sailStates.beta + (-2.561160)*sailStates.p + (38.467182)*sailStates.q + (1.803753)*sailStates.r + (0.011230)*sailStates.de;
	CD = -0.363910;
	CY = (0.101307)*sailStates.alpha + (-0.022458)*sailStates.beta + (0.561319)*sailStates.p + (0.756268)*sailStates.q + (-0.111680)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.228901)*sailStates.alpha + (-0.189267)*sailStates.beta + (-1.239912)*sailStates.p + (11.335933)*sailStates.q + (1.459461)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-11.985593)*sailStates.alpha + (-1.487949)*sailStates.beta + (7.704401)*sailStates.p + (-134.899979)*sailStates.q + (-6.001213)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.151949)*sailStates.alpha + (0.059167)*sailStates.beta + (-1.098758)*sailStates.p + (3.612693)*sailStates.q + (-0.022669)*sailStates.r + (-0.000112)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end