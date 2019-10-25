function [aeroForces] = paramSpace_1_1_3_2_1_2_3(sailStates,airStates)

	CL = (3.680218)*sailStates.alpha + (-0.188361)*sailStates.beta + (-2.871442)*sailStates.p + (38.167343)*sailStates.q + (-0.936634)*sailStates.r + (0.010719)*sailStates.de;
	CD = 0.082290;
	CY = (-0.081068)*sailStates.alpha + (-0.023385)*sailStates.beta + (-0.140420)*sailStates.p + (-0.455226)*sailStates.q + (-0.027948)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.301977)*sailStates.alpha + (0.020948)*sailStates.beta + (-1.533539)*sailStates.p + (13.447646)*sailStates.q + (-0.638413)*sailStates.r + (0.001019)*sailStates.de;
	Cm = (-13.285398)*sailStates.alpha + (0.652104)*sailStates.beta + (9.624713)*sailStates.p + (-145.756378)*sailStates.q + (3.155518)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.355190)*sailStates.alpha + (0.010171)*sailStates.beta + (0.068841)*sailStates.p + (1.089844)*sailStates.q + (-0.052630)*sailStates.r + (0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end