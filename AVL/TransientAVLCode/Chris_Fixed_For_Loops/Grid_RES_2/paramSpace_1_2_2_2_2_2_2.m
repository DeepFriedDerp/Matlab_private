function [aeroForces] = paramSpace_1_2_2_2_2_2_2(sailStates,airStates)

	CL = (5.906410)*sailStates.alpha + (-0.901145)*sailStates.beta + (-6.325432)*sailStates.p + (56.835007)*sailStates.q + (2.771859)*sailStates.r + (0.011151)*sailStates.de;
	CD = -9.620120;
	CY = (3.209321)*sailStates.alpha + (-0.018893)*sailStates.beta + (1.563625)*sailStates.p + (4.569682)*sailStates.q + (0.207150)*sailStates.r + (0.001043)*sailStates.de;

	Cl = (-1.912724)*sailStates.alpha + (-1.127560)*sailStates.beta + (-4.391926)*sailStates.p + (37.747402)*sailStates.q + (3.005670)*sailStates.r + (0.005885)*sailStates.de;
	Cm = (10.884099)*sailStates.alpha + (3.893292)*sailStates.beta + (23.783335)*sailStates.p + (-246.882568)*sailStates.q + (-9.473684)*sailStates.r + (-0.083799)*sailStates.de;
	Cn = (-12.208220)*sailStates.alpha + (-0.111635)*sailStates.beta + (-4.187122)*sailStates.p + (17.676554)*sailStates.q + (-0.084327)*sailStates.r + (-0.000886)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end