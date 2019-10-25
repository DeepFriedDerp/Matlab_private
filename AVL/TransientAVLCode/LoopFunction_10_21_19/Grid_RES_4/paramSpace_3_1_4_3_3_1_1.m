function [aeroForces] = paramSpace_3_1_4_3_3_1_1(sailStates,airStates)

	CL = (4.172546)*sailStates.alpha + (-0.073971)*sailStates.beta + (-2.274555)*sailStates.p + (31.810652)*sailStates.q + (-0.473440)*sailStates.r + (0.010552)*sailStates.de;
	CD = -0.174290;
	CY = (0.101025)*sailStates.alpha + (-0.024006)*sailStates.beta + (-0.302197)*sailStates.p + (0.563442)*sailStates.q + (0.019867)*sailStates.r + (0.000120)*sailStates.de;

	Cl = (1.280479)*sailStates.alpha + (0.095661)*sailStates.beta + (-1.032671)*sailStates.p + (8.129977)*sailStates.q + (-0.479150)*sailStates.r + (0.000140)*sailStates.de;
	Cm = (-14.773102)*sailStates.alpha + (0.220195)*sailStates.beta + (8.018697)*sailStates.p + (-129.238037)*sailStates.q + (1.567130)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.366033)*sailStates.alpha + (-0.010807)*sailStates.beta + (0.734824)*sailStates.p + (-4.073264)*sailStates.q + (-0.012650)*sailStates.r + (-0.000234)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end