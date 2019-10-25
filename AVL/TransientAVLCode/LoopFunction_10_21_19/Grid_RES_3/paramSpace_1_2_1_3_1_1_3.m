function [aeroForces] = paramSpace_1_2_1_3_1_1_3(sailStates,airStates)

	CL = (4.018111)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.812256)*sailStates.p + (39.432034)*sailStates.q + (-1.515372)*sailStates.r + (0.011188)*sailStates.de;
	CD = -0.123370;
	CY = (-0.094244)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.471399)*sailStates.p + (-0.318252)*sailStates.q + (-0.083090)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.287084)*sailStates.alpha + (0.248392)*sailStates.beta + (-1.403780)*sailStates.p + (12.394900)*sailStates.q + (-1.218857)*sailStates.r + (0.000702)*sailStates.de;
	Cm = (-12.698608)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.892483)*sailStates.p + (-143.204193)*sailStates.q + (5.104962)*sailStates.r + (-0.069165)*sailStates.de;
	Cn = (0.296632)*sailStates.alpha + (0.043798)*sailStates.beta + (0.849876)*sailStates.p + (-2.658951)*sailStates.q + (-0.021704)*sailStates.r + (0.000029)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end