function [aeroForces] = paramSpace_4_4_3_1_3_3_2(sailStates,airStates)

	CL = (5.447810)*sailStates.alpha + (-0.678328)*sailStates.beta + (-2.679991)*sailStates.p + (42.695667)*sailStates.q + (2.809243)*sailStates.r + (0.012001)*sailStates.de;
	CD = -1.849470;
	CY = (0.238203)*sailStates.alpha + (-0.030256)*sailStates.beta + (0.994713)*sailStates.p + (1.664522)*sailStates.q + (-0.197801)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (1.024368)*sailStates.alpha + (-0.739287)*sailStates.beta + (-1.191217)*sailStates.p + (11.246084)*sailStates.q + (2.413199)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-9.257309)*sailStates.alpha + (2.603757)*sailStates.beta + (7.201850)*sailStates.p + (-136.195908)*sailStates.q + (-9.340440)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.048320)*sailStates.alpha + (0.111315)*sailStates.beta + (-2.116493)*sailStates.p + (7.540530)*sailStates.q + (-0.012037)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end