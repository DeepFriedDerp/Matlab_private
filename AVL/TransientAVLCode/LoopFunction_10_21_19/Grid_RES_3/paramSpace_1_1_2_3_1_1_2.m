function [aeroForces] = paramSpace_1_1_2_3_1_1_2(sailStates,airStates)

	CL = (4.052754)*sailStates.alpha + (-0.282980)*sailStates.beta + (-2.543367)*sailStates.p + (37.005245)*sailStates.q + (-1.407448)*sailStates.r + (0.011018)*sailStates.de;
	CD = -0.133990;
	CY = (-0.064111)*sailStates.alpha + (-0.023592)*sailStates.beta + (-0.422829)*sailStates.p + (-0.491626)*sailStates.q + (-0.074556)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.252132)*sailStates.alpha + (0.146967)*sailStates.beta + (-1.231236)*sailStates.p + (10.876249)*sailStates.q + (-1.116821)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-12.877048)*sailStates.alpha + (1.057499)*sailStates.beta + (8.025088)*sailStates.p + (-135.234573)*sailStates.q + (4.715806)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.123185)*sailStates.alpha + (0.038684)*sailStates.beta + (0.790242)*sailStates.p + (-2.500732)*sailStates.q + (-0.019304)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end