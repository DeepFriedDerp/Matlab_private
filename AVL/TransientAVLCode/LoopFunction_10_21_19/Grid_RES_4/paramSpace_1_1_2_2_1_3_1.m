function [aeroForces] = paramSpace_1_1_2_2_1_3_1(sailStates,airStates)

	CL = (4.191219)*sailStates.alpha + (0.071513)*sailStates.beta + (-2.018665)*sailStates.p + (28.008009)*sailStates.q + (0.389488)*sailStates.r + (0.009548)*sailStates.de;
	CD = -0.425340;
	CY = (-0.189665)*sailStates.alpha + (-0.021311)*sailStates.beta + (0.409568)*sailStates.p + (-1.057313)*sailStates.q + (0.081506)*sailStates.r + (-0.000221)*sailStates.de;

	Cl = (1.233788)*sailStates.alpha + (-0.132659)*sailStates.beta + (-0.872704)*sailStates.p + (6.373184)*sailStates.q + (0.541934)*sailStates.r + (-0.000001)*sailStates.de;
	Cm = (-15.128776)*sailStates.alpha + (-0.267480)*sailStates.beta + (7.781376)*sailStates.p + (-124.043571)*sailStates.q + (-1.194127)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.699242)*sailStates.alpha + (-0.043097)*sailStates.beta + (-1.049028)*sailStates.p + (6.017909)*sailStates.q + (-0.066406)*sailStates.r + (0.000383)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end