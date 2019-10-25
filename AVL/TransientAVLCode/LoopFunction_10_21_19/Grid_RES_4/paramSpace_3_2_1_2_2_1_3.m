function [aeroForces] = paramSpace_3_2_1_2_2_1_3(sailStates,airStates)

	CL = (4.426276)*sailStates.alpha + (-0.063849)*sailStates.beta + (-2.942955)*sailStates.p + (36.994934)*sailStates.q + (-0.636886)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.426030;
	CY = (-0.080363)*sailStates.alpha + (-0.025002)*sailStates.beta + (-0.407536)*sailStates.p + (-0.100923)*sailStates.q + (0.026722)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.504443)*sailStates.alpha + (0.193961)*sailStates.beta + (-1.544795)*sailStates.p + (12.717428)*sailStates.q + (-0.707827)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.940113)*sailStates.alpha + (0.285215)*sailStates.beta + (10.328870)*sailStates.p + (-148.239975)*sailStates.q + (2.195291)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.069494)*sailStates.alpha + (-0.014242)*sailStates.beta + (0.991460)*sailStates.p + (-4.636016)*sailStates.q + (-0.012301)*sailStates.r + (-0.000038)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end