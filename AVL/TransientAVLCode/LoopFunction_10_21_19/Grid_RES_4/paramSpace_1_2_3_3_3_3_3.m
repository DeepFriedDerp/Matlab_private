function [aeroForces] = paramSpace_1_2_3_3_3_3_3(sailStates,airStates)

	CL = (3.925737)*sailStates.alpha + (-0.024491)*sailStates.beta + (-2.666849)*sailStates.p + (35.145954)*sailStates.q + (-0.546885)*sailStates.r + (0.010339)*sailStates.de;
	CD = -0.037550;
	CY = (0.081968)*sailStates.alpha + (-0.025680)*sailStates.beta + (-0.020127)*sailStates.p + (0.684401)*sailStates.q + (-0.003979)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.311403)*sailStates.alpha + (-0.029965)*sailStates.beta + (-1.360033)*sailStates.p + (11.496423)*sailStates.q + (-0.240781)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-14.453176)*sailStates.alpha + (0.064022)*sailStates.beta + (9.250888)*sailStates.p + (-141.172913)*sailStates.q + (1.854706)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.144453)*sailStates.alpha + (-0.004884)*sailStates.beta + (-0.207358)*sailStates.p + (1.290820)*sailStates.q + (-0.035411)*sailStates.r + (-0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end