function [aeroForces] = paramSpace_4_1_1_2_1_2_1(sailStates,airStates)

	CL = (3.907305)*sailStates.alpha + (0.178857)*sailStates.beta + (-2.052425)*sailStates.p + (31.763693)*sailStates.q + (1.004828)*sailStates.r + (0.010417)*sailStates.de;
	CD = 0.020530;
	CY = (-0.105077)*sailStates.alpha + (-0.026093)*sailStates.beta + (0.270985)*sailStates.p + (-0.455227)*sailStates.q + (-0.053853)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.112351)*sailStates.alpha + (-0.053732)*sailStates.beta + (-0.869991)*sailStates.p + (7.398629)*sailStates.q + (0.678347)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-13.588766)*sailStates.alpha + (-0.556226)*sailStates.beta + (6.612378)*sailStates.p + (-121.885399)*sailStates.q + (-3.329373)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.172933)*sailStates.alpha + (0.023366)*sailStates.beta + (-0.481571)*sailStates.p + (2.182622)*sailStates.q + (-0.005078)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end