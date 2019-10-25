function [aeroForces] = paramSpace_4_1_1_2_1_3_1(sailStates,airStates)

	CL = (4.738002)*sailStates.alpha + (0.415762)*sailStates.beta + (-2.129654)*sailStates.p + (35.366013)*sailStates.q + (2.027438)*sailStates.r + (0.011120)*sailStates.de;
	CD = -0.620970;
	CY = (-0.190767)*sailStates.alpha + (-0.026093)*sailStates.beta + (0.739672)*sailStates.p + (-0.455226)*sailStates.q + (-0.147081)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.465590)*sailStates.alpha + (-0.219435)*sailStates.beta + (-0.894410)*sailStates.p + (8.349715)*sailStates.q + (1.626845)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-12.386078)*sailStates.alpha + (-1.463545)*sailStates.beta + (5.943629)*sailStates.p + (-121.885399)*sailStates.q + (-6.691401)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.621294)*sailStates.alpha + (0.074050)*sailStates.beta + (-1.547967)*sailStates.p + (6.964058)*sailStates.q + (0.019385)*sailStates.r + (0.000251)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end