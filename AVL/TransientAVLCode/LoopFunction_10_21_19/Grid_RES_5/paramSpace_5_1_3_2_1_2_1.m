function [aeroForces] = paramSpace_5_1_3_2_1_2_1(sailStates,airStates)

	CL = (4.155250)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.323921)*sailStates.p + (32.249180)*sailStates.q + (0.160784)*sailStates.r + (0.010700)*sailStates.de;
	CD = -0.110100;
	CY = (-0.079796)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.219270)*sailStates.p + (-0.493724)*sailStates.q + (0.023029)*sailStates.r + (-0.000106)*sailStates.de;

	Cl = (1.191388)*sailStates.alpha + (-0.089745)*sailStates.beta + (-1.023654)*sailStates.p + (7.912513)*sailStates.q + (0.272689)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-15.065556)*sailStates.alpha + (0.000000)*sailStates.beta + (8.212767)*sailStates.p + (-131.315216)*sailStates.q + (-0.537616)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (0.309513)*sailStates.alpha + (-0.009433)*sailStates.beta + (-0.562744)*sailStates.p + (3.156073)*sailStates.q + (-0.019193)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end