function [aeroForces] = paramSpace_4_1_2_1_3_1_1(sailStates,airStates)

	CL = (6.452842)*sailStates.alpha + (-0.434632)*sailStates.beta + (-1.488407)*sailStates.p + (19.518890)*sailStates.q + (-2.045711)*sailStates.r + (0.008598)*sailStates.de;
	CD = -2.676590;
	CY = (0.674769)*sailStates.alpha + (-0.017623)*sailStates.beta + (-1.188845)*sailStates.p + (2.326708)*sailStates.q + (0.236393)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (1.952931)*sailStates.alpha + (0.356080)*sailStates.beta + (-0.478811)*sailStates.p + (1.506229)*sailStates.q + (-2.048752)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-18.282465)*sailStates.alpha + (1.681064)*sailStates.beta + (7.403773)*sailStates.p + (-112.315697)*sailStates.q + (6.650645)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-2.551714)*sailStates.alpha + (-0.118231)*sailStates.beta + (2.700555)*sailStates.p + (-13.937300)*sailStates.q + (-0.110649)*sailStates.r + (-0.000840)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end