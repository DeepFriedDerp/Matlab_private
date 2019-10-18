function [aeroForces] = paramSpace_1_1_2_2_2_1_1(sailStates,airStates)

	CL = (7.014747)*sailStates.alpha + (0.465073)*sailStates.beta + (-2.572322)*sailStates.p + (29.851873)*sailStates.q + (0.390085)*sailStates.r + (0.008803)*sailStates.de;
	CD = -4.137140;
	CY = (1.673436)*sailStates.alpha + (-0.051017)*sailStates.beta + (-0.153791)*sailStates.p + (13.666376)*sailStates.q + (-0.019279)*sailStates.r + (0.002911)*sailStates.de;

	Cl = (-1.224469)*sailStates.alpha + (-0.446925)*sailStates.beta + (-1.449975)*sailStates.p + (12.243712)*sailStates.q + (0.948649)*sailStates.r + (0.000604)*sailStates.de;
	Cm = (-12.751369)*sailStates.alpha + (-2.158287)*sailStates.beta + (9.326920)*sailStates.p + (-138.246552)*sailStates.q + (-1.494489)*sailStates.r + (-0.068418)*sailStates.de;
	Cn = (-1.795601)*sailStates.alpha + (-0.042729)*sailStates.beta + (-0.241948)*sailStates.p + (-8.438195)*sailStates.q + (0.116469)*sailStates.r + (-0.003839)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end