function [aeroForces] = paramSpace_1_3_2_2_3_3_2(sailStates,airStates)

	CL = (4.041908)*sailStates.alpha + (0.001839)*sailStates.beta + (-2.380296)*sailStates.p + (31.828621)*sailStates.q + (-0.161398)*sailStates.r + (0.009874)*sailStates.de;
	CD = -0.211070;
	CY = (0.090519)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.119606)*sailStates.p + (0.756270)*sailStates.q + (0.023764)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.158151)*sailStates.alpha + (-0.086626)*sailStates.beta + (-1.108830)*sailStates.p + (8.797759)*sailStates.q + (0.103629)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-14.744963)*sailStates.alpha + (0.003833)*sailStates.beta + (8.576459)*sailStates.p + (-133.768066)*sailStates.q + (0.601504)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.179671)*sailStates.alpha + (-0.016462)*sailStates.beta + (-0.490394)*sailStates.p + (2.334756)*sailStates.q + (-0.033032)*sailStates.r + (-0.000165)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end