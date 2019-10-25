function [aeroForces] = paramSpace_4_4_2_3_2_1_3(sailStates,airStates)

	CL = (3.878652)*sailStates.alpha + (-0.054365)*sailStates.beta + (-2.662422)*sailStates.p + (34.796963)*sailStates.q + (0.414052)*sailStates.r + (0.010183)*sailStates.de;
	CD = -0.067580;
	CY = (-0.030084)*sailStates.alpha + (-0.024186)*sailStates.beta + (-0.059315)*sailStates.p + (-0.194783)*sailStates.q + (0.011805)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.210591)*sailStates.alpha + (0.009712)*sailStates.beta + (-1.297206)*sailStates.p + (10.603098)*sailStates.q + (0.120327)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-14.298059)*sailStates.alpha + (0.128972)*sailStates.beta + (9.356349)*sailStates.p + (-140.845245)*sailStates.q + (-1.424776)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (-0.184361)*sailStates.alpha + (-0.001362)*sailStates.beta + (0.361249)*sailStates.p + (-2.252363)*sailStates.q + (-0.044522)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end