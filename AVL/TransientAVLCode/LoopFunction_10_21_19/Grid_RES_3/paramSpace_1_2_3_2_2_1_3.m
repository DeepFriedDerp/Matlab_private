function [aeroForces] = paramSpace_1_2_3_2_2_1_3(sailStates,airStates)

	CL = (4.501744)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.963608)*sailStates.p + (41.682720)*sailStates.q + (-2.026800)*sailStates.r + (0.011698)*sailStates.de;
	CD = -0.486720;
	CY = (-0.082013)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.692082)*sailStates.p + (0.267956)*sailStates.q + (-0.122007)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.523319)*sailStates.alpha + (0.335350)*sailStates.beta + (-1.517462)*sailStates.p + (13.791545)*sailStates.q + (-1.633756)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-12.791563)*sailStates.alpha + (0.000000)*sailStates.beta + (9.006223)*sailStates.p + (-146.430145)*sailStates.q + (6.732800)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.424656)*sailStates.alpha + (0.059131)*sailStates.beta + (1.344187)*sailStates.p + (-5.465693)*sailStates.q + (-0.004113)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end