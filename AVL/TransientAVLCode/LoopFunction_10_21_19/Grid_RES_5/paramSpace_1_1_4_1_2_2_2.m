function [aeroForces] = paramSpace_1_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.079211)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.757591)*sailStates.p + (34.160789)*sailStates.q + (-0.379182)*sailStates.r + (0.009695)*sailStates.de;
	CD = -0.378910;
	CY = (0.194538)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.114206)*sailStates.p + (1.423509)*sailStates.q + (0.028629)*sailStates.r + (0.000301)*sailStates.de;

	Cl = (1.294685)*sailStates.alpha + (-0.113068)*sailStates.beta + (-1.473936)*sailStates.p + (12.445482)*sailStates.q + (0.008632)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-14.839235)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.010872)*sailStates.p + (-145.460434)*sailStates.q + (1.332905)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (0.046932)*sailStates.alpha + (-0.028191)*sailStates.beta + (-0.618243)*sailStates.p + (2.885274)*sailStates.q + (-0.060967)*sailStates.r + (-0.000368)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end