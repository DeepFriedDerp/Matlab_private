function [aeroForces] = paramSpace_3_3_2_3_2_1_1(sailStates,airStates)

	CL = (4.204130)*sailStates.alpha + (0.032713)*sailStates.beta + (-2.289510)*sailStates.p + (32.071468)*sailStates.q + (-0.357300)*sailStates.r + (0.010776)*sailStates.de;
	CD = -0.156110;
	CY = (0.035117)*sailStates.alpha + (-0.024997)*sailStates.beta + (-0.250726)*sailStates.p + (0.065300)*sailStates.q + (0.016431)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.127917)*sailStates.alpha + (0.130828)*sailStates.beta + (-0.973800)*sailStates.p + (7.405426)*sailStates.q + (-0.422636)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.983792)*sailStates.alpha + (-0.143158)*sailStates.beta + (8.034419)*sailStates.p + (-130.047943)*sailStates.q + (1.219758)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (-0.278114)*sailStates.alpha + (-0.007609)*sailStates.beta + (0.608193)*sailStates.p + (-2.923267)*sailStates.q + (-0.008016)*sailStates.r + (-0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end