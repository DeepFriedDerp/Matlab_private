function [aeroForces] = paramSpace_2_3_1_2_1_3_1(sailStates,airStates)

	CL = (4.571800)*sailStates.alpha + (-0.056439)*sailStates.beta + (-2.145564)*sailStates.p + (30.484930)*sailStates.q + (0.917268)*sailStates.r + (0.010568)*sailStates.de;
	CD = -0.507710;
	CY = (-0.191879)*sailStates.alpha + (-0.025379)*sailStates.beta + (0.519640)*sailStates.p + (-0.870358)*sailStates.q + (0.034151)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.263317)*sailStates.alpha + (-0.245297)*sailStates.beta + (-0.859486)*sailStates.p + (6.204654)*sailStates.q + (0.888453)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-15.285187)*sailStates.alpha + (0.195725)*sailStates.beta + (7.721876)*sailStates.p + (-126.510948)*sailStates.q + (-3.067763)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.718555)*sailStates.alpha + (-0.013547)*sailStates.beta + (-1.202275)*sailStates.p + (6.356301)*sailStates.q + (-0.017237)*sailStates.r + (0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end