function [aeroForces] = paramSpace_3_4_4_2_1_2_1(sailStates,airStates)

	CL = (3.961787)*sailStates.alpha + (-0.121519)*sailStates.beta + (-2.136876)*sailStates.p + (31.511236)*sailStates.q + (0.491188)*sailStates.r + (0.010642)*sailStates.de;
	CD = 0.024450;
	CY = (-0.117806)*sailStates.alpha + (-0.023861)*sailStates.beta + (0.205232)*sailStates.p + (-0.668511)*sailStates.q + (-0.013522)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.971157)*sailStates.alpha + (-0.103869)*sailStates.beta + (-0.816463)*sailStates.p + (6.073551)*sailStates.q + (0.379874)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.231809)*sailStates.alpha + (0.523974)*sailStates.beta + (7.254440)*sailStates.p + (-124.743294)*sailStates.q + (-1.685095)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.226171)*sailStates.alpha + (0.003743)*sailStates.beta + (-0.380423)*sailStates.p + (1.988253)*sailStates.q + (0.003381)*sailStates.r + (0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end