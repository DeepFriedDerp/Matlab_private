function [aeroForces] = paramSpace_12_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.198834)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.940149)*sailStates.p + (36.205273)*sailStates.q + (-0.174864)*sailStates.r + (0.010374)*sailStates.de;
	CD = -0.415900;
	CY = (-0.196363)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.219555)*sailStates.p + (-1.241891)*sailStates.q + (0.030724)*sailStates.r + (-0.000268)*sailStates.de;

	Cl = (1.359540)*sailStates.alpha + (0.159582)*sailStates.beta + (-1.564325)*sailStates.p + (12.902752)*sailStates.q + (-0.358152)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-14.497818)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.512579)*sailStates.p + (-149.211060)*sailStates.q + (0.540177)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (0.086335)*sailStates.alpha + (-0.022428)*sailStates.beta + (0.749774)*sailStates.p + (-3.361305)*sailStates.q + (-0.024167)*sailStates.r + (0.000265)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end