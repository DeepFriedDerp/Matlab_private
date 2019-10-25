function [aeroForces] = paramSpace_1_4_4_2_3_3_2(sailStates,airStates)

	CL = (4.078214)*sailStates.alpha + (-0.036896)*sailStates.beta + (-2.362798)*sailStates.p + (31.463507)*sailStates.q + (-0.137195)*sailStates.r + (0.009892)*sailStates.de;
	CD = -0.253610;
	CY = (0.089777)*sailStates.alpha + (-0.022615)*sailStates.beta + (0.150014)*sailStates.p + (0.756270)*sailStates.q + (0.029921)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.084681)*sailStates.alpha + (-0.097590)*sailStates.beta + (-1.069252)*sailStates.p + (8.322478)*sailStates.q + (0.161708)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-14.917851)*sailStates.alpha + (0.280682)*sailStates.beta + (8.533454)*sailStates.p + (-132.741791)*sailStates.q + (0.479835)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.175183)*sailStates.alpha + (-0.016553)*sailStates.beta + (-0.529718)*sailStates.p + (2.283541)*sailStates.q + (-0.031354)*sailStates.r + (-0.000182)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end