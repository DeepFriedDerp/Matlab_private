function [aeroForces] = paramSpace_3_1_3_3_1_1_3(sailStates,airStates)

	CL = (4.057660)*sailStates.alpha + (-0.049535)*sailStates.beta + (-2.785188)*sailStates.p + (36.066181)*sailStates.q + (-0.152723)*sailStates.r + (0.010828)*sailStates.de;
	CD = -0.099790;
	CY = (-0.083660)*sailStates.alpha + (-0.025447)*sailStates.beta + (-0.134738)*sailStates.p + (-0.563442)*sailStates.q + (0.008811)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.393314)*sailStates.alpha + (0.081097)*sailStates.beta + (-1.451704)*sailStates.p + (12.091995)*sailStates.q + (-0.234137)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.504154)*sailStates.alpha + (0.200200)*sailStates.beta + (9.644782)*sailStates.p + (-143.062866)*sailStates.q + (0.514875)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.003211)*sailStates.alpha + (-0.006560)*sailStates.beta + (0.410389)*sailStates.p + (-1.812999)*sailStates.q + (-0.005307)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end