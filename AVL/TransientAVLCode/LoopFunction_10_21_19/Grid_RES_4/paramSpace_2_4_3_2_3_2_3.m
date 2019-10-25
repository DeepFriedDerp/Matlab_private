function [aeroForces] = paramSpace_2_4_3_2_3_2_3(sailStates,airStates)

	CL = (3.988045)*sailStates.alpha + (0.093412)*sailStates.beta + (-2.941724)*sailStates.p + (37.995701)*sailStates.q + (-0.580107)*sailStates.r + (0.011087)*sailStates.de;
	CD = 0.010360;
	CY = (0.074157)*sailStates.alpha + (-0.023949)*sailStates.beta + (-0.208271)*sailStates.p + (0.870359)*sailStates.q + (-0.013620)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.343074)*sailStates.alpha + (0.106664)*sailStates.beta + (-1.473799)*sailStates.p + (12.169774)*sailStates.q + (-0.418998)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.305477)*sailStates.alpha + (-0.301738)*sailStates.beta + (9.946107)*sailStates.p + (-146.834106)*sailStates.q + (1.942437)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.018836)*sailStates.alpha + (0.003872)*sailStates.beta + (0.360552)*sailStates.p + (-2.018965)*sailStates.q + (0.002423)*sailStates.r + (-0.000288)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end