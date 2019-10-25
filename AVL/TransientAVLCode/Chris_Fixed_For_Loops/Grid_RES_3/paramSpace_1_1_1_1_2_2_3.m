function [aeroForces] = paramSpace_1_1_1_1_2_2_3(sailStates,airStates)

	CL = (1.202821)*sailStates.alpha + (0.012301)*sailStates.beta + (-5.223453)*sailStates.p + (54.015251)*sailStates.q + (-0.276226)*sailStates.r + (0.011275)*sailStates.de;
	CD = -0.745540;
	CY = (0.507820)*sailStates.alpha + (-0.027653)*sailStates.beta + (0.223353)*sailStates.p + (1.944820)*sailStates.q + (0.039198)*sailStates.r + (0.000435)*sailStates.de;

	Cl = (-0.150675)*sailStates.alpha + (-0.212281)*sailStates.beta + (-3.484331)*sailStates.p + (30.992666)*sailStates.q + (0.046152)*sailStates.r + (0.004345)*sailStates.de;
	Cm = (-2.926541)*sailStates.alpha + (-0.061749)*sailStates.beta + (18.471792)*sailStates.p + (-214.418610)*sailStates.q + (1.029935)*sailStates.r + (-0.078331)*sailStates.de;
	Cn = (-1.647476)*sailStates.alpha + (-0.039084)*sailStates.beta + (-1.170743)*sailStates.p + (6.585452)*sailStates.q + (-0.089869)*sailStates.r + (-0.000401)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end