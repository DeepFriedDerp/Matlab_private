function [aeroForces] = paramSpace_4_4_2_1_1_3_1(sailStates,airStates)

	CL = (7.395954)*sailStates.alpha + (-0.728659)*sailStates.beta + (-1.730173)*sailStates.p + (35.931511)*sailStates.q + (3.310544)*sailStates.r + (0.011665)*sailStates.de;
	CD = -2.987310;
	CY = (-0.686726)*sailStates.alpha + (-0.021700)*sailStates.beta + (1.404251)*sailStates.p + (-1.002336)*sailStates.q + (-0.279287)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (2.228704)*sailStates.alpha + (-0.860487)*sailStates.beta + (-0.430824)*sailStates.p + (4.680283)*sailStates.q + (2.809152)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-10.326300)*sailStates.alpha + (2.705430)*sailStates.beta + (3.318537)*sailStates.p + (-107.565659)*sailStates.q + (-10.908325)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (2.723469)*sailStates.alpha + (0.114890)*sailStates.beta + (-3.130638)*sailStates.p + (14.930443)*sailStates.q + (0.080939)*sailStates.r + (0.000479)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end