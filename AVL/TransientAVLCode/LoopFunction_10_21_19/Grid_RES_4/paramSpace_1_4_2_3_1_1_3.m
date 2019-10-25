function [aeroForces] = paramSpace_1_4_2_3_1_1_3(sailStates,airStates)

	CL = (3.939600)*sailStates.alpha + (0.364596)*sailStates.beta + (-2.775922)*sailStates.p + (39.423328)*sailStates.q + (-1.620203)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.125300;
	CY = (-0.092973)*sailStates.alpha + (-0.025755)*sailStates.beta + (-0.483414)*sailStates.p + (-0.294836)*sailStates.q + (-0.096147)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.194042)*sailStates.alpha + (0.357497)*sailStates.beta + (-1.337414)*sailStates.p + (11.809738)*sailStates.q + (-1.267540)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-12.286787)*sailStates.alpha + (-1.377246)*sailStates.beta + (8.649011)*sailStates.p + (-141.543854)*sailStates.q + (5.418916)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.268447)*sailStates.alpha + (0.052353)*sailStates.beta + (0.875431)*sailStates.p + (-2.828023)*sailStates.q + (-0.025132)*sailStates.r + (0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end