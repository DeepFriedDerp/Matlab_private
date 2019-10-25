function [aeroForces] = paramSpace_1_2_4_3_3_3_2(sailStates,airStates)

	CL = (3.995927)*sailStates.alpha + (-0.012918)*sailStates.beta + (-2.416849)*sailStates.p + (32.960587)*sailStates.q + (-0.437702)*sailStates.r + (0.010303)*sailStates.de;
	CD = -0.060380;
	CY = (0.059918)*sailStates.alpha + (-0.025446)*sailStates.beta + (0.025243)*sailStates.p + (0.489618)*sailStates.q + (0.005074)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.217248)*sailStates.alpha + (-0.041544)*sailStates.beta + (-1.154612)*sailStates.p + (9.512492)*sailStates.q + (-0.134775)*sailStates.r + (0.000342)*sailStates.de;
	Cm = (-14.786780)*sailStates.alpha + (0.004261)*sailStates.beta + (8.450769)*sailStates.p + (-134.148560)*sailStates.q + (1.471988)*sailStates.r + (-0.067617)*sailStates.de;
	Cn = (0.154204)*sailStates.alpha + (-0.007751)*sailStates.beta + (-0.252694)*sailStates.p + (1.353066)*sailStates.q + (-0.031791)*sailStates.r + (-0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end