function [aeroForces] = paramSpace_3_1_1_3_2_1_1(sailStates,airStates)

	CL = (4.157743)*sailStates.alpha + (-0.119716)*sailStates.beta + (-2.270195)*sailStates.p + (31.789015)*sailStates.q + (-0.368091)*sailStates.r + (0.010641)*sailStates.de;
	CD = -0.161870;
	CY = (0.036709)*sailStates.alpha + (-0.024737)*sailStates.beta + (-0.266033)*sailStates.p + (0.065300)*sailStates.q + (0.017430)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.218752)*sailStates.alpha + (0.104815)*sailStates.beta + (-1.029896)*sailStates.p + (8.136406)*sailStates.q + (-0.443654)*sailStates.r + (0.000129)*sailStates.de;
	Cm = (-14.825769)*sailStates.alpha + (0.565336)*sailStates.beta + (7.970886)*sailStates.p + (-129.003830)*sailStates.q + (1.275810)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.265140)*sailStates.alpha + (-0.009755)*sailStates.beta + (0.634984)*sailStates.p + (-2.989384)*sailStates.q + (-0.008410)*sailStates.r + (-0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end