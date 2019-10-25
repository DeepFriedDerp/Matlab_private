function [aeroForces] = paramSpace_11_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.509878)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.114762)*sailStates.p + (33.244289)*sailStates.q + (1.445341)*sailStates.r + (0.011310)*sailStates.de;
	CD = -0.577130;
	CY = (0.044388)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.512078)*sailStates.p + (1.178226)*sailStates.q + (-0.053946)*sailStates.r + (0.000251)*sailStates.de;

	Cl = (0.927156)*sailStates.alpha + (-0.303508)*sailStates.beta + (-0.812877)*sailStates.p + (6.565867)*sailStates.q + (1.235821)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-13.081655)*sailStates.alpha + (0.000000)*sailStates.beta + (6.699760)*sailStates.p + (-123.632645)*sailStates.q + (-4.865533)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (0.480336)*sailStates.alpha + (0.031900)*sailStates.beta + (-1.140979)*sailStates.p + (4.263804)*sailStates.q + (-0.001026)*sailStates.r + (-0.000239)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end