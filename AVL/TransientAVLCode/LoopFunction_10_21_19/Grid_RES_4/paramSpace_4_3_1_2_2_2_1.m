function [aeroForces] = paramSpace_4_3_1_2_2_2_1(sailStates,airStates)

	CL = (3.877977)*sailStates.alpha + (-0.051212)*sailStates.beta + (-2.093640)*sailStates.p + (31.907036)*sailStates.q + (0.818552)*sailStates.r + (0.010582)*sailStates.de;
	CD = 0.050080;
	CY = (0.011681)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.152299)*sailStates.p + (0.301044)*sailStates.q + (-0.030327)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.952809)*sailStates.alpha + (-0.104148)*sailStates.beta + (-0.829760)*sailStates.p + (6.642174)*sailStates.q + (0.511845)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-13.841331)*sailStates.alpha + (0.157557)*sailStates.beta + (6.933765)*sailStates.p + (-123.990753)*sailStates.q + (-2.728250)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.013347)*sailStates.alpha + (0.018296)*sailStates.beta + (-0.242616)*sailStates.p + (0.624569)*sailStates.q + (-0.020963)*sailStates.r + (-0.000058)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end