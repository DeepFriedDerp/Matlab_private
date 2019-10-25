function [aeroForces] = paramSpace_2_4_4_3_2_3_1(sailStates,airStates)

	CL = (4.157743)*sailStates.alpha + (-0.119716)*sailStates.beta + (-2.270195)*sailStates.p + (31.789015)*sailStates.q + (0.368091)*sailStates.r + (0.010641)*sailStates.de;
	CD = -0.161870;
	CY = (-0.036709)*sailStates.alpha + (-0.024835)*sailStates.beta + (0.266033)*sailStates.p + (-0.065300)*sailStates.q + (0.017430)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.056387)*sailStates.alpha + (-0.154615)*sailStates.beta + (-0.932191)*sailStates.p + (6.927845)*sailStates.q + (0.449931)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.825769)*sailStates.alpha + (0.565336)*sailStates.beta + (7.970886)*sailStates.p + (-129.003830)*sailStates.q + (-1.275810)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.288679)*sailStates.alpha + (-0.007249)*sailStates.beta + (-0.628580)*sailStates.p + (2.910171)*sailStates.q + (-0.007999)*sailStates.r + (0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end