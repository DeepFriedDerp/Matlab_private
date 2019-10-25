function [aeroForces] = paramSpace_2_2_2_3_1_3_3(sailStates,airStates)

	CL = (4.245140)*sailStates.alpha + (0.028406)*sailStates.beta + (-2.814747)*sailStates.p + (36.277363)*sailStates.q + (0.410373)*sailStates.r + (0.010997)*sailStates.de;
	CD = -0.187750;
	CY = (-0.021103)*sailStates.alpha + (-0.024807)*sailStates.beta + (0.295173)*sailStates.p + (-0.432841)*sailStates.q + (0.019362)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.469325)*sailStates.alpha + (-0.121427)*sailStates.beta + (-1.434616)*sailStates.p + (11.746737)*sailStates.q + (0.447031)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.938906)*sailStates.alpha + (-0.107216)*sailStates.beta + (9.825778)*sailStates.p + (-144.575424)*sailStates.q + (-1.374742)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.109520)*sailStates.alpha + (-0.009274)*sailStates.beta + (-0.738159)*sailStates.p + (4.021886)*sailStates.q + (-0.012962)*sailStates.r + (0.000195)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end