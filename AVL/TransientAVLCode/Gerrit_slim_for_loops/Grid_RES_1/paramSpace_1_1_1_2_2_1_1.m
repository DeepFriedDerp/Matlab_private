function [aeroForces] = paramSpace_1_1_1_2_2_1_1(sailStates,airStates)

	CL = (5.699076)*sailStates.alpha + (0.264684)*sailStates.beta + (-2.549680)*sailStates.p + (31.199320)*sailStates.q + (0.016514)*sailStates.r + (0.009182)*sailStates.de;
	CD = -2.173940;
	CY = (1.293384)*sailStates.alpha + (-0.049568)*sailStates.beta + (-0.236851)*sailStates.p + (10.594315)*sailStates.q + (-0.031932)*sailStates.r + (0.002255)*sailStates.de;

	Cl = (0.184795)*sailStates.alpha + (-0.308171)*sailStates.beta + (-1.389649)*sailStates.p + (11.784556)*sailStates.q + (0.475263)*sailStates.r + (0.000552)*sailStates.de;
	Cm = (-14.269423)*sailStates.alpha + (-1.210204)*sailStates.beta + (9.015995)*sailStates.p + (-137.153198)*sailStates.q + (-0.157627)*sailStates.r + (-0.068307)*sailStates.de;
	Cn = (-1.241318)*sailStates.alpha + (-0.019548)*sailStates.beta + (0.028306)*sailStates.p + (-7.256485)*sailStates.q + (0.091479)*sailStates.r + (-0.002973)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end