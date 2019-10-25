function [aeroForces] = paramSpace_2_4_3_3_2_3_1(sailStates,airStates)

	CL = (4.142736)*sailStates.alpha + (-0.098336)*sailStates.beta + (-2.269974)*sailStates.p + (31.805399)*sailStates.q + (0.359805)*sailStates.r + (0.010611)*sailStates.de;
	CD = -0.156290;
	CY = (-0.035111)*sailStates.alpha + (-0.024849)*sailStates.beta + (0.251245)*sailStates.p + (-0.065300)*sailStates.q + (0.016465)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.056087)*sailStates.alpha + (-0.147081)*sailStates.beta + (-0.932081)*sailStates.p + (6.928602)*sailStates.q + (0.426403)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.757948)*sailStates.alpha + (0.429784)*sailStates.beta + (7.967764)*sailStates.p + (-129.003830)*sailStates.q + (-1.228167)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (0.284048)*sailStates.alpha + (-0.006742)*sailStates.beta + (-0.606752)*sailStates.p + (2.898619)*sailStates.q + (-0.007854)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end