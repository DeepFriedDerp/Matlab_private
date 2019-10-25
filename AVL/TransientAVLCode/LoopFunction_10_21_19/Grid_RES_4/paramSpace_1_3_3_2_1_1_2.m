function [aeroForces] = paramSpace_1_3_3_2_1_1_2(sailStates,airStates)

	CL = (4.281218)*sailStates.alpha + (0.135591)*sailStates.beta + (-2.580038)*sailStates.p + (38.735527)*sailStates.q + (-1.811229)*sailStates.r + (0.011397)*sailStates.de;
	CD = -0.363830;
	CY = (-0.102040)*sailStates.alpha + (-0.025754)*sailStates.beta + (-0.562951)*sailStates.p + (-0.756271)*sailStates.q + (-0.112005)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.162350)*sailStates.alpha + (0.350266)*sailStates.beta + (-1.185799)*sailStates.p + (10.618896)*sailStates.q + (-1.452030)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-12.184209)*sailStates.alpha + (-0.498960)*sailStates.beta + (7.766633)*sailStates.p + (-135.926239)*sailStates.q + (6.026249)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.080256)*sailStates.alpha + (0.062457)*sailStates.beta + (1.113547)*sailStates.p + (-3.775454)*sailStates.q + (-0.020391)*sailStates.r + (0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end