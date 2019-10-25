function [aeroForces] = paramSpace_1_1_1_1_1_2_2(sailStates,airStates)

	CL = (3.333698)*sailStates.alpha + (0.043403)*sailStates.beta + (-3.993688)*sailStates.p + (44.943867)*sailStates.q + (0.137977)*sailStates.r + (0.011032)*sailStates.de;
	CD = -0.374150;
	CY = (0.178806)*sailStates.alpha + (-0.024309)*sailStates.beta + (0.315062)*sailStates.p + (-0.203901)*sailStates.q + (0.041493)*sailStates.r + (-0.000045)*sailStates.de;

	Cl = (1.322714)*sailStates.alpha + (-0.153565)*sailStates.beta + (-2.461761)*sailStates.p + (21.351068)*sailStates.q + (0.286983)*sailStates.r + (0.002547)*sailStates.de;
	Cm = (-11.330240)*sailStates.alpha + (-0.160049)*sailStates.beta + (14.085066)*sailStates.p + (-177.964630)*sailStates.q + (-0.407102)*sailStates.r + (-0.073052)*sailStates.de;
	Cn = (-0.565647)*sailStates.alpha + (-0.028299)*sailStates.beta + (-1.019726)*sailStates.p + (6.149988)*sailStates.q + (-0.053921)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end