function [aeroForces] = paramSpace_1_1_1_2_3_2_1(sailStates,airStates)

	CL = (3.793913)*sailStates.alpha + (-0.239902)*sailStates.beta + (-2.050664)*sailStates.p + (31.907309)*sailStates.q + (-1.028158)*sailStates.r + (0.010161)*sailStates.de;
	CD = 0.054430;
	CY = (0.112463)*sailStates.alpha + (-0.026377)*sailStates.beta + (-0.313684)*sailStates.p + (0.455226)*sailStates.q + (-0.062445)*sailStates.r + (0.000095)*sailStates.de;

	Cl = (1.121767)*sailStates.alpha + (0.074141)*sailStates.beta + (-0.869039)*sailStates.p + (7.405313)*sailStates.q + (-0.747314)*sailStates.r + (-0.000101)*sailStates.de;
	Cm = (-13.004023)*sailStates.alpha + (0.947644)*sailStates.beta + (6.585950)*sailStates.p + (-121.885399)*sailStates.q + (3.462235)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (-0.188091)*sailStates.alpha + (0.028050)*sailStates.beta + (0.545908)*sailStates.p + (-2.216225)*sailStates.q + (-0.005867)*sailStates.r + (-0.000151)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end