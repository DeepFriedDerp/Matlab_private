function [aeroForces] = paramSpace_1_1_2_3_1_1_3(sailStates,airStates)

	CL = (3.939600)*sailStates.alpha + (-0.364596)*sailStates.beta + (-2.775922)*sailStates.p + (39.423328)*sailStates.q + (-1.620203)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.125300;
	CY = (-0.092973)*sailStates.alpha + (-0.023817)*sailStates.beta + (-0.483414)*sailStates.p + (-0.294836)*sailStates.q + (-0.096147)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.313891)*sailStates.alpha + (0.141101)*sailStates.beta + (-1.431787)*sailStates.p + (12.997617)*sailStates.q + (-1.286354)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-12.286787)*sailStates.alpha + (1.377245)*sailStates.beta + (8.649011)*sailStates.p + (-141.543869)*sailStates.q + (5.418915)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.361059)*sailStates.alpha + (0.046824)*sailStates.beta + (0.856659)*sailStates.p + (-2.591740)*sailStates.q + (-0.028875)*sailStates.r + (0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end