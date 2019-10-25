function [aeroForces] = paramSpace_3_4_4_2_3_1_2(sailStates,airStates)

	CL = (4.562232)*sailStates.alpha + (0.162132)*sailStates.beta + (-2.528178)*sailStates.p + (33.477406)*sailStates.q + (-0.866172)*sailStates.r + (0.010588)*sailStates.de;
	CD = -0.502030;
	CY = (0.092263)*sailStates.alpha + (-0.025851)*sailStates.beta + (-0.503909)*sailStates.p + (0.769434)*sailStates.q + (0.033109)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.423103)*sailStates.alpha + (0.276386)*sailStates.beta + (-1.146310)*sailStates.p + (8.776679)*sailStates.q + (-0.848994)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-15.159828)*sailStates.alpha + (-0.562966)*sailStates.beta + (8.997558)*sailStates.p + (-136.512222)*sailStates.q + (2.894208)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.382124)*sailStates.alpha + (-0.010833)*sailStates.beta + (1.189002)*sailStates.p + (-6.305072)*sailStates.q + (-0.017709)*sailStates.r + (-0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end