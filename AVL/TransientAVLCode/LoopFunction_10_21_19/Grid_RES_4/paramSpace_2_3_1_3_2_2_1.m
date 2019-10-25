function [aeroForces] = paramSpace_2_3_1_3_2_2_1(sailStates,airStates)

	CL = (4.007652)*sailStates.alpha + (0.032446)*sailStates.beta + (-2.306096)*sailStates.p + (32.885361)*sailStates.q + (-0.311841)*sailStates.r + (0.010873)*sailStates.de;
	CD = 0.043320;
	CY = (0.001280)*sailStates.alpha + (-0.025006)*sailStates.beta + (-0.087408)*sailStates.p + (-0.065300)*sailStates.q + (-0.005722)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.090889)*sailStates.alpha + (0.052502)*sailStates.beta + (-0.978962)*sailStates.p + (7.613120)*sailStates.q + (-0.235298)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.531022)*sailStates.alpha + (-0.147607)*sailStates.beta + (7.883159)*sailStates.p + (-130.047943)*sailStates.q + (1.088035)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.002260)*sailStates.alpha + (0.003156)*sailStates.beta + (0.128177)*sailStates.p + (-0.245524)*sailStates.q + (-0.003096)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end