function [aeroForces] = paramSpace_2_2_1_3_2_2_1(sailStates,airStates)

	CL = (4.007652)*sailStates.alpha + (-0.032446)*sailStates.beta + (-2.306096)*sailStates.p + (32.885361)*sailStates.q + (-0.311841)*sailStates.r + (0.010873)*sailStates.de;
	CD = 0.043320;
	CY = (0.001280)*sailStates.alpha + (-0.024946)*sailStates.beta + (-0.087408)*sailStates.p + (-0.065300)*sailStates.q + (-0.005722)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.144392)*sailStates.alpha + (0.039909)*sailStates.beta + (-1.011608)*sailStates.p + (8.016996)*sailStates.q + (-0.237481)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.531022)*sailStates.alpha + (0.147607)*sailStates.beta + (7.883159)*sailStates.p + (-130.047943)*sailStates.q + (1.088035)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.009827)*sailStates.alpha + (0.002901)*sailStates.beta + (0.126037)*sailStates.p + (-0.219052)*sailStates.q + (-0.003239)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end