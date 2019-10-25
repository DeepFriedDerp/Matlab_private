function [aeroForces] = paramSpace_4_3_1_2_2_1_1(sailStates,airStates)

	CL = (4.179658)*sailStates.alpha + (0.027958)*sailStates.beta + (-2.016410)*sailStates.p + (28.304708)*sailStates.q + (-0.204058)*sailStates.r + (0.009873)*sailStates.de;
	CD = -0.356520;
	CY = (0.089624)*sailStates.alpha + (-0.025265)*sailStates.beta + (-0.316388)*sailStates.p + (0.301044)*sailStates.q + (0.062901)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.004606)*sailStates.alpha + (0.152241)*sailStates.beta + (-0.805341)*sailStates.p + (5.691086)*sailStates.q + (-0.436653)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-15.333916)*sailStates.alpha + (-0.145652)*sailStates.beta + (7.602514)*sailStates.p + (-123.990753)*sailStates.q + (0.633780)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.526092)*sailStates.alpha + (-0.026780)*sailStates.beta + (0.823780)*sailStates.p + (-4.156871)*sailStates.q + (-0.045426)*sailStates.r + (-0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end