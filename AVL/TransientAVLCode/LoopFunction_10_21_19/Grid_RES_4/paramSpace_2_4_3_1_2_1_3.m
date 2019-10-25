function [aeroForces] = paramSpace_2_4_3_1_2_1_3(sailStates,airStates)

	CL = (6.080290)*sailStates.alpha + (0.592093)*sailStates.beta + (-3.489970)*sailStates.p + (44.521526)*sailStates.q + (-2.664087)*sailStates.r + (0.011886)*sailStates.de;
	CD = -2.344210;
	CY = (-0.394441)*sailStates.alpha + (-0.024573)*sailStates.beta + (-1.153367)*sailStates.p + (0.221991)*sailStates.q + (-0.075588)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.966756)*sailStates.alpha + (0.738674)*sailStates.beta + (-1.891117)*sailStates.p + (16.515955)*sailStates.q + (-2.385345)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-12.466507)*sailStates.alpha + (-2.268095)*sailStates.beta + (11.151667)*sailStates.p + (-160.446381)*sailStates.q + (9.012970)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.354883)*sailStates.alpha + (0.033993)*sailStates.beta + (2.476962)*sailStates.p + (-11.035318)*sailStates.q + (0.014117)*sailStates.r + (-0.000322)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end