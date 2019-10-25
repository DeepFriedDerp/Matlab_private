function [aeroForces] = paramSpace_1_3_3_1_3_3_2(sailStates,airStates)

	CL = (5.181672)*sailStates.alpha + (-0.272575)*sailStates.beta + (-2.290578)*sailStates.p + (28.131281)*sailStates.q + (0.951526)*sailStates.r + (0.009307)*sailStates.de;
	CD = -1.611360;
	CY = (0.185824)*sailStates.alpha + (-0.021033)*sailStates.beta + (0.591877)*sailStates.p + (1.671347)*sailStates.q + (0.104523)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.022130)*sailStates.alpha + (-0.417075)*sailStates.beta + (-1.049340)*sailStates.p + (7.501604)*sailStates.q + (1.172127)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-15.576554)*sailStates.alpha + (1.179593)*sailStates.beta + (9.072752)*sailStates.p + (-132.498779)*sailStates.q + (-3.153364)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (0.324525)*sailStates.alpha + (-0.058946)*sailStates.beta + (-1.540788)*sailStates.p + (6.097228)*sailStates.q + (-0.032934)*sailStates.r + (-0.000354)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end