function [aeroForces] = paramSpace_11_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.177703)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.324285)*sailStates.p + (32.222836)*sailStates.q + (-0.169203)*sailStates.r + (0.010748)*sailStates.de;
	CD = -0.116900;
	CY = (0.081125)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.234106)*sailStates.p + (0.493724)*sailStates.q + (0.024553)*sailStates.r + (0.000106)*sailStates.de;

	Cl = (1.193912)*sailStates.alpha + (0.097161)*sailStates.beta + (-1.023840)*sailStates.p + (7.911298)*sailStates.q + (-0.296429)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-15.177629)*sailStates.alpha + (0.000000)*sailStates.beta + (8.217845)*sailStates.p + (-131.315216)*sailStates.q + (0.585934)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (-0.312440)*sailStates.alpha + (-0.010212)*sailStates.beta + (0.584717)*sailStates.p + (-3.167634)*sailStates.q + (-0.019218)*sailStates.r + (-0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end