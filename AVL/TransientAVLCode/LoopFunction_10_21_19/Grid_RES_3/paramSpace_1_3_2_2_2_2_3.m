function [aeroForces] = paramSpace_1_3_2_2_2_2_3(sailStates,airStates)

	CL = (3.791704)*sailStates.alpha + (0.179369)*sailStates.beta + (-2.876666)*sailStates.p + (38.296394)*sailStates.q + (-1.013732)*sailStates.r + (0.010802)*sailStates.de;
	CD = 0.065550;
	CY = (-0.007110)*sailStates.alpha + (-0.024156)*sailStates.beta + (-0.239730)*sailStates.p + (0.267957)*sailStates.q + (-0.042271)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.262629)*sailStates.alpha + (0.169042)*sailStates.beta + (-1.444903)*sailStates.p + (12.350326)*sailStates.q + (-0.706732)*sailStates.r + (0.000734)*sailStates.de;
	Cm = (-13.494682)*sailStates.alpha + (-0.642736)*sailStates.beta + (9.532725)*sailStates.p + (-145.513718)*sailStates.q + (3.407882)*sailStates.r + (-0.068581)*sailStates.de;
	Cn = (0.226997)*sailStates.alpha + (0.021491)*sailStates.beta + (0.311757)*sailStates.p + (-0.768986)*sailStates.q + (-0.024721)*sailStates.r + (-0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end