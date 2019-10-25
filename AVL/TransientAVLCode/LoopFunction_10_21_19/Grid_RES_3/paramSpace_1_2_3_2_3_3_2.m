function [aeroForces] = paramSpace_1_2_3_2_3_3_2(sailStates,airStates)

	CL = (4.187131)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.414526)*sailStates.p + (32.089348)*sailStates.q + (-0.045018)*sailStates.r + (0.010214)*sailStates.de;
	CD = -0.266260;
	CY = (0.091243)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.170567)*sailStates.p + (0.759372)*sailStates.q + (0.030148)*sailStates.r + (0.000162)*sailStates.de;

	Cl = (1.194054)*sailStates.alpha + (-0.115581)*sailStates.beta + (-1.140815)*sailStates.p + (9.074094)*sailStates.q + (0.214374)*sailStates.r + (0.000290)*sailStates.de;
	Cm = (-15.189318)*sailStates.alpha + (0.000000)*sailStates.beta + (8.691674)*sailStates.p + (-134.568695)*sailStates.q + (0.159516)*sailStates.r + (-0.068277)*sailStates.de;
	Cn = (0.167356)*sailStates.alpha + (-0.020380)*sailStates.beta + (-0.568723)*sailStates.p + (2.484647)*sailStates.q + (-0.027391)*sailStates.r + (-0.000181)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end