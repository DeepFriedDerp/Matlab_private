function [aeroForces] = paramSpace_7_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.391904)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.065634)*sailStates.p + (38.327297)*sailStates.q + (0.795581)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.514330;
	CY = (0.208149)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.373805)*sailStates.p + (1.046668)*sailStates.q + (0.012943)*sailStates.r + (0.000228)*sailStates.de;

	Cl = (1.382264)*sailStates.alpha + (-0.229270)*sailStates.beta + (-1.622335)*sailStates.p + (13.445464)*sailStates.q + (0.801323)*sailStates.r + (0.001016)*sailStates.de;
	Cm = (-14.268531)*sailStates.alpha + (0.000000)*sailStates.beta + (10.621178)*sailStates.p + (-151.326889)*sailStates.q + (-2.685189)*sailStates.r + (-0.071886)*sailStates.de;
	Cn = (-0.275052)*sailStates.alpha + (-0.008006)*sailStates.beta + (-0.939783)*sailStates.p + (3.833210)*sailStates.q + (-0.002921)*sailStates.r + (-0.000190)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end