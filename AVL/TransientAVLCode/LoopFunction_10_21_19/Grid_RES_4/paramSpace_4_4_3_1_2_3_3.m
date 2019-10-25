function [aeroForces] = paramSpace_4_4_3_1_2_3_3(sailStates,airStates)

	CL = (6.118208)*sailStates.alpha + (-0.784930)*sailStates.beta + (-3.482985)*sailStates.p + (50.234798)*sailStates.q + (3.578873)*sailStates.r + (0.012458)*sailStates.de;
	CD = -2.441750;
	CY = (0.418774)*sailStates.alpha + (-0.022610)*sailStates.beta + (1.364530)*sailStates.p + (-0.662183)*sailStates.q + (-0.271446)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (2.009757)*sailStates.alpha + (-0.891702)*sailStates.beta + (-1.860152)*sailStates.p + (18.069836)*sailStates.q + (3.044054)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-9.772658)*sailStates.alpha + (2.958460)*sailStates.beta + (9.383248)*sailStates.p + (-157.701080)*sailStates.q + (-11.860294)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-1.802314)*sailStates.alpha + (0.123240)*sailStates.beta + (-2.755079)*sailStates.p + (11.501188)*sailStates.q + (0.016092)*sailStates.r + (0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end