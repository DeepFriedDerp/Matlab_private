function [aeroForces] = paramSpace_3_3_1_2_1_1_3(sailStates,airStates)

	CL = (4.286174)*sailStates.alpha + (0.054535)*sailStates.beta + (-2.935210)*sailStates.p + (37.037411)*sailStates.q + (-0.435877)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.327820;
	CY = (-0.154113)*sailStates.alpha + (-0.024758)*sailStates.beta + (-0.283129)*sailStates.p + (-0.870356)*sailStates.q + (0.018649)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.338186)*sailStates.alpha + (0.185984)*sailStates.beta + (-1.507324)*sailStates.p + (12.326991)*sailStates.q + (-0.545735)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.734185)*sailStates.alpha + (-0.253426)*sailStates.beta + (10.240528)*sailStates.p + (-147.878265)*sailStates.q + (1.524159)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (0.115721)*sailStates.alpha + (-0.011197)*sailStates.beta + (0.733852)*sailStates.p + (-2.881852)*sailStates.q + (-0.006321)*sailStates.r + (0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end