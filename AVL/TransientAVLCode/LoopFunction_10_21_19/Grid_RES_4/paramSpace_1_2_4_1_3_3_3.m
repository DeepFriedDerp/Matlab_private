function [aeroForces] = paramSpace_1_2_4_1_3_3_3(sailStates,airStates)

	CL = (4.910035)*sailStates.alpha + (0.080683)*sailStates.beta + (-3.114626)*sailStates.p + (34.814854)*sailStates.q + (0.511010)*sailStates.r + (0.009618)*sailStates.de;
	CD = -1.515130;
	CY = (0.438365)*sailStates.alpha + (-0.027209)*sailStates.beta + (0.462566)*sailStates.p + (2.326712)*sailStates.q + (0.092260)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (1.312448)*sailStates.alpha + (-0.315106)*sailStates.beta + (-1.794726)*sailStates.p + (14.831534)*sailStates.q + (0.813968)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-14.662123)*sailStates.alpha + (-0.369432)*sailStates.beta + (11.843067)*sailStates.p + (-156.352325)*sailStates.q + (-1.657624)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (-0.606163)*sailStates.alpha + (-0.066911)*sailStates.beta + (-1.437442)*sailStates.p + (5.942830)*sailStates.q + (-0.053786)*sailStates.r + (-0.000551)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end