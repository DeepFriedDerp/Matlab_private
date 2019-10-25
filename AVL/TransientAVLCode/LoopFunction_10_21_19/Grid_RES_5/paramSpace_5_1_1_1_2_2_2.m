function [aeroForces] = paramSpace_5_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.276639)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.989067)*sailStates.p + (36.884365)*sailStates.q + (0.378095)*sailStates.r + (0.010664)*sailStates.de;
	CD = -0.452310;
	CY = (0.200257)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.270608)*sailStates.p + (1.178225)*sailStates.q + (0.028317)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (1.371476)*sailStates.alpha + (-0.182760)*sailStates.beta + (-1.587638)*sailStates.p + (13.073310)*sailStates.q + (0.503857)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.491107)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.598156)*sailStates.p + (-150.099487)*sailStates.q + (-1.246789)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (-0.147068)*sailStates.alpha + (-0.019209)*sailStates.beta + (-0.813703)*sailStates.p + (3.523609)*sailStates.q + (-0.015067)*sailStates.r + (-0.000241)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end