function [aeroForces] = paramSpace_12_1_3_2_2_1_2(sailStates,airStates)

	CL = (4.031740)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.719621)*sailStates.p + (35.489559)*sailStates.q + (0.126401)*sailStates.r + (0.010679)*sailStates.de;
	CD = -0.065500;
	CY = (0.023645)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.131360)*sailStates.p + (0.291853)*sailStates.q + (0.018472)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.342602)*sailStates.alpha + (0.053974)*sailStates.beta + (-1.357246)*sailStates.p + (11.100226)*sailStates.q + (-0.043223)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.685295)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.545487)*sailStates.p + (-142.523422)*sailStates.q + (-0.462000)*sailStates.r + (-0.069778)*sailStates.de;
	Cn = (-0.200775)*sailStates.alpha + (-0.007586)*sailStates.beta + (0.460995)*sailStates.p + (-2.959013)*sailStates.q + (-0.031942)*sailStates.r + (-0.000128)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end