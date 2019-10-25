function [aeroForces] = paramSpace_1_1_1_3_2_1_1(sailStates,airStates)

	CL = (4.057530)*sailStates.alpha + (-0.374466)*sailStates.beta + (-2.259559)*sailStates.p + (35.277996)*sailStates.q + (-1.551405)*sailStates.r + (0.010682)*sailStates.de;
	CD = -0.173050;
	CY = (0.031676)*sailStates.alpha + (-0.024106)*sailStates.beta + (-0.513531)*sailStates.p + (-0.194783)*sailStates.q + (-0.102127)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.218937)*sailStates.alpha + (0.162847)*sailStates.beta + (-1.010955)*sailStates.p + (9.061961)*sailStates.q + (-1.246945)*sailStates.r + (0.000127)*sailStates.de;
	Cm = (-12.200467)*sailStates.alpha + (1.471737)*sailStates.beta + (6.853627)*sailStates.p + (-126.796555)*sailStates.q + (5.196456)*sailStates.r + (-0.065982)*sailStates.de;
	Cn = (-0.166447)*sailStates.alpha + (0.051962)*sailStates.beta + (0.994955)*sailStates.p + (-3.614945)*sailStates.q + (-0.010451)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end