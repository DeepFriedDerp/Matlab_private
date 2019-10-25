function [aeroForces] = paramSpace_11_1_3_2_2_2_1(sailStates,airStates)

	CL = (4.124824)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.368191)*sailStates.p + (34.329311)*sailStates.q + (0.924261)*sailStates.r + (0.011063)*sailStates.de;
	CD = -0.086050;
	CY = (0.036061)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.301270)*sailStates.p + (0.493724)*sailStates.q + (-0.031647)*sailStates.r + (0.000106)*sailStates.de;

	Cl = (1.134869)*sailStates.alpha + (-0.170523)*sailStates.beta + (-1.037590)*sailStates.p + (8.455969)*sailStates.q + (0.756605)*sailStates.r + (0.000077)*sailStates.de;
	Cm = (-13.971091)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.826416)*sailStates.p + (-131.315216)*sailStates.q + (-3.138268)*sailStates.r + (-0.069177)*sailStates.de;
	Cn = (0.074067)*sailStates.alpha + (0.017923)*sailStates.beta + (-0.597678)*sailStates.p + (2.014570)*sailStates.q + (-0.005304)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end