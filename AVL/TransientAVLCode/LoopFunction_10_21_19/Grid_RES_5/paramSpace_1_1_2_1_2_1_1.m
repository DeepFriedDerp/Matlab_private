function [aeroForces] = paramSpace_1_1_2_1_2_1_1(sailStates,airStates)

	CL = (5.167315)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.035614)*sailStates.p + (37.177662)*sailStates.q + (-2.527492)*sailStates.r + (0.011230)*sailStates.de;
	CD = -1.017060;
	CY = (0.281412)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.942909)*sailStates.p + (0.476204)*sailStates.q + (-0.235111)*sailStates.r + (0.000099)*sailStates.de;

	Cl = (1.573308)*sailStates.alpha + (0.452741)*sailStates.beta + (-0.758172)*sailStates.p + (7.652874)*sailStates.q + (-2.054164)*sailStates.r + (-0.000383)*sailStates.de;
	Cm = (-10.694551)*sailStates.alpha + (0.000000)*sailStates.beta + (4.845576)*sailStates.p + (-118.206032)*sailStates.q + (8.266474)*sailStates.r + (-0.064943)*sailStates.de;
	Cn = (-1.035621)*sailStates.alpha + (0.112881)*sailStates.beta + (2.009945)*sailStates.p + (-8.905115)*sailStates.q + (0.036087)*sailStates.r + (-0.000268)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end