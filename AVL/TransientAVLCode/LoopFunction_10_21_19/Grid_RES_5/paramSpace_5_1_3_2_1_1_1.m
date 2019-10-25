function [aeroForces] = paramSpace_5_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.140416)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.368554)*sailStates.p + (34.302959)*sailStates.q + (-0.915840)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.085980;
	CY = (-0.037390)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.286434)*sailStates.p + (-0.493723)*sailStates.q + (-0.030123)*sailStates.r + (-0.000106)*sailStates.de;

	Cl = (1.136890)*sailStates.alpha + (0.163107)*sailStates.beta + (-1.037772)*sailStates.p + (8.454755)*sailStates.q + (-0.732894)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-14.083165)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.831494)*sailStates.p + (-131.315216)*sailStates.q + (3.089949)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (-0.071216)*sailStates.alpha + (0.017143)*sailStates.beta + (0.575676)*sailStates.p + (-2.003010)*sailStates.q + (-0.005059)*sailStates.r + (0.000090)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end