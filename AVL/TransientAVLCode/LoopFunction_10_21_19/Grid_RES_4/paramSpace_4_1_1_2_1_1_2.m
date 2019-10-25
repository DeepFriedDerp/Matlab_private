function [aeroForces] = paramSpace_4_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.078214)*sailStates.alpha + (-0.036896)*sailStates.beta + (-2.362798)*sailStates.p + (31.463507)*sailStates.q + (0.137195)*sailStates.r + (0.009892)*sailStates.de;
	CD = -0.253610;
	CY = (-0.089778)*sailStates.alpha + (-0.026957)*sailStates.beta + (-0.150014)*sailStates.p + (-0.756270)*sailStates.q + (0.029921)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.236606)*sailStates.alpha + (0.114142)*sailStates.beta + (-1.163658)*sailStates.p + (9.510358)*sailStates.q + (-0.143057)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-14.917851)*sailStates.alpha + (0.280682)*sailStates.beta + (8.533455)*sailStates.p + (-132.741776)*sailStates.q + (-0.479834)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.176892)*sailStates.alpha + (-0.025563)*sailStates.beta + (0.548497)*sailStates.p + (-2.519825)*sailStates.q + (-0.035064)*sailStates.r + (0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end