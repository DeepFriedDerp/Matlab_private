function [aeroForces] = paramSpace_3_1_4_2_3_1_2(sailStates,airStates)

	CL = (4.562232)*sailStates.alpha + (-0.162132)*sailStates.beta + (-2.528178)*sailStates.p + (33.477406)*sailStates.q + (-0.866172)*sailStates.r + (0.010588)*sailStates.de;
	CD = -0.502030;
	CY = (0.092263)*sailStates.alpha + (-0.023721)*sailStates.beta + (-0.503909)*sailStates.p + (0.769434)*sailStates.q + (0.033109)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.575579)*sailStates.alpha + (0.163223)*sailStates.beta + (-1.243998)*sailStates.p + (9.985240)*sailStates.q + (-0.842463)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-15.159828)*sailStates.alpha + (0.562966)*sailStates.beta + (8.997558)*sailStates.p + (-136.512222)*sailStates.q + (2.894207)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.334215)*sailStates.alpha + (-0.017980)*sailStates.beta + (1.195404)*sailStates.p + (-6.384284)*sailStates.q + (-0.018137)*sailStates.r + (-0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end