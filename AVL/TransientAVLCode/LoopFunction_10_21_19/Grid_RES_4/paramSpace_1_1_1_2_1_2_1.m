function [aeroForces] = paramSpace_1_1_1_2_1_2_1(sailStates,airStates)

	CL = (3.665278)*sailStates.alpha + (-0.186071)*sailStates.beta + (-2.095266)*sailStates.p + (31.658270)*sailStates.q + (-0.641118)*sailStates.r + (0.010167)*sailStates.de;
	CD = 0.091530;
	CY = (-0.116994)*sailStates.alpha + (-0.021092)*sailStates.beta + (-0.073393)*sailStates.p + (-1.057313)*sailStates.q + (-0.014485)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.002660)*sailStates.alpha + (0.039827)*sailStates.beta + (-0.896816)*sailStates.p + (7.326496)*sailStates.q + (-0.429535)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-13.164636)*sailStates.alpha + (0.770523)*sailStates.beta + (7.103666)*sailStates.p + (-124.043571)*sailStates.q + (2.212953)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.196478)*sailStates.alpha + (0.008794)*sailStates.beta + (0.038932)*sailStates.p + (1.225286)*sailStates.q + (-0.042647)*sailStates.r + (0.000308)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end