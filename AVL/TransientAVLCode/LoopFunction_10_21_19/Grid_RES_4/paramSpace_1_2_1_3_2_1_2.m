function [aeroForces] = paramSpace_1_2_1_3_2_1_2(sailStates,airStates)

	CL = (4.132922)*sailStates.alpha + (-0.130434)*sailStates.beta + (-2.529002)*sailStates.p + (37.684280)*sailStates.q + (-1.660455)*sailStates.r + (0.010965)*sailStates.de;
	CD = -0.173020;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.546433)*sailStates.p + (-0.000000)*sailStates.q + (-0.108692)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.320166)*sailStates.alpha + (0.236691)*sailStates.beta + (-1.194124)*sailStates.p + (10.723610)*sailStates.q + (-1.328989)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-12.493769)*sailStates.alpha + (0.510131)*sailStates.beta + (7.724504)*sailStates.p + (-134.847153)*sailStates.q + (5.561289)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.036481)*sailStates.alpha + (0.054179)*sailStates.beta + (1.027611)*sailStates.p + (-3.749852)*sailStates.q + (-0.013001)*sailStates.r + (-0.000069)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end