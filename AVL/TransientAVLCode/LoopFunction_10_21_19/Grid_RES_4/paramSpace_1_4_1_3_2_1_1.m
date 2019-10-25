function [aeroForces] = paramSpace_1_4_1_3_2_1_1(sailStates,airStates)

	CL = (4.057530)*sailStates.alpha + (0.374466)*sailStates.beta + (-2.259559)*sailStates.p + (35.277992)*sailStates.q + (-1.551406)*sailStates.r + (0.010682)*sailStates.de;
	CD = -0.173050;
	CY = (0.031676)*sailStates.alpha + (-0.025467)*sailStates.beta + (-0.513531)*sailStates.p + (-0.194783)*sailStates.q + (-0.102127)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.078717)*sailStates.alpha + (0.357480)*sailStates.beta + (-0.916598)*sailStates.p + (7.874081)*sailStates.q + (-1.228049)*sailStates.r + (-0.000127)*sailStates.de;
	Cm = (-12.200466)*sailStates.alpha + (-1.471737)*sailStates.beta + (6.853627)*sailStates.p + (-126.796555)*sailStates.q + (5.196456)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.266119)*sailStates.alpha + (0.051537)*sailStates.beta + (1.013724)*sailStates.p + (-3.851229)*sailStates.q + (-0.006692)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end