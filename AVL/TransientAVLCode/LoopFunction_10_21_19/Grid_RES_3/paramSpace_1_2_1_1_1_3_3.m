function [aeroForces] = paramSpace_1_2_1_1_1_3_3(sailStates,airStates)

	CL = (6.254817)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.253558)*sailStates.p + (35.237942)*sailStates.q + (1.475429)*sailStates.r + (0.009681)*sailStates.de;
	CD = -2.466570;
	CY = (0.261631)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.990755)*sailStates.p + (-1.081939)*sailStates.q + (0.174800)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (2.501401)*sailStates.alpha + (-0.452228)*sailStates.beta + (-1.858487)*sailStates.p + (14.678978)*sailStates.q + (1.551413)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-16.020226)*sailStates.alpha + (0.000000)*sailStates.beta + (12.921956)*sailStates.p + (-161.621323)*sailStates.q + (-4.771247)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (-0.708578)*sailStates.alpha + (-0.079740)*sailStates.beta + (-2.534715)*sailStates.p + (13.583613)*sailStates.q + (-0.115890)*sailStates.r + (0.000572)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end