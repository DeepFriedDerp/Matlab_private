function [aeroForces] = paramSpace_1_4_2_2_3_2_1(sailStates,airStates)

	CL = (3.837633)*sailStates.alpha + (0.219893)*sailStates.beta + (-2.051231)*sailStates.p + (31.859438)*sailStates.q + (-1.020479)*sailStates.r + (0.010246)*sailStates.de;
	CD = 0.036700;
	CY = (0.110001)*sailStates.alpha + (-0.023290)*sailStates.beta + (-0.299451)*sailStates.p + (0.455225)*sailStates.q + (-0.059581)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (0.964122)*sailStates.alpha + (0.189796)*sailStates.beta + (-0.774974)*sailStates.p + (6.215205)*sailStates.q + (-0.705555)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-13.198937)*sailStates.alpha + (-0.817171)*sailStates.beta + (6.594760)*sailStates.p + (-121.885399)*sailStates.q + (3.417946)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.249460)*sailStates.alpha + (0.024626)*sailStates.beta + (0.543189)*sailStates.p + (-2.441307)*sailStates.q + (-0.001636)*sailStates.r + (-0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end