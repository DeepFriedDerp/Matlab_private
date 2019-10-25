function [aeroForces] = paramSpace_4_4_4_1_1_3_2(sailStates,airStates)

	CL = (7.743817)*sailStates.alpha + (-0.817745)*sailStates.beta + (-2.581071)*sailStates.p + (43.292103)*sailStates.q + (3.669776)*sailStates.r + (0.011893)*sailStates.de;
	CD = -3.075890;
	CY = (-0.257490)*sailStates.alpha + (-0.018970)*sailStates.beta + (1.537983)*sailStates.p + (-1.664522)*sailStates.q + (-0.306103)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (2.972163)*sailStates.alpha + (-0.933619)*sailStates.beta + (-1.129750)*sailStates.p + (11.421762)*sailStates.q + (3.135880)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-11.784726)*sailStates.alpha + (3.125465)*sailStates.beta + (6.052557)*sailStates.p + (-131.445847)*sailStates.q + (-12.139418)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.530315)*sailStates.alpha + (0.122932)*sailStates.beta + (-3.254085)*sailStates.p + (15.126246)*sailStates.q + (0.068113)*sailStates.r + (0.000710)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end