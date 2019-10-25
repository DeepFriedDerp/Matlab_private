function [aeroForces] = paramSpace_3_2_3_3_2_2_1(sailStates,airStates)

	CL = (4.028190)*sailStates.alpha + (0.025301)*sailStates.beta + (-2.306315)*sailStates.p + (32.868851)*sailStates.q + (0.303538)*sailStates.r + (0.010903)*sailStates.de;
	CD = 0.032270;
	CY = (0.000331)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.072506)*sailStates.p + (0.065300)*sailStates.q + (-0.004750)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.144724)*sailStates.alpha + (-0.032592)*sailStates.beta + (-1.011721)*sailStates.p + (8.016233)*sailStates.q + (0.213747)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.599888)*sailStates.alpha + (-0.101959)*sailStates.beta + (7.886306)*sailStates.p + (-130.047943)*sailStates.q + (-1.040008)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (-0.013197)*sailStates.alpha + (0.002433)*sailStates.beta + (-0.104007)*sailStates.p + (0.207412)*sailStates.q + (-0.002879)*sailStates.r + (-0.000016)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end