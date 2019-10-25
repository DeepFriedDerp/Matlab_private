function [aeroForces] = paramSpace_3_2_2_1_3_3_1(sailStates,airStates)

	CL = (5.320405)*sailStates.alpha + (0.167005)*sailStates.beta + (-1.757069)*sailStates.p + (30.358713)*sailStates.q + (1.993378)*sailStates.r + (0.011193)*sailStates.de;
	CD = -1.786300;
	CY = (-0.047302)*sailStates.alpha + (-0.024361)*sailStates.beta + (0.808539)*sailStates.p + (1.915492)*sailStates.q + (-0.053062)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (0.574086)*sailStates.alpha + (-0.438735)*sailStates.beta + (-0.530651)*sailStates.p + (3.954246)*sailStates.q + (1.841005)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-11.608215)*sailStates.alpha + (-0.653184)*sailStates.beta + (5.505343)*sailStates.p + (-113.694908)*sailStates.q + (-6.775630)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (1.374633)*sailStates.alpha + (0.031867)*sailStates.beta + (-1.858991)*sailStates.p + (7.063071)*sailStates.q + (0.003559)*sailStates.r + (-0.000416)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end