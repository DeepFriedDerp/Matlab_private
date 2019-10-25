function [aeroForces] = paramSpace_2_3_4_2_3_2_1(sailStates,airStates)

	CL = (4.060879)*sailStates.alpha + (0.019386)*sailStates.beta + (-2.157026)*sailStates.p + (31.728174)*sailStates.q + (-0.469535)*sailStates.r + (0.010898)*sailStates.de;
	CD = 0.013530;
	CY = (0.111112)*sailStates.alpha + (-0.024809)*sailStates.beta + (-0.161406)*sailStates.p + (0.668511)*sailStates.q + (-0.010509)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.032452)*sailStates.alpha + (0.063427)*sailStates.beta + (-0.858500)*sailStates.p + (6.548089)*sailStates.q + (-0.313296)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.648357)*sailStates.alpha + (-0.039749)*sailStates.beta + (7.330187)*sailStates.p + (-125.787453)*sailStates.q + (1.554798)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.197172)*sailStates.alpha + (0.003362)*sailStates.beta + (0.313478)*sailStates.p + (-1.928752)*sailStates.q + (0.003320)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end