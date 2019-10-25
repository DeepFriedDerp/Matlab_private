function [aeroForces] = paramSpace_4_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.010409)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.298165)*sailStates.p + (32.035130)*sailStates.q + (-0.015263)*sailStates.r + (0.010412)*sailStates.de;
	CD = -0.053790;
	CY = (-0.076852)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.153378)*sailStates.p + (-0.520429)*sailStates.q + (0.021611)*sailStates.r + (-0.000111)*sailStates.de;

	Cl = (1.160874)*sailStates.alpha + (-0.055818)*sailStates.beta + (-1.012343)*sailStates.p + (7.850190)*sailStates.q + (0.117152)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-14.678017)*sailStates.alpha + (0.000000)*sailStates.beta + (8.153476)*sailStates.p + (-130.856766)*sailStates.q + (0.110553)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (0.310298)*sailStates.alpha + (-0.007845)*sailStates.beta + (-0.466476)*sailStates.p + (3.007959)*sailStates.q + (-0.029427)*sailStates.r + (0.000203)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end