function [aeroForces] = paramSpace_11_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.081916)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.310843)*sailStates.p + (32.321175)*sailStates.q + (0.051479)*sailStates.r + (0.010698)*sailStates.de;
	CD = -0.054520;
	CY = (-0.031876)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.087817)*sailStates.p + (-0.322047)*sailStates.q + (0.009241)*sailStates.r + (-0.000069)*sailStates.de;

	Cl = (1.129774)*sailStates.alpha + (0.056882)*sailStates.beta + (-1.015514)*sailStates.p + (7.935285)*sailStates.q + (-0.099137)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.876562)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.063082)*sailStates.p + (-130.700150)*sailStates.q + (-0.166651)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (-0.132579)*sailStates.alpha + (-0.005979)*sailStates.beta + (0.291377)*sailStates.p + (-1.319643)*sailStates.q + (-0.009044)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end