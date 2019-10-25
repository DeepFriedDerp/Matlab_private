function [aeroForces] = paramSpace_2_2_4_2_3_3_3(sailStates,airStates)

	CL = (4.286173)*sailStates.alpha + (0.054535)*sailStates.beta + (-2.935209)*sailStates.p + (37.037411)*sailStates.q + (0.435877)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.327820;
	CY = (0.154113)*sailStates.alpha + (-0.025194)*sailStates.beta + (0.283129)*sailStates.p + (0.870356)*sailStates.q + (0.018649)*sailStates.r + (0.000189)*sailStates.de;

	Cl = (1.384325)*sailStates.alpha + (-0.167272)*sailStates.beta + (-1.539975)*sailStates.p + (12.730874)*sailStates.q + (0.543637)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.734183)*sailStates.alpha + (-0.253425)*sailStates.beta + (10.240528)*sailStates.p + (-147.878265)*sailStates.q + (-1.524159)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.128182)*sailStates.alpha + (-0.011957)*sailStates.beta + (-0.735992)*sailStates.p + (2.908324)*sailStates.q + (-0.006458)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end