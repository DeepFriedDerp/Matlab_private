function [aeroForces] = paramSpace_2_4_3_3_3_1_3(sailStates,airStates)

	CL = (4.318676)*sailStates.alpha + (0.233164)*sailStates.beta + (-2.819507)*sailStates.p + (37.611404)*sailStates.q + (-1.143217)*sailStates.r + (0.011172)*sailStates.de;
	CD = -0.245320;
	CY = (0.021092)*sailStates.alpha + (-0.024244)*sailStates.beta + (-0.466998)*sailStates.p + (0.563442)*sailStates.q + (-0.030589)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.423984)*sailStates.alpha + (0.283510)*sailStates.beta + (-1.364909)*sailStates.p + (11.295022)*sailStates.q + (-0.956463)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.243984)*sailStates.alpha + (-0.856623)*sailStates.beta + (9.358307)*sailStates.p + (-143.062881)*sailStates.q + (3.855894)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.012862)*sailStates.alpha + (0.012423)*sailStates.beta + (0.958624)*sailStates.p + (-4.545798)*sailStates.q + (0.005953)*sailStates.r + (-0.000252)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end