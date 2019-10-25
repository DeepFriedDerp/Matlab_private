function [aeroForces] = paramSpace_3_1_2_3_1_2_3(sailStates,airStates)

	CL = (4.000390)*sailStates.alpha + (0.081062)*sailStates.beta + (-2.802481)*sailStates.p + (36.830524)*sailStates.q + (0.490719)*sailStates.r + (0.011015)*sailStates.de;
	CD = 0.019690;
	CY = (-0.053181)*sailStates.alpha + (-0.025328)*sailStates.beta + (0.158668)*sailStates.p + (-0.563442)*sailStates.q + (-0.010380)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.423397)*sailStates.alpha + (-0.022903)*sailStates.beta + (-1.457222)*sailStates.p + (12.297414)*sailStates.q + (0.352316)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.406556)*sailStates.alpha + (-0.259736)*sailStates.beta + (9.503272)*sailStates.p + (-143.062866)*sailStates.q + (-1.644157)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.029875)*sailStates.alpha + (0.003885)*sailStates.beta + (-0.259894)*sailStates.p + (1.321076)*sailStates.q + (0.000141)*sailStates.r + (0.000191)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end