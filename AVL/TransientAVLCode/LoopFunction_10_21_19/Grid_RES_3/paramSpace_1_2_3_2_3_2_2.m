function [aeroForces] = paramSpace_1_2_3_2_3_2_2(sailStates,airStates)

	CL = (4.066831)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.483543)*sailStates.p + (35.295738)*sailStates.q + (-1.064470)*sailStates.r + (0.010852)*sailStates.de;
	CD = 0.020980;
	CY = (0.098139)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.300043)*sailStates.p + (0.759371)*sailStates.q + (-0.052833)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.299851)*sailStates.alpha + (0.119724)*sailStates.beta + (-1.162640)*sailStates.p + (9.920649)*sailStates.q + (-0.733112)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-14.239129)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.096426)*sailStates.p + (-134.568695)*sailStates.q + (3.535334)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (-0.027088)*sailStates.alpha + (0.021111)*sailStates.beta + (0.498684)*sailStates.p + (-2.316402)*sailStates.q + (-0.005527)*sailStates.r + (-0.000270)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end