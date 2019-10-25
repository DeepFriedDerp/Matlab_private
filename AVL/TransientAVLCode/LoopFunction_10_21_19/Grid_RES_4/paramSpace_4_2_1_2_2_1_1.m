function [aeroForces] = paramSpace_4_2_1_2_2_1_1(sailStates,airStates)

	CL = (4.179658)*sailStates.alpha + (-0.027958)*sailStates.beta + (-2.016410)*sailStates.p + (28.304708)*sailStates.q + (-0.204058)*sailStates.r + (0.009873)*sailStates.de;
	CD = -0.356520;
	CY = (0.089624)*sailStates.alpha + (-0.024687)*sailStates.beta + (-0.316388)*sailStates.p + (0.301044)*sailStates.q + (0.062901)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.061191)*sailStates.alpha + (0.140324)*sailStates.beta + (-0.836890)*sailStates.p + (6.088051)*sailStates.q + (-0.430420)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-15.333916)*sailStates.alpha + (0.145652)*sailStates.beta + (7.602514)*sailStates.p + (-123.990753)*sailStates.q + (0.633779)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.524086)*sailStates.alpha + (-0.031414)*sailStates.beta + (0.830056)*sailStates.p + (-4.235832)*sailStates.q + (-0.046665)*sailStates.r + (-0.000140)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end