function [aeroForces] = paramSpace_2_1_3_3_3_1_3(sailStates,airStates)

	CL = (4.318677)*sailStates.alpha + (-0.233164)*sailStates.beta + (-2.819507)*sailStates.p + (37.611408)*sailStates.q + (-1.143217)*sailStates.r + (0.011172)*sailStates.de;
	CD = -0.245320;
	CY = (0.021092)*sailStates.alpha + (-0.025328)*sailStates.beta + (-0.466998)*sailStates.p + (0.563442)*sailStates.q + (-0.030589)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.559703)*sailStates.alpha + (0.133172)*sailStates.beta + (-1.462608)*sailStates.p + (12.503581)*sailStates.q + (-0.962824)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.243984)*sailStates.alpha + (0.856623)*sailStates.beta + (9.358307)*sailStates.p + (-143.062866)*sailStates.q + (3.855895)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.077004)*sailStates.alpha + (0.014888)*sailStates.beta + (0.952220)*sailStates.p + (-4.466586)*sailStates.q + (0.005536)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end