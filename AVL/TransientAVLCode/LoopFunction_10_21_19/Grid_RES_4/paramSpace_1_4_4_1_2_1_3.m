function [aeroForces] = paramSpace_1_4_4_1_2_1_3(sailStates,airStates)

	CL = (6.137361)*sailStates.alpha + (0.741248)*sailStates.beta + (-3.485003)*sailStates.p + (50.136826)*sailStates.q + (-3.558739)*sailStates.r + (0.012637)*sailStates.de;
	CD = -2.403200;
	CY = (-0.407697)*sailStates.alpha + (-0.022885)*sailStates.beta + (-1.335382)*sailStates.p + (0.662183)*sailStates.q + (-0.265553)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (2.011678)*sailStates.alpha + (0.873876)*sailStates.beta + (-1.861006)*sailStates.p + (18.065496)*sailStates.q + (-2.995938)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-10.169216)*sailStates.alpha + (-2.690507)*sailStates.beta + (9.405911)*sailStates.p + (-157.701080)*sailStates.q + (11.746361)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (1.767503)*sailStates.alpha + (0.120635)*sailStates.beta + (2.711144)*sailStates.p + (-11.479371)*sailStates.q + (0.016673)*sailStates.r + (-0.000488)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end