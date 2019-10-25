function [aeroForces] = paramSpace_14_1_3_2_2_2_1(sailStates,airStates)

	CL = (3.970803)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.320227)*sailStates.p + (35.600365)*sailStates.q + (1.409562)*sailStates.r + (0.010853)*sailStates.de;
	CD = -0.066040;
	CY = (0.038089)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.401074)*sailStates.p + (0.571906)*sailStates.q + (-0.085230)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.088951)*sailStates.alpha + (-0.223194)*sailStates.beta + (-1.010428)*sailStates.p + (8.821775)*sailStates.q + (1.081982)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-12.570001)*sailStates.alpha + (0.000000)*sailStates.beta + (7.193559)*sailStates.p + (-129.462372)*sailStates.q + (-4.711110)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (0.045159)*sailStates.alpha + (0.047441)*sailStates.beta + (-0.752192)*sailStates.p + (2.307726)*sailStates.q + (-0.024514)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end