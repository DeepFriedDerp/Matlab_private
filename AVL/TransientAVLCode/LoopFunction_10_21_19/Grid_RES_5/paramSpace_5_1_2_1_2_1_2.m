function [aeroForces] = paramSpace_5_1_2_1_2_1_2(sailStates,airStates)

	CL = (5.237092)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.096032)*sailStates.p + (41.759804)*sailStates.q + (-2.182479)*sailStates.r + (0.011706)*sailStates.de;
	CD = -1.024160;
	CY = (-0.037854)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.921432)*sailStates.p + (1.178228)*sailStates.q + (-0.096888)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (2.006038)*sailStates.alpha + (0.413255)*sailStates.beta + (-1.621553)*sailStates.p + (14.366365)*sailStates.q + (-1.872009)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-13.818972)*sailStates.alpha + (0.000000)*sailStates.beta + (9.693899)*sailStates.p + (-150.099487)*sailStates.q + (7.356643)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (0.466121)*sailStates.alpha + (0.043435)*sailStates.beta + (1.881277)*sailStates.p + (-8.779001)*sailStates.q + (0.018900)*sailStates.r + (-0.000506)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end