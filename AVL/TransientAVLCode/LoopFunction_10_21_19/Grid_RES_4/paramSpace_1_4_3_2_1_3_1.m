function [aeroForces] = paramSpace_1_4_3_2_1_3_1(sailStates,airStates)

	CL = (4.243063)*sailStates.alpha + (-0.091550)*sailStates.beta + (-2.019251)*sailStates.p + (27.960073)*sailStates.q + (0.397270)*sailStates.r + (0.009634)*sailStates.de;
	CD = -0.449870;
	CY = (-0.192142)*sailStates.alpha + (-0.028041)*sailStates.beta + (0.423843)*sailStates.p + (-1.057312)*sailStates.q + (0.084270)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.071097)*sailStates.alpha + (-0.201099)*sailStates.beta + (-0.778635)*sailStates.p + (5.183078)*sailStates.q + (0.583699)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-15.331459)*sailStates.alpha + (0.398164)*sailStates.beta + (7.790338)*sailStates.p + (-124.043571)*sailStates.q + (-1.239179)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.718042)*sailStates.alpha + (-0.023633)*sailStates.beta + (-1.051755)*sailStates.p + (5.792806)*sailStates.q + (-0.062287)*sailStates.r + (0.000376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end