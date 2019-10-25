function [aeroForces] = paramSpace_4_2_1_3_2_1_1(sailStates,airStates)

	CL = (3.998789)*sailStates.alpha + (0.002516)*sailStates.beta + (-2.180518)*sailStates.p + (30.743343)*sailStates.q + (0.212034)*sailStates.r + (0.010186)*sailStates.de;
	CD = -0.100990;
	CY = (0.038355)*sailStates.alpha + (-0.024789)*sailStates.beta + (-0.133922)*sailStates.p + (0.194782)*sailStates.q + (0.026618)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.103896)*sailStates.alpha + (0.062912)*sailStates.beta + (-0.957796)*sailStates.p + (7.505265)*sailStates.q + (-0.050362)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-14.882101)*sailStates.alpha + (0.030193)*sailStates.beta + (7.808222)*sailStates.p + (-127.822792)*sailStates.q + (-0.735253)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.297003)*sailStates.alpha + (-0.013665)*sailStates.beta + (0.440371)*sailStates.p + (-2.518197)*sailStates.q + (-0.039970)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end