function [aeroForces] = paramSpace_1_1_2_1_2_1_3(sailStates,airStates)

	CL = (6.118208)*sailStates.alpha + (-0.784930)*sailStates.beta + (-3.482985)*sailStates.p + (50.234791)*sailStates.q + (-3.578873)*sailStates.r + (0.012458)*sailStates.de;
	CD = -2.441750;
	CY = (-0.418774)*sailStates.alpha + (-0.026962)*sailStates.beta + (-1.364530)*sailStates.p + (0.662183)*sailStates.q + (-0.271446)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (2.085349)*sailStates.alpha + (0.405092)*sailStates.beta + (-1.954525)*sailStates.p + (19.257713)*sailStates.q + (-3.062867)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-9.772656)*sailStates.alpha + (2.958461)*sailStates.beta + (9.383247)*sailStates.p + (-157.701111)*sailStates.q + (11.860293)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (1.995367)*sailStates.alpha + (0.134708)*sailStates.beta + (2.736307)*sailStates.p + (-11.264905)*sailStates.q + (0.012350)*sailStates.r + (-0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end