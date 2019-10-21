function [aeroForces] = paramSpace_1_2_2_2_2_1_2(sailStates,airStates)

	CL = (5.492638)*sailStates.alpha + (-0.854517)*sailStates.beta + (-6.205285)*sailStates.p + (56.274273)*sailStates.q + (2.585264)*sailStates.r + (0.011154)*sailStates.de;
	CD = -8.729250;
	CY = (2.963648)*sailStates.alpha + (-0.018979)*sailStates.beta + (1.471169)*sailStates.p + (4.502946)*sailStates.q + (0.194959)*sailStates.r + (0.001026)*sailStates.de;

	Cl = (-1.755512)*sailStates.alpha + (-1.067282)*sailStates.beta + (-4.287942)*sailStates.p + (36.873856)*sailStates.q + (2.827930)*sailStates.r + (0.005687)*sailStates.de;
	Cm = (9.165077)*sailStates.alpha + (3.708525)*sailStates.beta + (23.251923)*sailStates.p + (-243.246368)*sailStates.q + (-8.845507)*sailStates.r + (-0.083147)*sailStates.de;
	Cn = (-11.168478)*sailStates.alpha + (-0.105954)*sailStates.beta + (-3.962386)*sailStates.p + (16.643200)*sailStates.q + (-0.079875)*sailStates.r + (-0.000903)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end