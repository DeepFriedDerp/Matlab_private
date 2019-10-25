function [aeroForces] = paramSpace_3_1_1_3_2_3_2(sailStates,airStates)

	CL = (4.234884)*sailStates.alpha + (0.188848)*sailStates.beta + (-2.564522)*sailStates.p + (35.459061)*sailStates.q + (0.970399)*sailStates.r + (0.011075)*sailStates.de;
	CD = -0.174400;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.361079)*sailStates.p + (-0.000001)*sailStates.q + (-0.023666)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.377433)*sailStates.alpha + (-0.115586)*sailStates.beta + (-1.253265)*sailStates.p + (10.521435)*sailStates.q + (0.804910)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.272907)*sailStates.alpha + (-0.643262)*sailStates.beta + (8.549959)*sailStates.p + (-136.150452)*sailStates.q + (-3.258178)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.045891)*sailStates.alpha + (0.012273)*sailStates.beta + (-0.757232)*sailStates.p + (3.319126)*sailStates.q + (0.002008)*sailStates.r + (0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end