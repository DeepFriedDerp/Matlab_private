function [aeroForces] = paramSpace_2_2_2_2_3_1_1(sailStates,airStates)

	CL = (4.786727)*sailStates.alpha + (-0.112395)*sailStates.beta + (-2.182941)*sailStates.p + (32.968754)*sailStates.q + (-1.494918)*sailStates.r + (0.011079)*sailStates.de;
	CD = -0.610710;
	CY = (0.197979)*sailStates.alpha + (-0.025238)*sailStates.beta + (-0.667967)*sailStates.p + (0.668511)*sailStates.q + (-0.043804)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.411824)*sailStates.alpha + (0.274636)*sailStates.beta + (-0.899260)*sailStates.p + (7.272344)*sailStates.q + (-1.306820)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.302308)*sailStates.alpha + (0.439250)*sailStates.beta + (7.099898)*sailStates.p + (-125.787453)*sailStates.q + (5.068338)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.698720)*sailStates.alpha + (0.020939)*sailStates.beta + (1.425933)*sailStates.p + (-6.790310)*sailStates.q + (0.011661)*sailStates.r + (-0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end