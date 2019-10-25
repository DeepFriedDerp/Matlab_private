function [aeroForces] = paramSpace_2_1_1_3_3_3_3(sailStates,airStates)

	CL = (4.029602)*sailStates.alpha + (0.028148)*sailStates.beta + (-2.784925)*sailStates.p + (36.082703)*sailStates.q + (0.143708)*sailStates.r + (0.010798)*sailStates.de;
	CD = -0.080620;
	CY = (0.082050)*sailStates.alpha + (-0.025566)*sailStates.beta + (0.119815)*sailStates.p + (0.563442)*sailStates.q + (0.007794)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.394619)*sailStates.alpha + (-0.074824)*sailStates.beta + (-1.451573)*sailStates.p + (12.092745)*sailStates.q + (0.210098)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.439179)*sailStates.alpha + (-0.063249)*sailStates.beta + (9.641328)*sailStates.p + (-143.062866)*sailStates.q + (-0.462169)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.003949)*sailStates.alpha + (-0.006044)*sailStates.beta + (-0.388329)*sailStates.p + (1.801565)*sailStates.q + (-0.005605)*sailStates.r + (-0.000106)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end