function [aeroForces] = paramSpace_2_1_4_2_2_2_1(sailStates,airStates)

	CL = (3.930335)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.209151)*sailStates.p + (31.553122)*sailStates.q + (-0.507472)*sailStates.r + (0.010229)*sailStates.de;
	CD = -0.017740;
	CY = (0.028498)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.002168)*sailStates.p + (0.230435)*sailStates.q + (-0.000436)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.079398)*sailStates.alpha + (-0.008048)*sailStates.beta + (-0.967858)*sailStates.p + (7.783031)*sailStates.q + (-0.193655)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-14.581167)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.678898)*sailStates.p + (-128.239044)*sailStates.q + (1.707868)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (0.152322)*sailStates.alpha + (-0.001711)*sailStates.beta + (-0.155769)*sailStates.p + (0.959434)*sailStates.q + (-0.030899)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end