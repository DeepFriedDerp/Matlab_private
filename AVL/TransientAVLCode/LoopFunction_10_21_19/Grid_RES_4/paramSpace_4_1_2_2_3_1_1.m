function [aeroForces] = paramSpace_4_1_2_2_3_1_1(sailStates,airStates)

	CL = (4.243063)*sailStates.alpha + (-0.091550)*sailStates.beta + (-2.019251)*sailStates.p + (27.960073)*sailStates.q + (-0.397270)*sailStates.r + (0.009634)*sailStates.de;
	CD = -0.449870;
	CY = (0.192142)*sailStates.alpha + (-0.021531)*sailStates.beta + (-0.423843)*sailStates.p + (1.057312)*sailStates.q + (0.084270)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (1.238608)*sailStates.alpha + (0.139479)*sailStates.beta + (-0.873024)*sailStates.p + (6.370960)*sailStates.q + (-0.564967)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-15.331459)*sailStates.alpha + (0.398164)*sailStates.beta + (7.790338)*sailStates.p + (-124.043571)*sailStates.q + (1.239178)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (-0.705251)*sailStates.alpha + (-0.044112)*sailStates.beta + (1.070530)*sailStates.p + (-6.029090)*sailStates.q + (-0.066013)*sailStates.r + (-0.000376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end