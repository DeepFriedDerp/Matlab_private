function [aeroForces] = paramSpace_3_3_1_1_2_3_2(sailStates,airStates)

	CL = (6.465494)*sailStates.alpha + (-0.185412)*sailStates.beta + (-2.625017)*sailStates.p + (37.603340)*sailStates.q + (2.542304)*sailStates.r + (0.011622)*sailStates.de;
	CD = -2.294450;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.103141)*sailStates.p + (0.000003)*sailStates.q + (-0.072304)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.890511)*sailStates.alpha + (-0.606308)*sailStates.beta + (-1.210237)*sailStates.p + (10.285609)*sailStates.q + (2.270711)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-13.774689)*sailStates.alpha + (0.694887)*sailStates.beta + (8.267939)*sailStates.p + (-137.194580)*sailStates.q + (-8.586331)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.346760)*sailStates.alpha + (0.035173)*sailStates.beta + (-2.427348)*sailStates.p + (10.939826)*sailStates.q + (0.015280)*sailStates.r + (0.000223)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end