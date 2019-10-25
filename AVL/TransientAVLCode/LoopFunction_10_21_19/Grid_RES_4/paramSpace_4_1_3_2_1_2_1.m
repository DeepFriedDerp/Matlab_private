function [aeroForces] = paramSpace_4_1_3_2_1_2_1(sailStates,airStates)

	CL = (3.837633)*sailStates.alpha + (0.219893)*sailStates.beta + (-2.051231)*sailStates.p + (31.859438)*sailStates.q + (1.020479)*sailStates.r + (0.010246)*sailStates.de;
	CD = 0.036700;
	CY = (-0.110001)*sailStates.alpha + (-0.026282)*sailStates.beta + (0.299451)*sailStates.p + (-0.455225)*sailStates.q + (-0.059581)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.118719)*sailStates.alpha + (-0.067332)*sailStates.beta + (-0.869347)*sailStates.p + (7.403085)*sailStates.q + (0.724370)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-13.198937)*sailStates.alpha + (-0.817171)*sailStates.beta + (6.594759)*sailStates.p + (-121.885399)*sailStates.q + (-3.417947)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.182983)*sailStates.alpha + (0.026520)*sailStates.beta + (-0.524417)*sailStates.p + (2.205023)*sailStates.q + (-0.005379)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end