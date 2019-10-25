function [aeroForces] = paramSpace_1_2_2_1_3_3_3(sailStates,airStates)

	CL = (4.893977)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.166501)*sailStates.p + (35.669060)*sailStates.q + (0.628609)*sailStates.r + (0.009769)*sailStates.de;
	CD = -1.505620;
	CY = (0.437427)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.477215)*sailStates.p + (2.260756)*sailStates.q + (0.084146)*sailStates.r + (0.000488)*sailStates.de;

	Cl = (1.308591)*sailStates.alpha + (-0.328788)*sailStates.beta + (-1.804137)*sailStates.p + (14.831408)*sailStates.q + (0.879024)*sailStates.r + (0.001388)*sailStates.de;
	Cm = (-14.301482)*sailStates.alpha + (0.000000)*sailStates.beta + (11.916894)*sailStates.p + (-157.393341)*sailStates.q + (-2.050140)*sailStates.r + (-0.070740)*sailStates.de;
	Cn = (-0.628600)*sailStates.alpha + (-0.057974)*sailStates.beta + (-1.446397)*sailStates.p + (6.016635)*sailStates.q + (-0.043950)*sailStates.r + (-0.000507)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end