function [aeroForces] = paramSpace_3_1_4_2_1_2_1(sailStates,airStates)

	CL = (3.961787)*sailStates.alpha + (0.121519)*sailStates.beta + (-2.136876)*sailStates.p + (31.511232)*sailStates.q + (0.491188)*sailStates.r + (0.010642)*sailStates.de;
	CD = 0.024450;
	CY = (-0.117806)*sailStates.alpha + (-0.025711)*sailStates.beta + (0.205232)*sailStates.p + (-0.668511)*sailStates.q + (-0.013522)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.135892)*sailStates.alpha + (-0.044362)*sailStates.beta + (-0.914150)*sailStates.p + (7.282114)*sailStates.q + (0.386404)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.231808)*sailStates.alpha + (-0.523974)*sailStates.beta + (7.254441)*sailStates.p + (-124.743294)*sailStates.q + (-1.685095)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.195554)*sailStates.alpha + (0.005973)*sailStates.beta + (-0.374020)*sailStates.p + (1.909040)*sailStates.q + (0.002953)*sailStates.r + (0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end