function [aeroForces] = paramSpace_1_1_3_1_3_3_2(sailStates,airStates)

	CL = (5.181672)*sailStates.alpha + (0.272575)*sailStates.beta + (-2.290578)*sailStates.p + (28.131281)*sailStates.q + (0.951526)*sailStates.r + (0.009307)*sailStates.de;
	CD = -1.611360;
	CY = (0.185824)*sailStates.alpha + (-0.028629)*sailStates.beta + (0.591877)*sailStates.p + (1.671347)*sailStates.q + (0.104523)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.169772)*sailStates.alpha + (-0.305675)*sailStates.beta + (-1.133993)*sailStates.p + (8.562472)*sailStates.q + (1.157302)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-15.576554)*sailStates.alpha + (-1.179593)*sailStates.beta + (9.072752)*sailStates.p + (-132.498779)*sailStates.q + (-3.153365)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (0.263745)*sailStates.alpha + (-0.068494)*sailStates.beta + (-1.555714)*sailStates.p + (6.284287)*sailStates.q + (-0.035548)*sailStates.r + (-0.000354)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end