function [aeroForces] = paramSpace_1_2_1_1_1_2_1(sailStates,airStates)

	CL = (7.137329)*sailStates.alpha + (-0.408116)*sailStates.beta + (-2.542425)*sailStates.p + (30.207636)*sailStates.q + (-0.010030)*sailStates.r + (0.008953)*sailStates.de;
	CD = -3.650660;
	CY = (1.763357)*sailStates.alpha + (-0.000174)*sailStates.beta + (-0.360718)*sailStates.p + (14.397858)*sailStates.q + (-0.045450)*sailStates.r + (0.003064)*sailStates.de;

	Cl = (-0.870315)*sailStates.alpha + (-0.392562)*sailStates.beta + (-1.326102)*sailStates.p + (10.999497)*sailStates.q + (0.625310)*sailStates.r + (0.000278)*sailStates.de;
	Cm = (-14.486549)*sailStates.alpha + (2.004545)*sailStates.beta + (8.975665)*sailStates.p + (-136.797119)*sailStates.q + (-0.185048)*sailStates.r + (-0.068271)*sailStates.de;
	Cn = (-1.752754)*sailStates.alpha + (-0.069636)*sailStates.beta + (0.230437)*sailStates.p + (-11.323325)*sailStates.q + (0.131855)*sailStates.r + (-0.004095)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end