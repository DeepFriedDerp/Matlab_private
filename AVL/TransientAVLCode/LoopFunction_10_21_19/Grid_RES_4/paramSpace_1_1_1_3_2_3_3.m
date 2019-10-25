function [aeroForces] = paramSpace_1_1_1_3_2_3_3(sailStates,airStates)

	CL = (3.778501)*sailStates.alpha + (-0.094919)*sailStates.beta + (-2.660917)*sailStates.p + (34.893879)*sailStates.q + (-0.431450)*sailStates.r + (0.010008)*sailStates.de;
	CD = -0.021050;
	CY = (0.026859)*sailStates.alpha + (-0.025467)*sailStates.beta + (0.030478)*sailStates.p + (0.194783)*sailStates.q + (0.006041)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.342403)*sailStates.alpha + (-0.055972)*sailStates.beta + (-1.390840)*sailStates.p + (11.795373)*sailStates.q + (-0.186189)*sailStates.r + (0.000786)*sailStates.de;
	Cm = (-13.900378)*sailStates.alpha + (0.393627)*sailStates.beta + (9.336061)*sailStates.p + (-140.845245)*sailStates.q + (1.526775)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.214650)*sailStates.alpha + (-0.011593)*sailStates.beta + (-0.336511)*sailStates.p + (2.466559)*sailStates.q + (-0.049154)*sailStates.r + (-0.000009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end