function [aeroForces] = paramSpace_4_2_1_3_2_2_1(sailStates,airStates)

	CL = (3.910251)*sailStates.alpha + (0.053707)*sailStates.beta + (-2.230455)*sailStates.p + (33.072617)*sailStates.q + (0.873255)*sailStates.r + (0.010646)*sailStates.de;
	CD = 0.052460;
	CY = (0.005747)*sailStates.alpha + (-0.024789)*sailStates.beta + (0.169132)*sailStates.p + (0.194782)*sailStates.q + (-0.033663)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.095910)*sailStates.alpha + (-0.074072)*sailStates.beta + (-0.973586)*sailStates.p + (8.120240)*sailStates.q + (0.562938)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-13.942375)*sailStates.alpha + (-0.165863)*sailStates.beta + (7.375808)*sailStates.p + (-127.822792)*sailStates.q + (-2.909148)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.043492)*sailStates.alpha + (0.017412)*sailStates.beta + (-0.249163)*sailStates.p + (0.573492)*sailStates.q + (-0.024152)*sailStates.r + (-0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end