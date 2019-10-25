function [aeroForces] = paramSpace_7_1_3_2_2_2_2(sailStates,airStates)

	CL = (4.141649)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.782119)*sailStates.p + (36.370724)*sailStates.q + (0.240256)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.074290;
	CY = (0.067845)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.150177)*sailStates.p + (0.438542)*sailStates.q + (0.005260)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.337230)*sailStates.alpha + (-0.092841)*sailStates.beta + (-1.384940)*sailStates.p + (11.319971)*sailStates.q + (0.292183)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.799057)*sailStates.alpha + (0.000000)*sailStates.beta + (9.576423)*sailStates.p + (-143.320496)*sailStates.q + (-0.835096)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (-0.010797)*sailStates.alpha + (-0.003242)*sailStates.beta + (-0.387364)*sailStates.p + (1.546801)*sailStates.q + (-0.001697)*sailStates.r + (-0.000098)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end