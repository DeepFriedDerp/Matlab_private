function [aeroForces] = paramSpace_4_4_4_1_3_3_2(sailStates,airStates)

	CL = (5.426614)*sailStates.alpha + (-0.699264)*sailStates.beta + (-2.679240)*sailStates.p + (42.743988)*sailStates.q + (2.817915)*sailStates.r + (0.011914)*sailStates.de;
	CD = -1.857760;
	CY = (0.238183)*sailStates.alpha + (-0.030602)*sailStates.beta + (1.009112)*sailStates.p + (1.664522)*sailStates.q + (-0.200546)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (1.016619)*sailStates.alpha + (-0.746971)*sailStates.beta + (-1.190886)*sailStates.p + (11.248288)*sailStates.q + (2.436460)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-9.049038)*sailStates.alpha + (2.735629)*sailStates.beta + (7.192033)*sailStates.p + (-136.195908)*sailStates.q + (-9.389794)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.048060)*sailStates.alpha + (0.113164)*sailStates.beta + (-2.138251)*sailStates.p + (7.551609)*sailStates.q + (-0.012837)*sailStates.r + (-0.000301)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end