function [aeroForces] = paramSpace_2_3_2_3_1_2_3(sailStates,airStates)

	CL = (4.007144)*sailStates.alpha + (0.022448)*sailStates.beta + (-2.831772)*sailStates.p + (37.058231)*sailStates.q + (-0.242148)*sailStates.r + (0.011155)*sailStates.de;
	CD = 0.033430;
	CY = (-0.055367)*sailStates.alpha + (-0.025146)*sailStates.beta + (-0.013156)*sailStates.p + (-0.432842)*sailStates.q + (-0.000847)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.315544)*sailStates.alpha + (0.029578)*sailStates.beta + (-1.407354)*sailStates.p + (11.549025)*sailStates.q + (-0.161322)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.536074)*sailStates.alpha + (-0.092253)*sailStates.beta + (9.680813)*sailStates.p + (-144.575439)*sailStates.q + (0.836996)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.130382)*sailStates.alpha + (0.001975)*sailStates.beta + (-0.043691)*sailStates.p + (0.849906)*sailStates.q + (-0.007444)*sailStates.r + (0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end