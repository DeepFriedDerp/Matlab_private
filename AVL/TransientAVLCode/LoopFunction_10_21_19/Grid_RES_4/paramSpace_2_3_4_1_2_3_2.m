function [aeroForces] = paramSpace_2_3_4_1_2_3_2(sailStates,airStates)

	CL = (6.276833)*sailStates.alpha + (-0.160616)*sailStates.beta + (-2.509043)*sailStates.p + (32.284927)*sailStates.q + (1.901581)*sailStates.r + (0.010551)*sailStates.de;
	CD = -2.243340;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.996833)*sailStates.p + (0.000003)*sailStates.q + (0.065336)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.786092)*sailStates.alpha + (-0.539578)*sailStates.beta + (-1.173556)*sailStates.p + (8.881441)*sailStates.q + (1.887348)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.814122)*sailStates.alpha + (0.663655)*sailStates.beta + (9.255267)*sailStates.p + (-137.194580)*sailStates.q + (-6.477399)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.499689)*sailStates.alpha + (-0.031454)*sailStates.beta + (-2.287946)*sailStates.p + (10.483632)*sailStates.q + (-0.021593)*sailStates.r + (0.000176)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end