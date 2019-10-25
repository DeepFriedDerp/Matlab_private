function [aeroForces] = paramSpace_2_2_4_1_1_3_1(sailStates,airStates)

	CL = (7.059220)*sailStates.alpha + (0.186231)*sailStates.beta + (-1.641266)*sailStates.p + (25.023972)*sailStates.q + (2.458014)*sailStates.r + (0.010165)*sailStates.de;
	CD = -2.881290;
	CY = (-0.701141)*sailStates.alpha + (-0.024496)*sailStates.beta + (1.306186)*sailStates.p + (-1.915489)*sailStates.q + (0.085410)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (2.105314)*sailStates.alpha + (-0.520856)*sailStates.beta + (-0.494065)*sailStates.p + (2.549306)*sailStates.q + (2.340275)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-16.840397)*sailStates.alpha + (-0.750462)*sailStates.beta + (6.495434)*sailStates.p + (-113.694908)*sailStates.q + (-8.330235)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (2.641121)*sailStates.alpha + (-0.039381)*sailStates.beta + (-2.878082)*sailStates.p + (14.372171)*sailStates.q + (-0.033195)*sailStates.r + (0.000742)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end