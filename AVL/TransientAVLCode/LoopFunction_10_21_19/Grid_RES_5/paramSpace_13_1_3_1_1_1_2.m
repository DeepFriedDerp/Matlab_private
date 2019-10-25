function [aeroForces] = paramSpace_13_1_3_1_1_1_2(sailStates,airStates)

	CL = (4.165049)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.885247)*sailStates.p + (35.511112)*sailStates.q + (0.014846)*sailStates.r + (0.010141)*sailStates.de;
	CD = -0.409760;
	CY = (-0.195702)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.183889)*sailStates.p + (-1.304045)*sailStates.q + (0.032378)*sailStates.r + (-0.000280)*sailStates.de;

	Cl = (1.341248)*sailStates.alpha + (0.143958)*sailStates.beta + (-1.537588)*sailStates.p + (12.740654)*sailStates.q + (-0.239000)*sailStates.r + (0.000939)*sailStates.de;
	Cm = (-14.610875)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.388339)*sailStates.p + (-148.140839)*sailStates.q + (-0.099707)*sailStates.r + (-0.069696)*sailStates.de;
	Cn = (0.039090)*sailStates.alpha + (-0.025384)*sailStates.beta + (0.707174)*sailStates.p + (-3.206113)*sailStates.q + (-0.034687)*sailStates.r + (0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end