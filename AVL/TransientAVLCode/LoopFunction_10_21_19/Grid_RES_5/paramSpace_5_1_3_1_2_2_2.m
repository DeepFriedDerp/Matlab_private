function [aeroForces] = paramSpace_5_1_3_1_2_2_2(sailStates,airStates)

	CL = (4.357307)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.989972)*sailStates.p + (36.831055)*sailStates.q + (0.396811)*sailStates.r + (0.010763)*sailStates.de;
	CD = -0.504830;
	CY = (0.206639)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.300620)*sailStates.p + (1.178227)*sailStates.q + (0.031638)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (1.365427)*sailStates.alpha + (-0.197775)*sailStates.beta + (-1.588075)*sailStates.p + (13.070912)*sailStates.q + (0.552509)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.699025)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.609731)*sailStates.p + (-150.099487)*sailStates.q + (-1.356913)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (-0.169204)*sailStates.alpha + (-0.020787)*sailStates.beta + (-0.858235)*sailStates.p + (3.546412)*sailStates.q + (-0.014704)*sailStates.r + (-0.000267)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end