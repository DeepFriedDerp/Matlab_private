function [aeroForces] = paramSpace_1_1_2_1_2_2_1(sailStates,airStates)

	CL = (6.048415)*sailStates.alpha + (0.819431)*sailStates.beta + (-6.141123)*sailStates.p + (55.632355)*sailStates.q + (2.715758)*sailStates.r + (0.010847)*sailStates.de;
	CD = -9.098850;
	CY = (2.960966)*sailStates.alpha + (-0.032850)*sailStates.beta + (1.513981)*sailStates.p + (4.201350)*sailStates.q + (0.199617)*sailStates.r + (0.000956)*sailStates.de;

	Cl = (-1.336655)*sailStates.alpha + (-0.766793)*sailStates.beta + (-4.334632)*sailStates.p + (37.541759)*sailStates.q + (2.886948)*sailStates.r + (0.005885)*sailStates.de;
	Cm = (8.658915)*sailStates.alpha + (-3.393251)*sailStates.beta + (23.115921)*sailStates.p + (-241.805817)*sailStates.q + (-9.162743)*sailStates.r + (-0.082891)*sailStates.de;
	Cn = (-11.451998)*sailStates.alpha + (-0.134082)*sailStates.beta + (-4.092590)*sailStates.p + (17.810881)*sailStates.q + (-0.084335)*sailStates.r + (-0.000676)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end