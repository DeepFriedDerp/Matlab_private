function [aeroForces] = paramSpace_4_1_4_1_1_3_1(sailStates,airStates)

	CL = (7.369344)*sailStates.alpha + (0.770000)*sailStates.beta + (-1.729211)*sailStates.p + (36.026363)*sailStates.q + (3.324895)*sailStates.r + (0.011497)*sailStates.de;
	CD = -3.013560;
	CY = (-0.697455)*sailStates.alpha + (-0.028288)*sailStates.beta + (1.432427)*sailStates.p + (-1.002336)*sailStates.q + (-0.285035)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (2.396048)*sailStates.alpha + (-0.463771)*sailStates.beta + (-0.524687)*sailStates.p + (5.872670)*sailStates.q + (2.872908)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-9.944911)*sailStates.alpha + (-2.963574)*sailStates.beta + (3.302935)*sailStates.p + (-107.565659)*sailStates.q + (-10.986760)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (2.539990)*sailStates.alpha + (0.149597)*sailStates.beta + (-3.154367)*sailStates.p + (14.716800)*sailStates.q + (0.076551)*sailStates.r + (0.000472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end