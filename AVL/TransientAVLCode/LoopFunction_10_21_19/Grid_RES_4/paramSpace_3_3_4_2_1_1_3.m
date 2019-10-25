function [aeroForces] = paramSpace_3_3_4_2_1_1_3(sailStates,airStates)

	CL = (4.209162)*sailStates.alpha + (0.032783)*sailStates.beta + (-2.934370)*sailStates.p + (37.087498)*sailStates.q + (-0.407896)*sailStates.r + (0.010949)*sailStates.de;
	CD = -0.277160;
	CY = (-0.146578)*sailStates.alpha + (-0.024574)*sailStates.beta + (-0.237912)*sailStates.p + (-0.870357)*sailStates.q + (0.015502)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.346376)*sailStates.alpha + (0.162243)*sailStates.beta + (-1.506922)*sailStates.p + (12.329250)*sailStates.q + (-0.472819)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.541289)*sailStates.alpha + (-0.114702)*sailStates.beta + (10.229822)*sailStates.p + (-147.878265)*sailStates.q + (1.360810)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.089682)*sailStates.alpha + (-0.009857)*sailStates.beta + (0.667061)*sailStates.p + (-2.847381)*sailStates.q + (-0.006358)*sailStates.r + (0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end