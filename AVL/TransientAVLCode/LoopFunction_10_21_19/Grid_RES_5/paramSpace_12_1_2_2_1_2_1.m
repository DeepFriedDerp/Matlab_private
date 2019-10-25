function [aeroForces] = paramSpace_12_1_2_2_1_2_1(sailStates,airStates)

	CL = (4.276611)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.341003)*sailStates.p + (34.795208)*sailStates.q + (1.289287)*sailStates.r + (0.011082)*sailStates.de;
	CD = -0.164300;
	CY = (-0.078875)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.451074)*sailStates.p + (-0.291853)*sailStates.q + (-0.063384)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.264856)*sailStates.alpha + (-0.213830)*sailStates.beta + (-1.020792)*sailStates.p + (8.599119)*sailStates.q + (1.014563)*sailStates.r + (0.000043)*sailStates.de;
	Cm = (-13.841984)*sailStates.alpha + (0.000000)*sailStates.beta + (7.460864)*sailStates.p + (-130.037888)*sailStates.q + (-4.318861)*sailStates.r + (-0.068518)*sailStates.de;
	Cn = (0.237786)*sailStates.alpha + (0.030052)*sailStates.beta + (-0.897787)*sailStates.p + (3.940714)*sailStates.q + (0.003710)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end