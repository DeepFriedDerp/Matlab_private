function [aeroForces] = paramSpace_2_3_2_1_1_1_1(sailStates,airStates)

	CL = (5.332732)*sailStates.alpha + (0.174175)*sailStates.beta + (-1.756900)*sailStates.p + (30.375053)*sailStates.q + (-2.000855)*sailStates.r + (0.011163)*sailStates.de;
	CD = -1.809570;
	CY = (0.052749)*sailStates.alpha + (-0.025727)*sailStates.beta + (-0.823290)*sailStates.p + (-1.915493)*sailStates.q + (-0.053894)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.508340)*sailStates.alpha + (0.530801)*sailStates.beta + (-0.497910)*sailStates.p + (3.551141)*sailStates.q + (-1.862055)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-11.531788)*sailStates.alpha + (-0.698289)*sailStates.beta + (5.502582)*sailStates.p + (-113.694908)*sailStates.q + (6.817768)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-1.436486)*sailStates.alpha + (0.031815)*sailStates.beta + (1.882923)*sailStates.p + (-7.101323)*sailStates.q + (0.003347)*sailStates.r + (0.000420)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end