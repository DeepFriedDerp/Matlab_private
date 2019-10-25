function [aeroForces] = paramSpace_10_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.378076)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.031286)*sailStates.p + (37.574009)*sailStates.q + (-0.594641)*sailStates.r + (0.010961)*sailStates.de;
	CD = -0.512980;
	CY = (-0.207382)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.337210)*sailStates.p + (-1.113124)*sailStates.q + (0.023541)*sailStates.r + (-0.000242)*sailStates.de;

	Cl = (1.375824)*sailStates.alpha + (0.213581)*sailStates.beta + (-1.607163)*sailStates.p + (13.253445)*sailStates.q + (-0.676124)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.482534)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.638479)*sailStates.p + (-150.805054)*sailStates.q + (2.018429)*sailStates.r + (-0.071596)*sailStates.de;
	Cn = (0.221189)*sailStates.alpha + (-0.014935)*sailStates.beta + (0.899329)*sailStates.p + (-3.692612)*sailStates.q + (-0.007703)*sailStates.r + (0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end