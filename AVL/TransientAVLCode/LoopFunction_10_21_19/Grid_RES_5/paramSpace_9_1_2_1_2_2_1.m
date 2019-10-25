function [aeroForces] = paramSpace_9_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.498293)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.088152)*sailStates.p + (31.629599)*sailStates.q + (1.162429)*sailStates.r + (0.011036)*sailStates.de;
	CD = -0.576170;
	CY = (0.033327)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.469997)*sailStates.p + (1.046668)*sailStates.q + (-0.016449)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (0.927086)*sailStates.alpha + (-0.277369)*sailStates.beta + (-0.804160)*sailStates.p + (6.124986)*sailStates.q + (1.070705)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-13.851752)*sailStates.alpha + (0.000000)*sailStates.beta + (7.012727)*sailStates.p + (-123.745377)*sailStates.q + (-3.955289)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (0.491654)*sailStates.alpha + (0.009686)*sailStates.beta + (-1.070924)*sailStates.p + (4.093058)*sailStates.q + (0.001030)*sailStates.r + (-0.000214)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end