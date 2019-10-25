function [aeroForces] = paramSpace_3_3_1_1_2_3_3(sailStates,airStates)

	CL = (6.120409)*sailStates.alpha + (-0.190529)*sailStates.beta + (-3.509843)*sailStates.p + (44.770763)*sailStates.q + (2.656323)*sailStates.r + (0.012092)*sailStates.de;
	CD = -2.312440;
	CY = (0.388834)*sailStates.alpha + (-0.024921)*sailStates.beta + (1.138677)*sailStates.p + (-0.221995)*sailStates.q + (-0.074609)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (2.022945)*sailStates.alpha + (-0.618172)*sailStates.beta + (-1.932988)*sailStates.p + (16.992033)*sailStates.q + (2.364360)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-12.749757)*sailStates.alpha + (0.711729)*sailStates.beta + (11.222214)*sailStates.p + (-161.490479)*sailStates.q + (-8.962028)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (-1.386766)*sailStates.alpha + (0.035800)*sailStates.beta + (-2.453066)*sailStates.p + (10.999300)*sailStates.q + (0.013886)*sailStates.r + (0.000340)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end