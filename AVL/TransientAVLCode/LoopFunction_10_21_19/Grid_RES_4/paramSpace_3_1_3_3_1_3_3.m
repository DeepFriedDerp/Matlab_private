function [aeroForces] = paramSpace_3_1_3_3_1_3_3(sailStates,airStates)

	CL = (4.314224)*sailStates.alpha + (0.254814)*sailStates.beta + (-2.819239)*sailStates.p + (37.627926)*sailStates.q + (1.152320)*sailStates.r + (0.011142)*sailStates.de;
	CD = -0.249870;
	CY = (-0.019482)*sailStates.alpha + (-0.025447)*sailStates.beta + (0.481921)*sailStates.p + (-0.563442)*sailStates.q + (-0.031607)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.561938)*sailStates.alpha + (-0.139435)*sailStates.beta + (-1.462476)*sailStates.p + (12.504331)*sailStates.q + (0.986876)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.179009)*sailStates.alpha + (-0.993575)*sailStates.beta + (9.354853)*sailStates.p + (-143.062866)*sailStates.q + (-3.908601)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.084283)*sailStates.alpha + (0.015547)*sailStates.beta + (-0.974267)*sailStates.p + (4.478020)*sailStates.q + (0.005446)*sailStates.r + (0.000240)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end