function [aeroForces] = paramSpace_4_2_1_2_2_2_1(sailStates,airStates)

	CL = (3.877977)*sailStates.alpha + (0.051212)*sailStates.beta + (-2.093640)*sailStates.p + (31.907036)*sailStates.q + (0.818552)*sailStates.r + (0.010582)*sailStates.de;
	CD = 0.050080;
	CY = (0.011681)*sailStates.alpha + (-0.024687)*sailStates.beta + (0.152299)*sailStates.p + (0.301044)*sailStates.q + (-0.030327)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.005327)*sailStates.alpha + (-0.071528)*sailStates.beta + (-0.861309)*sailStates.p + (7.039138)*sailStates.q + (0.518077)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-13.841331)*sailStates.alpha + (-0.157557)*sailStates.beta + (6.933765)*sailStates.p + (-123.990753)*sailStates.q + (-2.728249)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (-0.005090)*sailStates.alpha + (0.016648)*sailStates.beta + (-0.236340)*sailStates.p + (0.545608)*sailStates.q + (-0.022202)*sailStates.r + (-0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end