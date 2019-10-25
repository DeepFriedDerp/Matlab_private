function [aeroForces] = paramSpace_1_4_4_1_2_2_1(sailStates,airStates)

	CL = (3.587050)*sailStates.alpha + (0.126543)*sailStates.beta + (-1.609771)*sailStates.p + (27.677704)*sailStates.q + (-0.625226)*sailStates.r + (0.010218)*sailStates.de;
	CD = 0.043000;
	CY = (-0.046559)*sailStates.alpha + (-0.026687)*sailStates.beta + (-0.093569)*sailStates.p + (-0.662188)*sailStates.q + (-0.018683)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (0.465342)*sailStates.alpha + (0.102360)*sailStates.beta + (-0.407887)*sailStates.p + (2.497068)*sailStates.q + (-0.348283)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-12.896893)*sailStates.alpha + (-0.382879)*sailStates.beta + (5.369124)*sailStates.p + (-109.940704)*sailStates.q + (2.088782)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (-0.130570)*sailStates.alpha + (0.015812)*sailStates.beta + (0.203188)*sailStates.p + (-0.603412)*sailStates.q + (-0.012896)*sailStates.r + (0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end