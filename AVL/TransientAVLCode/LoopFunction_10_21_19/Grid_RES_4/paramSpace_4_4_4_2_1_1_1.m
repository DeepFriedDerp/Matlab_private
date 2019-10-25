function [aeroForces] = paramSpace_4_4_4_2_1_1_1(sailStates,airStates)

	CL = (3.860172)*sailStates.alpha + (-0.002016)*sailStates.beta + (-1.973496)*sailStates.p + (28.304985)*sailStates.q + (0.005235)*sailStates.r + (0.009458)*sailStates.de;
	CD = -0.199560;
	CY = (-0.026773)*sailStates.alpha + (-0.023196)*sailStates.beta + (-0.155003)*sailStates.p + (-0.455226)*sailStates.q + (0.030783)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (0.847082)*sailStates.alpha + (0.102161)*sailStates.beta + (-0.750259)*sailStates.p + (5.266345)*sailStates.q + (-0.220063)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-14.206711)*sailStates.alpha + (0.040324)*sailStates.beta + (7.254699)*sailStates.p + (-121.885399)*sailStates.q + (-0.100205)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.301475)*sailStates.alpha + (-0.015666)*sailStates.beta + (0.501736)*sailStates.p + (-2.328931)*sailStates.q + (-0.026488)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end