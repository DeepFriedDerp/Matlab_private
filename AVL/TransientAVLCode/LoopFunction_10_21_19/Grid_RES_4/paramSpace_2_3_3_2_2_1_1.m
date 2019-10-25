function [aeroForces] = paramSpace_2_3_3_2_2_1_1(sailStates,airStates)

	CL = (4.536502)*sailStates.alpha + (0.095884)*sailStates.beta + (-2.190893)*sailStates.p + (32.909805)*sailStates.q + (-1.285796)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.466890;
	CY = (0.075344)*sailStates.alpha + (-0.025009)*sailStates.beta + (-0.528709)*sailStates.p + (-0.100924)*sailStates.q + (-0.034657)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.145395)*sailStates.alpha + (0.295634)*sailStates.beta + (-0.871540)*sailStates.p + (6.854259)*sailStates.q + (-1.116896)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.058581)*sailStates.alpha + (-0.361966)*sailStates.beta + (7.191279)*sailStates.p + (-126.149185)*sailStates.q + (4.350844)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.521696)*sailStates.alpha + (0.017158)*sailStates.beta + (1.150666)*sailStates.p + (-5.077407)*sailStates.q + (0.005946)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end