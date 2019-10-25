function [aeroForces] = paramSpace_4_2_2_3_3_1_1(sailStates,airStates)

	CL = (4.008208)*sailStates.alpha + (0.003610)*sailStates.beta + (-2.194320)*sailStates.p + (30.711077)*sailStates.q + (0.094823)*sailStates.r + (0.010101)*sailStates.de;
	CD = -0.128800;
	CY = (0.103043)*sailStates.alpha + (-0.024272)*sailStates.beta + (-0.197333)*sailStates.p + (0.684401)*sailStates.q + (0.039228)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.145344)*sailStates.alpha + (0.072542)*sailStates.beta + (-0.966450)*sailStates.p + (7.481993)*sailStates.q + (-0.129921)*sailStates.r + (0.000078)*sailStates.de;
	Cm = (-14.856319)*sailStates.alpha + (0.005299)*sailStates.beta + (7.966678)*sailStates.p + (-128.521423)*sailStates.q + (-0.376756)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.404220)*sailStates.alpha + (-0.016827)*sailStates.beta + (0.582874)*sailStates.p + (-3.620978)*sailStates.q + (-0.051867)*sailStates.r + (-0.000236)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end