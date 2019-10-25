function [aeroForces] = paramSpace_2_1_1_2_1_2_1(sailStates,airStates)

	CL = (3.816508)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.232268)*sailStates.p + (31.566856)*sailStates.q + (-0.326992)*sailStates.r + (0.009955)*sailStates.de;
	CD = -0.003200;
	CY = (-0.076104)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.081945)*sailStates.p + (-0.571905)*sailStates.q + (0.017479)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.101044)*sailStates.alpha + (-0.018320)*sailStates.beta + (-0.982466)*sailStates.p + (7.745611)*sailStates.q + (-0.095243)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-14.145602)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.941968)*sailStates.p + (-129.462372)*sailStates.q + (1.190121)*sailStates.r + (-0.066948)*sailStates.de;
	Cn = (0.319450)*sailStates.alpha + (-0.003894)*sailStates.beta + (-0.360097)*sailStates.p + (2.755233)*sailStates.q + (-0.052735)*sailStates.r + (0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end