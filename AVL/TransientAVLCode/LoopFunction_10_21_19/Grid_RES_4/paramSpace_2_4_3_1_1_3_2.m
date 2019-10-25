function [aeroForces] = paramSpace_2_4_3_1_1_3_2(sailStates,airStates)

	CL = (7.234032)*sailStates.alpha + (-0.520913)*sailStates.beta + (-2.506312)*sailStates.p + (31.941927)*sailStates.q + (2.337748)*sailStates.r + (0.010359)*sailStates.de;
	CD = -2.828440;
	CY = (-0.194431)*sailStates.alpha + (-0.026414)*sailStates.beta + (1.256180)*sailStates.p + (-1.693495)*sailStates.q + (0.082275)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (2.595454)*sailStates.alpha + (-0.708238)*sailStates.beta + (-1.142323)*sailStates.p + (8.375797)*sailStates.q + (2.228504)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-17.166498)*sailStates.alpha + (2.059293)*sailStates.beta + (9.379715)*sailStates.p + (-136.946671)*sailStates.q + (-7.912060)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (0.823889)*sailStates.alpha + (-0.030535)*sailStates.beta + (-2.826664)*sailStates.p + (14.250008)*sailStates.q + (-0.034274)*sailStates.r + (0.000713)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end