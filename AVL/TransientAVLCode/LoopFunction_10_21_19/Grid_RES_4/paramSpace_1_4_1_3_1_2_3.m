function [aeroForces] = paramSpace_1_4_1_3_1_2_3(sailStates,airStates)

	CL = (3.661583)*sailStates.alpha + (0.231311)*sailStates.beta + (-2.725251)*sailStates.p + (37.142525)*sailStates.q + (-0.967587)*sailStates.r + (0.010471)*sailStates.de;
	CD = 0.107880;
	CY = (-0.058735)*sailStates.alpha + (-0.025816)*sailStates.beta + (-0.194792)*sailStates.p + (-0.294837)*sailStates.q + (-0.038715)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.159870)*sailStates.alpha + (0.172160)*sailStates.beta + (-1.321267)*sailStates.p + (11.196958)*sailStates.q + (-0.677715)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-13.041919)*sailStates.alpha + (-0.922967)*sailStates.beta + (9.071232)*sailStates.p + (-141.543854)*sailStates.q + (3.296268)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.251078)*sailStates.alpha + (0.027116)*sailStates.beta + (0.207691)*sailStates.p + (0.252627)*sailStates.q + (-0.041537)*sailStates.r + (0.000081)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end