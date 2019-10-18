function [aeroForces] = paramSpace_2_1_2_2_1_1_2(sailStates,airStates)

	CL = (5.711442)*sailStates.alpha + (-1.927847)*sailStates.beta + (-3.646395)*sailStates.p + (50.060951)*sailStates.q + (2.155216)*sailStates.r + (0.012601)*sailStates.de;
	CD = -5.380660;
	CY = (1.885784)*sailStates.alpha + (-0.130072)*sailStates.beta + (0.295961)*sailStates.p + (14.844438)*sailStates.q + (-0.031604)*sailStates.r + (0.003141)*sailStates.de;

	Cl = (-4.609150)*sailStates.alpha + (-1.009475)*sailStates.beta + (-1.843334)*sailStates.p + (15.919445)*sailStates.q + (2.367679)*sailStates.r + (0.001562)*sailStates.de;
	Cm = (2.051944)*sailStates.alpha + (8.668745)*sailStates.beta + (11.454665)*sailStates.p + (-163.562851)*sailStates.q + (-7.623837)*sailStates.r + (-0.068121)*sailStates.de;
	Cn = (-2.105159)*sailStates.alpha + (0.216216)*sailStates.beta + (-0.838295)*sailStates.p + (-8.642235)*sailStates.q + (-0.187589)*sailStates.r + (-0.004115)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end