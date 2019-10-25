function [aeroForces] = paramSpace_3_2_2_1_3_1_1(sailStates,airStates)

	CL = (7.022027)*sailStates.alpha + (-0.179186)*sailStates.beta + (-1.641105)*sailStates.p + (25.040310)*sailStates.q + (-2.450664)*sailStates.r + (0.010135)*sailStates.de;
	CD = -2.854830;
	CY = (0.695694)*sailStates.alpha + (-0.024361)*sailStates.beta + (-1.291434)*sailStates.p + (1.915490)*sailStates.q + (0.084578)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (2.096016)*sailStates.alpha + (0.513346)*sailStates.beta + (-0.493969)*sailStates.p + (2.550078)*sailStates.q + (-2.317046)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-16.763969)*sailStates.alpha + (0.705357)*sailStates.beta + (6.492672)*sailStates.p + (-113.694908)*sailStates.q + (8.288095)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (-2.625733)*sailStates.alpha + (-0.039130)*sailStates.beta + (2.856312)*sailStates.p + (-14.360391)*sailStates.q + (-0.033187)*sailStates.r + (-0.000746)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end