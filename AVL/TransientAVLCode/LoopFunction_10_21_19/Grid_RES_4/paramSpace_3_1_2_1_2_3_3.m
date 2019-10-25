function [aeroForces] = paramSpace_3_1_2_1_2_3_3(sailStates,airStates)

	CL = (6.080289)*sailStates.alpha + (0.592094)*sailStates.beta + (-3.489970)*sailStates.p + (44.521526)*sailStates.q + (2.664088)*sailStates.r + (0.011886)*sailStates.de;
	CD = -2.344210;
	CY = (0.394441)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.153367)*sailStates.p + (-0.221991)*sailStates.q + (-0.075588)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (2.070798)*sailStates.alpha + (-0.385871)*sailStates.beta + (-1.988817)*sailStates.p + (17.724518)*sailStates.q + (2.391705)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-12.466507)*sailStates.alpha + (-2.268097)*sailStates.beta + (11.151667)*sailStates.p + (-160.446365)*sailStates.q + (-9.012970)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.510541)*sailStates.alpha + (0.039714)*sailStates.beta + (-2.470559)*sailStates.p + (10.956105)*sailStates.q + (0.013700)*sailStates.r + (0.000322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end